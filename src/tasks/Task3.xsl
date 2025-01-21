<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:key name="byName" match="Function | Procedure" use="@Name"/>
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <root>
            <Functions>
                <xsl:for-each select="//Function[count(key('byName', @Name)) > 1]">
                    <xsl:copy-of select="."/>
                </xsl:for-each>
            </Functions>
            <Procedures>
                <xsl:for-each select="//Procedure[count(key('byName', @Name)) > 1]">
                    <xsl:copy-of select="."/>
                </xsl:for-each>
            </Procedures>
        </root>
    </xsl:template>
</xsl:stylesheet>
