<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:block="http://xslc.org/BEM/Block"
    xmlns:elem="http://xslc.org/BEM/Element"
    xmlns:mod="http://xslc.org/BEM/Modifier"
    exclude-result-prefixes=" block elem mod "
    version="1.0">


    <xsl:template match="block:b-contents">
        <ul>
            <xsl:call-template name="block:class" />
            <xsl:apply-templates select="elem:item" />
        </ul>
    </xsl:template>


    <xsl:template match="block:b-contents/elem:item">
        <li>
            <xsl:call-template name="elem:class" />
            <a href="{@href}"><xsl:value-of select="text()" /></a>
        </li>
    </xsl:template>


</xsl:stylesheet>
