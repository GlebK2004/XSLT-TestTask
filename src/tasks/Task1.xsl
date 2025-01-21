<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@*[not(name()='java_package' and .='')] | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="Procedure[not(node())] | Function[not(node())]"/>
</xsl:stylesheet>
