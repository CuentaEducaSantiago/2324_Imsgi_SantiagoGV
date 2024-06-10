<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 01.xsl
    Created on : 09 de abril de 2024, 9:08
    Author     : beatruiz
    Description:
        Transformacion de 01.xml en un archivo con la lista de nombres y apellidos
		Usando una sola plantilla (xsl:template)
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../../lib/plantillahtml.xsl"/>
    <xsl:output method="html"/>  
    
    <xsl:template match="/edificio">
        <xsl:call-template name="escribirDoctype"/>
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html%gt;</xsl:text>
        <html>
            <head>
                <xsl:call-template name="escribirMeta"/>
                <link rel="shortcut icon" type="image/jpg" href="webroot/media/images/favicon/favicon.ico"/>
                <title>01 XSLT Santiago González Vicente</title>
                <xsl:call-template name="escribirTitulo">
                    <xsl:with-param name="titulo" select="01 XSLT Santiago González Vicente"/>
                </xsl:call-template>
            </head>
            <body>
                <h1>Información de las viviendas</h1>
                <main>
                <xsl:apply-templates select="vivienda"/>    <!--esto es relativo al contexto-->
                </main>
                <footer>
                    <p>Número de viviendas:<xsl:value-of select="count(//vivienda)"/></p>
                    <p>Número total de vecinos:<xsl:value-of select="count(//nombre)"/></p>
                </footer>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="vivienda">
        <p>Piso:<xsl:value-of select="piso"/>   Puerta:<xsl:value-of select="puerta"/>   </p>
        <ol>
            <xsl:apply-templates select="vecinos/nombre">
                <xsl:sort/>
            </xsl:apply-templates>
        </ol>
    </xsl:template>
    
    <xsl:template match="vecinos/nombre">
        <li><xsl:value-of select="text()"/></li>
    </xsl:template>
    
</xsl:stylesheet>