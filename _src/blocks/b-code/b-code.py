from lxml import etree
from pygments import highlight
from pygments.lexers import get_lexer_by_name
from pygments.formatters import HtmlFormatter


def b_code_highlight(xbem):
    code_blocks = xbem.xml.xpath("//block:b-code[@mod:highlight]",
                                 namespaces=xbem.NAMESPACES)
    for c in code_blocks:
        if len(c) > 0:
            raise Exception("Highlighted b-code block can't contain nodes")
        lexer = get_lexer_by_name(
            c.attrib["{%s}highlight" % xbem.NAMESPACES["mod"]], stripall=True
        )
        mods = xbem.get_modifiers(c)
        for i in xrange(len(mods)):
            mods[i] = "b-code_%s_%s" % mods[i]
        mods.insert(0, "b-code")
        cssclass = " ".join(mods)
        nowrap = c.attrib.get("{%s}pre" % xbem.NAMESPACES["mod"]) != "yes"
        formatter = HtmlFormatter(linenos=False, nowrap=nowrap,
                                  cssclass=cssclass)
        new_text = highlight(c.text, lexer, formatter).strip(" \n\r\t")
        if nowrap:
            new_text = "<code class=\"%s\">%s</code>" % (cssclass, new_text)
        c.text = None
        c.append(etree.XML(new_text))
