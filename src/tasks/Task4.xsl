<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <Objects>
            <xsl:for-each select="//Object[number(@ID) mod 2 = 0]">
                <xsl:sort select="@ID" data-type="number"/>
                <xsl:copy-of select="."/>
            </xsl:for-each>
        </Objects>
    </xsl:template>
</xsl:stylesheet>
