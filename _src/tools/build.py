import os
from sys import argv
from lxml import etree
from copy import deepcopy

def get_modifiers(node):
    prefix = "{%s}" % "http://xslc.org/BEM/Modifier"
    ret = []
    for key, value in node.attrib.iteritems():
        if key.startswith(prefix):
            ret.append((key[len(prefix):], value))
    return ret

def get_dependencies(filename):
    ret = ["i-jquery/i-jquery__bem", "i-common/i-common"]
    namespaces = {"block": "http://xslc.org/BEM/Block",
                  "elem": "http://xslc.org/BEM/Element"}
    xml = etree.parse(filename)
    blocks = xml.xpath("//block:*", namespaces=namespaces)
    for block in blocks:
        blockname = block.xpath("local-name()")
        mods = get_modifiers(block)
        # b-block/b-block
        ret.append("%s/%s" % (blockname, blockname))
        for mod in mods:
            # b-block/b-block_mod_val
            ret.append("%s/%s_%s_%s" % (blockname, blockname, mod[0], mod[1]))
            # b-block/_mod/b-block_mod_val
            ret.append("%s/_%s/%s_%s_%s" % (blockname, mod[0],
                                            blockname, mod[0], mod[1]))
        blockcopy = deepcopy(block)
        blockcopyblocks = blockcopy.xpath(".//block:*", namespaces=namespaces)
        for b in blockcopyblocks:
            b.getparent().remove(b)
        elems = blockcopy.xpath(".//elem:*", namespaces=namespaces)
        for elem in elems:
            elemname = elem.xpath("local-name()")
            # b-block__elem
            ret.append("%s__%s" % (blockname, elemname))
            # b-block/elem/b-block__elem
            ret.append("%s/%s/%s__%s" % (blockname, elemname, blockname,
                                         elemname))
            mods = get_modifiers(elem)
            for mod in mods:
                # b-block__elem_mod_val
                ret.append("%s__%s_%s_%s" % (blockname, elemname,
                                             mod[0], mod[1]))
                # b-block/elem/b-block__elem_mod_val
                ret.append("%s/%s/%s__%s_%s_%s" % (blockname, elemname,
                                                   blockname, elemname,
                                                   mod[0], mod[1]))
                # b-block/elem/_mod/b-block__elem_mod_val
                ret.append("%s/%s/_%s/%s__%s_%s_%s" % \
                    (blockname, elemname, mod[0], blockname, elemname,
                     mod[0], mod[1]))
    return ret

def get_filenames(dir):
    filenames = []
    def visit(_, dirname, names):
        for name in names:
            filename = os.path.join(dirname, name)
            if os.path.isfile(filename) and filename.endswith(".xml"):
                filenames.append(filename)
    os.path.walk(dir, visit, None)
    return filenames

def get_dependencies_dict(dir):
    ret = {}
    prevcwd = os.getcwd()
    os.chdir(dir)
    filenames = get_filenames(".")
    os.chdir(prevcwd)
    for filename in filenames:
        deps = get_dependencies(os.path.join(dir, filename))
        ret[filename] = deps
    return ret

class FileResolver(etree.Resolver):
    def resolve(self, url, pubid, context):
        return self.resolve_filename(url, context)

def get_xsl_transform(path, deps):
    include = "<xsl:include href=\"%s\" />"
    filenames = []
    for dep in deps:
        filename = os.path.normpath(os.path.join(path, "%s.xsl" % dep))
        if os.path.isfile(filename):
            filenames.append(include % filename)
    parser = etree.XMLParser()
    parser.resolvers.add(FileResolver())
    xsl = etree.XML("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n" \
        "<xsl:stylesheet xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\"" \
        " version=\"1.0\">\n    %s\n" \
        "</xsl:stylesheet>" % "\n    ".join(filenames), parser)
    return etree.XSLT(xsl)

def merge_dependencies(deps_dict):
    appended = {}
    ret = []
    for deps in deps_dict.values():
        for dep in deps:
            if not dep in appended:
                appended[dep] = True
                ret.append(dep)
    return ret

def get_css_or_js_content(path, deps, css):
    ext = "css" if css else "js"
    ret = []
    for dep in deps:
        filename = os.path.normpath(os.path.join(path, "%s.%s" % (dep, ext)))
        if os.path.isfile(filename):
            f = open(filename)
            content = f.read()
            f.close()
            ret.append("\n\n/* Begin of %s. */" % filename)
            ret.append(content)
            ret.append("/* End of %s. */\n\n" % filename)
    return "\n".join(ret)

PAGES_PATH = argv[1]
BLOCKS_PATH = argv[2]
RET_PATH = argv[3]

deps_dict = get_dependencies_dict(PAGES_PATH)
for filename, deps in deps_dict.iteritems():
    dir = os.path.normpath(os.path.join(RET_PATH, os.path.dirname(filename)))
    try:
        os.makedirs(dir)
    except:
        pass
    htmlfilename = \
        os.path.normpath(os.path.join(RET_PATH, "%s.html" % filename[:-4]))
    xmlfilename = os.path.normpath(os.path.join(PAGES_PATH, filename))
    xslt = get_xsl_transform(BLOCKS_PATH, deps)
    parser = etree.XMLParser(remove_blank_text=True)
    xml = etree.parse(xmlfilename, parser)
    f = open(htmlfilename, "w")
    f.write(str(xslt(xml)))
    f.close()

deps = merge_dependencies(deps_dict)
cssjspath = os.path.normpath(os.path.join(RET_PATH, "cssjs"))
cssfilename = os.path.join(cssjspath, "css.css")
jsfilename = os.path.join(cssjspath, "js.js")
css = get_css_or_js_content(BLOCKS_PATH, deps, True)
js = get_css_or_js_content(BLOCKS_PATH, deps, False)
if css or js:
    try:
        os.makedirs(cssjspath)
    except:
        pass
if css:
    f = open(cssfilename, "w")
    f.write(css)
    f.close()
if js:
    f = open(jsfilename, "w")
    f.write(js)
    f.close()
