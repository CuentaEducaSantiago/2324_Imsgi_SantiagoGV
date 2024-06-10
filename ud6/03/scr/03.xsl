<?xml version="1.0" encoding="UTF-8"?>


<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../../lib/plantillahtml.xsl"/>
    <xsl:output method="html"/>

    <xsl:template match="/">
        <xsl:call-template name="escribirDoctype"/>
        <html>
            <head>
                <xsl:call-template name="escribirMeta"/>
                <title>02 XSLT Santiago González Vicente</title>
            </head>
            <body>
                <header>
                    <h1>Horario escolar <xsl:value-of select="horario/curso"/></h1>
                    <h2>CFGS Desarrollo Aplicaciones Web <br/> Curso 1º</h2>
                </header>
                <nav>
                    <ul>
                        <xsl-apply-templates select="horario/modulos/modulo" mode="menu"/>
                    </ul>
                </nav>
                <main>
                    <xsl:apply-templates select="horario/modulos/modulo" mode="tablas"/>
                </main>
                <footer>
                    
                </footer>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="horario/modulos/modulo" mode="menu">
        <li>
            <a href="{concat('#',sigla)}">
                <xsl:value-of select="sigla"/>
            </a>
        </li>
    </xsl:template>
    <xsl:template match="horario/modulos/modulo" mode="tablas">
        <article id="{sigla}">
            <h3>
                <xsl:value-of select="sigla"/>
            </h3>
            <table>
                    <thead>
                        <tr>
                            <th>Horario</th>
                            <th>Lunes</th>
                            <th>Martes</th>
                            <th>Miércoles</th>
                            <th>Jueves</th>
                            <th>Viernes</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="//dia">
                            <xsl:with-param name="paramSigla" select="sigla"/>
                        </xsl:apply-templates>
                    </tbody>
                
            </table>
        </article>
    </xsl:template>
    <xsl:template match="//dia">
        <xsl:param name="paramSigla"/>
        <tr>
            <td><xsl:value-of select="@hora"/></td>
            <xsl:for-each select="dia_sem">
                <td colspan="{@num}">
                    <xsl:if test="text()=$paramSigla">
                        <xsl:value-of select="text()"/>
                    </xsl:if>
                </td>
            </xsl:for-each>
        </tr>
    </xsl:template>
</xsl:stylesheet>
