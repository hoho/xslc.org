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
                        <xsl:apply-templates mode="copy-content" />
                    </xsl:when>
                    <xsl:otherwise>eXtra Space for Logs and Code<a href="/title/">*</a></xsl:otherwise>
                </xsl:choose>
            </h1>
        </header>
    </xsl:template>


</xsl:stylesheet>
