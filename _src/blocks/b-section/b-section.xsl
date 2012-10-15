<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:block="http://xslc.org/BEM/Block"
    xmlns:elem="http://xslc.org/BEM/Element"
    xmlns:mod="http://xslc.org/BEM/Modifier"
    exclude-result-prefixes=" block elem mod "
    version="1.0">


    <xsl:template match="block:b-section">
        <section>
            <xsl:call-template name="block:class" />
            <xsl:apply-templates select="elem:title" />
            <xsl:apply-templates select="elem:content" />
        </section>
    </xsl:template>


    <xsl:template match="block:b-section/elem:title">
        <h3>
            <xsl:call-template name="elem:class" />
            <xsl:apply-templates mode="copy-content" />
        </h3>
    </xsl:template>


    <xsl:template match="block:b-section/elem:content">
        <xsl:apply-templates mode="copy-content" />
    </xsl:template>


</xsl:stylesheet>
