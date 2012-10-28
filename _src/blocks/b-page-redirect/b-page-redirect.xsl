<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:block="http://xslc.org/XBEM/Block"
    xmlns:elem="http://xslc.org/XBEM/Element"
    xmlns:mod="http://xslc.org/XBEM/Modifier"
    exclude-result-prefixes=" block elem mod "
    version="1.0">


    <xsl:template match="block:b-page-redirect">
        <xsl:text disable-output-escaping="yes">&lt;!doctype html&gt;</xsl:text>
        <html>
            <head>
                <meta http-equiv="content-type" content="text/html; charset=utf-8" />
                <meta http-equiv="refresh" content="0;url={@href}" />
            </head>
        </html>
    </xsl:template>


</xsl:stylesheet>
