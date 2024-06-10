<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 08.xsl
    Created on : 3 de junio de 2024, 11:35
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:import href="../../lib/plantillahtml.xsl"/>
    <xsl:template match="/prediccion">
        <html>
            <head>
                <title>Santiago González Vicente</title>
            </head>
            <body>
                <h2>Predicción Por Municipios</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Dia</th>
                            <th>Prob. precip</th>
                            <th>Estado del cielo</th>
                            <th>Temperatura(ºC)</th>
                            <th>Viento(km/h)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>
                                <xsl:apply-templates select="dia[fecha]"/>
                            </th>
                            <th>
                                <xsl:apply-templates select="dia/prob_precipitacion"/>
                            </th>
                            <th>
                                
                            </th>
                            <th>
                                <xsl:apply-templates select="dia/temperatura/maxima"/><p>/</p><xsl:apply-templates select="dia/temperatura/minima"/>
                            </th>
                            <th>
                                <xsl:apply-templates select="dia/viento/direccion"/>
                            </th>
                        </tr>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
