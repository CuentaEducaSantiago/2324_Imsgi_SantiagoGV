<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 02.xsl
    Created on : 15 de abril de 2024, 17:51
    Author     : Beatriz
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/listatickets">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html%gt;</xsl:text>
        <xsl:text>$#10;</xsl:text>
        <xsl:apply-templates select="comment()"/>
        <html>
            <head>
                <meta charset="utf-8"/>
                <meta name="description" content="Información de tickets"/>
                <meta name="author" content="Beatriz"/>
                <meta name="keywords" content="xslt, xml, html, css"/>
                <meta name="viewport" content="widh=device-width, initial-scale=1.0"/>
                <link rel="stylesheet" href="css/estilos.css" type="text/css"/>
                <link rel="shortcut icon" type="image/jpg" href="webroot/media/images/favicon/favicon.ico"/>
                <title>02 XSLT Santiago González Vicente</title>
            </head>
            <body>
                <header>
                    <h1>Información de tickets</h1>
                </header>
                <main>
                    <h2>Listado de tickets</h2>
                    <xsl:apply-templates select="ticket"/>
                        <article>
                            <h3>Tickets: <xsl:value-of select="numero"/></h3>
                            <table>
                                <caption>Fecha del ticket: <xsl:value-of select="concat('Fecha del ticket:',fecha)"/></caption>
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Producto</th>
                                        <th>Precio</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <xsl:apply-templates select="producto"/>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="2">Total</td>
                                        <td><xsl:value-of select="total"/></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </article>  
                    </xsl:template>
                    <xsl:template match="producto">
                        <tr>
                            <td><xsl:value-of select="nombre/text()"/></td>
                            <td><xsl:value-of select="precio/text()"/></td>
                        </tr>
                    </xsl:template>
                </main>
                <footer>
                    <p>NUMERO DE TICKETS: <xsl:value-of select="count(ticket)"/> </p>
                    <p>TOTAL DE TICKETS: <xsl:value-of select="sum(ticket/total)"/> </p>
                </footer>
            </body>
        </html>
    <xsl:template match="comment()">
        <xsl:comment><xsl:value-of select="current()"/></xsl:comment>
        <xsl:text>$#10;</xsl:text>
    </xsl:template>
    <xsl:template match="ticket">
        <article>
            <h3>Tickets: <xsl:value-of select="numero"/></h3>
        <xsl:text>$#10;</xsl:text>
        </article>
    </xsl:template>
</xsl:stylesheet>
