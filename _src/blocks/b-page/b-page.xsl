<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:block="http://xslc.org/XBEM/Block"
    xmlns:elem="http://xslc.org/XBEM/Element"
    xmlns:mod="http://xslc.org/XBEM/Modifier"
    exclude-result-prefixes=" block elem mod "
    version="1.0">


    <xsl:template match="block:b-page">
        <xsl:text disable-output-escaping="yes">&lt;!doctype html&gt;</xsl:text>
        <html>
            <xsl:call-template name="block:class" />
            <head>
                <title>
                    <xsl:if test="elem:title">
                        <xsl:value-of select="elem:title" />
                        <xsl:text> — </xsl:text>
                    </xsl:if>
                    <xsl:text>Xyz Stu Lmn Cde</xsl:text>
                </title>
                <link rel="stylesheet" href="/cssjs/css.css" />
                <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
                <script src="/cssjs/js.js"></script>
            </head>
            <body>
                <xsl:apply-templates select="elem:content" />
            </body>
        </html>
    </xsl:template>


    <xsl:template match="block:b-page/elem:content">
        <div>
            <xsl:call-template name="elem:class" />
            <xsl:apply-templates />
        </div>
    </xsl:template>


</xsl:stylesheet>
