<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:block="http://xslc.org/BEM/Block"
    xmlns:elem="http://xslc.org/BEM/Element"
    xmlns:mod="http://xslc.org/BEM/Modifier"
    exclude-result-prefixes=" block elem mod "
    version="1.0">


    <xsl:template match="block:b-footer">
        <footer>
            <xsl:call-template name="block:class" />
            <a href="mailto:dakota@brokenpipe.ru">Marat Abdullin</a>
        </footer>
    </xsl:template>


</xsl:stylesheet>