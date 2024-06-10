<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="../../lib/plantillahtml.xsl"/>
    <xsl:output method="text" omit-xml-declaration="yes"/>
  <xsl:template match="ethernets">
    <xsl:text>ethernets:</xsl:text>
    <xsl:text>&#xa;   </xsl:text>
    <xsl:value-of select="name"/>
    <xsl:text>:</xsl:text>
    <xsl:text>&#xa;      addresses:</xsl:text>
    <xsl:text>&#xa;         </xsl:text>
    <xsl:value-of select="addresses"/>
    <xsl:text>&#xa;   </xsl:text>
    <xsl:if test="gateway4">
      <xsl:text>      routes:</xsl:text>
      <xsl:text>&#xa;         to: default</xsl:text>
      <xsl:text>&#xa;         via: </xsl:text>
      <xsl:value-of select="gateway4"/>
      <xsl:text>&#xa;   </xsl:text>
    </xsl:if>
    <xsl:if test="nameservers">
      <xsl:text>      nameservers:</xsl:text>
      <xsl:text>&#xa;         addresses:</xsl:text>
      <xsl:for-each select="nameservers/addresses">
        <xsl:text>&#xa;            </xsl:text>
        <xsl:value-of select="."/>
      </xsl:for-each>
    </xsl:if>
    <xsl:text>&#xa;</xsl:text>
  </xsl:template>
  <xsl:template match="network">
    <xsl:apply-templates select="ethernets"/>
  </xsl:template>
</xsl:stylesheet>


