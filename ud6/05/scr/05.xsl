<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../../lib/plantillahtml.xsl"/>
    <xsl:output method="html"/>
    <xsl:template match="/root">
        <root>
            <xsl:apply-templates select="row"/>
        </root>
    </xsl:template>
    <xsl:template match="row">
        <row>
            <xsl:template match="@*"/>
        </row>
    </xsl:template>
    <xsl:template match="@*">
        <xsl:attribute name="{name()}">
            <xsl:value-of select="current()"/>
        </xsl:attribute>
    </xsl:template>
</xsl:stylesheet>

