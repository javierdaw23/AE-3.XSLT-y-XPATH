<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <edix>
            <datos_contacto>
                <nombre><xsl:value-of select="ite/@nombre"/></nombre>
                <web><xsl:value-of select="ite/@web"/></web>
                <empresa><xsl:value-of select="ite/empresa"/></empresa>
                <telefono><xsl:value-of select="ite/telefono"/></telefono>
            </datos_contacto>

            <direccion>
                <director>
                    <xsl:attribute name="nombre">
                        <xsl:value-of select="ite/director/nombre"/>
                    </xsl:attribute>
                    <despacho><xsl:value-of select="ite/director/despacho"/></despacho>
                </director>
                <jefe_estudios>
                    <xsl:attribute name="nombre">
                        <xsl:value-of select="ite/jefe_estudios/nombre"/>
                    </xsl:attribute>
                    <despacho><xsl:value-of select="ite/jefe_estudios/despacho"/></despacho>
                </jefe_estudios>
            </direccion>

            <docencia>
                <xsl:for-each select="ite/profesores/profesor">
                    
                    <profesor>
                        <xsl:attribute name="id">
                            <xsl:value-of select="id"/>
                        </xsl:attribute>
                        <nombre><xsl:value-of select="nombre"/></nombre>
                    </profesor>

                </xsl:for-each>
            </docencia>

            <formacion>
                <xsl:for-each select="ite/ciclos/ciclo">

                    <ciclo>
                        <xsl:attribute name="id">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                        <xsl:attribute name="año">
                            <xsl:value-of select="decretoTitulo/@año"/>
                        </xsl:attribute>
                        <nombre><xsl:value-of select="nombre"/></nombre>
                        <grado><xsl:value-of select="grado"/></grado>
                    </ciclo>

                </xsl:for-each>
            </formacion>

        </edix>
    </xsl:template>

</xsl:stylesheet>