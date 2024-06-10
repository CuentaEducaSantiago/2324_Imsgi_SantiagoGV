<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../../lib/plantillahtml.xsl"/><xsl:output method="html"/>
        <xsl:template match="/examen">
            <xsl:call-template name="escribirDoctype"/>
            <html>
                <head>
                    <xsl:call-template name="escribirMeta"/>
                    <title>06-XSLT Santiago González Vicente</title>
                </head>
                <body>
                    <header>
                        <xsl:apply-templates select="datos"/>
                    </header>
                    <main>
                        <form action="examen.php" methods="get">
                            <xsl:apply-templates select="preguntas/pregunta"/>
                            <xsl:if test="@corregido='no'">
                                <fielset class="botones">
                                    <input type="button" value="Enviar formulario"/>
                                    <input type="button" value="Limpiar"/>
                                </fielset>
                            </xsl:if>
                        </form>
                    </main>
                </body>
            </html>
        </xsl:template>
        <xsl:template match="datos">
            <h1><xsl:value-of select="nombreCiclo"/></h1>
            <h2><xsl:value-of select="nombreModulo"/></h2>
            <h3><xsl:value-of select="concat('Fecha: ', fecha/dia, ' de ', fecha/mes, ' de ', fecha/anyo)"/></h3>
        </xsl:template>
        <xsl:template match="preguntas/pregunta">
            <fielset>
                <ol>
                    <li><xsl:value-of select="concat(@id, ',-', enunciado)"/></li>
                    <xsl:apply-templates select="respuesta/respuestas"/>
                   
                </ol>
            </fielset>
        </xsl:template>
        <xsl:template match="respuesta/respuestas">
            <xsl:variable name="idPregunta" select="../../@id"/>
            <div>
                <label>
                    <input type="radio" name="{concat('p',$idPregunta)}" value="{concat($idPregunta,position())}"> 
                    <xsl:variable name="@corregido"/>             
                        <xsl:if test="$corregido='si'">
                            <xsl:attribute name="disabled"/>
                            <xsl:if test="@correcta='correcta'"> 
                                <xsl:attribute name="checked"/>
                            </xsl:if>
                        </xsl:if>
                    </input>
                    <xsl:value-of select="current()"/>
                </label>
            </div>
        </xsl:template>
</xsl:stylesheet>

