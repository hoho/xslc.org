<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:block="http://xslc.org/XBEM/Block"
    xmlns:elem="http://xslc.org/XBEM/Element"
    xmlns:mod="http://xslc.org/XBEM/Modifier"
    exclude-result-prefixes=" block elem mod "
    version="1.0">


    <xsl:template match="block:b-code">
        <code>
            <xsl:call-template name="block:class" />
            <xsl:apply-templates mode="copy-content" />
        </code>
    </xsl:template>


    <xsl:template match="block:b-code[not(@mod:highlight)][@mod:type = 'pre']">
        <pre>
            <code>
                <xsl:call-template name="block:class" />
                <xsl:apply-templates mode="copy-content" />
            </code>
        </pre>
    </xsl:template>


    <xsl:template match="block:b-code[@mod:highlight]">
        <!-- When highlight modifier is set, the content is generated by
             Python build script. -->
        <xsl:apply-templates mode="copy-content" />
    </xsl:template>


</xsl:stylesheet>
