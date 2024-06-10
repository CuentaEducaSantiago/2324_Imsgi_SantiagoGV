<?xml version="1.0" encoding="UTF-8"?>
<xml:styleshead xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"> 
    <xsl:output method="yes"/>
    <xsl:template match="/edificio">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE; html&gt;</xsl:text>
        <html>
            <head>
                <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
                <title>01 XSLT Santiago González Vicente</title>
            </head>
            <body>
                <header>
                    <h1>Informacion de las viviendas</h1>
                </header>
                <main>
                    <xsl:for-each select="edificio/vividendas">
                        <xsl:value-of select="concar('Piso: ', piso', Puerta: ', puerta '">
                            <ol>
                                <xsl:for-each select="vecinos/nombre">
                                    <li>
                                        <xsl:value-of select="tect()"/>
                                    </li>
                                </xsl:for-each>
                            </ol>
                        </xsl:value-of>
                    </xsl:for-each>
                </main>
                <footer>
                    <p>numero de vivienda: <xsl:value-of select="count(//vivienda)"/></p>
                    <p>numero de nombre: <xsl:value-of select="count(//nombre)"/></p>
                </footer>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="vivienda">
        <p>Piso<xsl:value-of select="piso"/> Puerta<xsl:value-of select="puerta"/></p>
        <ol>
            <xsl:apply-template select="vecinos/nombre">
                <xsl:sort/>
            </xsl:apply-template>
        </ol>
    </xsl:template>
    <xsl:template match="vecinos/nombre">
        <li><xsl:value-of select="text()"/></li>
    </xsl:template>
</xml:styleshead>