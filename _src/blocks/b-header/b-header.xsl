<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:block="http://xslc.org/XBEM/Block"
    xmlns:elem="http://xslc.org/XBEM/Element"
    xmlns:mod="http://xslc.org/XBEM/Modifier"
    exclude-result-prefixes=" block elem mod "
    version="1.0">


    <xsl:template match="block:b-header">
        <header>
            <xsl:call-template name="block:class" />
            <h1>
                <xsl:choose>
                    <xsl:when test="node()">
                        <xsl:apply-templates />
                    </xsl:when>
                    <xsl:otherwise>Xyz Stu Lmn Cde<a href="/title/">*</a></xsl:otherwise>
                </xsl:choose>
            </h1>
        </header>
    </xsl:template>


    <xsl:template match="block:b-header/elem:github">
        <a href="{@href}">
            <xsl:call-template name="elem:class" />
            <xsl:text>View on GitHub</xsl:text>
        </a>
    </xsl:template>


    <xsl:template match="block:b-header/elem:title">
        <xsl:apply-templates />
    </xsl:template>


</xsl:stylesheet>
