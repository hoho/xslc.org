<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:block="http://xslc.org/BEM/Block"
    xmlns:elem="http://xslc.org/BEM/Element"
    xmlns:mod="http://xslc.org/BEM/Modifier"
    exclude-result-prefixes=" block elem mod "
    version="1.0">


    <xsl:output method="html" />


    <xsl:template match="@mod:*">
        <xsl:text> </xsl:text>
        <xsl:choose>
            <xsl:when test="local-name(.) = 'js' and . = 'yes'">js</xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="local-name(..)" />
                <xsl:text>_</xsl:text>
                <xsl:value-of select="local-name(.)" />
                <xsl:text>_</xsl:text>
                <xsl:value-of select="." />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <xsl:template match="elem:*/@mod:*">
        <xsl:text> </xsl:text>
        <xsl:value-of select="local-name(ancestor::block:*[1])" />
        <xsl:text>__</xsl:text>
        <xsl:value-of select="local-name(..)" />
        <xsl:text>_</xsl:text>
        <xsl:value-of select="local-name(.)" />
        <xsl:text>_</xsl:text>
        <xsl:value-of select="." />
    </xsl:template>


    <xsl:template name="block:class">
        <xsl:attribute name="class">
            <xsl:value-of select="local-name(.)" />
            <xsl:apply-templates select="@mod:*" />
        </xsl:attribute>
    </xsl:template>


    <xsl:template name="elem:class">
        <xsl:attribute name="class">
            <xsl:value-of select="local-name(ancestor::block:*[1])" />
            <xsl:text>__</xsl:text>
            <xsl:value-of select="local-name(.)" />
            <xsl:apply-templates select="@mod:*" />
        </xsl:attribute>
    </xsl:template>


</xsl:stylesheet>
