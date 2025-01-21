<?xml version="1.0" encoding="UTF-8"?>


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:strip-space elements="*"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:key name="paramByName" match="Param" use="@Name"/>
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <Objects>
            <xsl:for-each select="//Param[count(key('paramByName', @Name)) > 1]">
                <Param>
                    <xsl:attribute name="Name">
                        <xsl:value-of select="concat(@Name, @pos)"/>
                    </xsl:attribute>
                    <xsl:for-each select="@*[name() != 'Name' and name() != 'pos']">
                        <xsl:copy/>
                    </xsl:for-each>

                </Param>
            </xsl:for-each>
        </Objects>
    </xsl:template>


</xsl:stylesheet>
