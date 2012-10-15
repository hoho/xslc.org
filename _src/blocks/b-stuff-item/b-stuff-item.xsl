<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:block="http://xslc.org/BEM/Block"
    xmlns:elem="http://xslc.org/BEM/Element"
    xmlns:mod="http://xslc.org/BEM/Modifier"
    exclude-result-prefixes=" block elem mod "
    version="1.0">


    <xsl:template match="block:b-stuff-item">
        <div>
            <xsl:call-template name="block:class" />
            <div class="b-stuff-item__inner">
                <xsl:apply-templates select="elem:title" />
                <xsl:apply-templates select="elem:desc" />
            </div>
        </div>
    </xsl:template>


    <xsl:template match="block:b-stuff-item/elem:title">
        <h3>
            <xsl:call-template name="elem:class" />
            <a href="{../@href}"><xsl:apply-templates mode="copy-content" /></a>
        </h3>
    </xsl:template>


    <xsl:template match="block:b-stuff-item/elem:desc">
        <p>
            <xsl:call-template name="elem:class" />
            <xsl:apply-templates mode="copy-content" />
        </p>
    </xsl:template>


</xsl:stylesheet>
