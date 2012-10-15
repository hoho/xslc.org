<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:block="http://xslc.org/BEM/Block"
    xmlns:elem="http://xslc.org/BEM/Element"
    xmlns:mod="http://xslc.org/BEM/Modifier"
    exclude-result-prefixes=" block elem mod "
    version="1.0">


    <xsl:template match="block:b-comments">
        <div id="disqus_thread">
            <xsl:call-template name="block:class" />
            <script>
                <xsl:text>var disqus_shortname = 'xslc'</xsl:text>
                <xsl:if test="@id"><xsl:text>, disqus_identifier = '</xsl:text><xsl:value-of select="@id" />'</xsl:if>
                <xsl:text>;</xsl:text>
            </script>
            <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
        </div>
    </xsl:template>


</xsl:stylesheet>
