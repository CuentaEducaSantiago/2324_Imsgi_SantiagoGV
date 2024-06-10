<?xml version="1.0" encoding="UTF-8"?>
<!--
    Document   : 02.xsl
    Created on : 16 de abril de 2024, 9:27
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>
    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/listatickets">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE; html&gt;</xsl:text>
        <xsl:apply-templates select="comment()"/>
        <html>
            <head>
                <title>02 XSLT Santiago González Vicente</title>
                <meta name="description" content="Información de tockets"/>
                <meta name="keywords" content="xslt, xml, html, css"/>
                <meta name="author" content="Santiago"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <meta name="shortcout icon" href="../../webroot/media/images/favicon/favicon.ico" type="image/x-icon"/>
                <meta name="stylesheet" type="text/css" href="css/estilos.css"/>
            </head>
            <body>
                <header>
                    <h1>Informacion del ticket</h1>
                </header>
                <div>Número de tickets: <xsl:value-of select="count(ticket)"/></div>
                <div>Total de tickets: <xsl:value-of select="sum(ticket)"/></div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="comment{}">
        <xsl:comment><xsl:value-of select="current{}"/></xsl:comment>
        <xsl:text>&#10</xsl:text>
    </xsl:template>
    <xsl:template match="ticket">
        <h3>Tickets: <xsl:value-of select="numero"/></h3>
        <table>
            <caption>Fecha del ticket: <xsl:value-of select="fecha"/></caption>
            <thead>
                <tr>
                    <th></th>
                    <th>Producto</th>
                    <th>Precio</th>
                </tr>
            </thead>
            <tbody>
            <zsl:aply-templates select="producto"/>
            <tr>
                <td colspan="2">Total</td>
                <td><xs:value-of select="total"/></td>
            </tr>
            </tbody>
        </table>
    </xsl:template>
</xsl:stylesheet>