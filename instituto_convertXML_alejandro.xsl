<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
    
      <centro>
        <xsl:attribute name="nombre">
          <xsl:value-of select="/ite/@nombre"/>
        </xsl:attribute>
        <xsl:attribute name="web">
          <xsl:value-of select="/ite/@web"/>
        </xsl:attribute>
        <xsl:attribute name="empresa">
          <xsl:value-of select="/ite/empresa"/>
        </xsl:attribute>
        <xsl:attribute name="telefono">
          <xsl:value-of select="/ite/telefono"/>
        </xsl:attribute>

        <docentes>
          <xsl:for-each select="ite/profesores/profesor">
            <docente>
              <xsl:attribute name="id">
                <xsl:value-of select="id"/>
              </xsl:attribute>
              <nombre><xsl:value-of select="nombre"/></nombre>
            </docente>
          </xsl:for-each>
        </docentes>

        <personal_directivo>
          <director>
            <nombre><xsl:value-of select="ite/director/nombre"/></nombre>
            <despacho><xsl:value-of select="ite/director/despacho"/></despacho>          
          </director>

          <jefe_estudios>
            <nombre><xsl:value-of select="ite/jefe_estudios/nombre"/></nombre>
            <despacho><xsl:value-of select="ite/jefe_estudios/despacho"/></despacho>          
          </jefe_estudios>
        </personal_directivo>

        <oferta_formativa>
          <xsl:for-each select="ite/ciclos/ciclo">
            <ciclo>
              <xsl:attribute name="codigo">
                <xsl:value-of select="concat(@id, '-', decretoTitulo/@año)"/>
              </xsl:attribute>
              <xsl:attribute name="tipo_ciclo">
                <xsl:value-of select="grado"/>
              </xsl:attribute>
              <nombre><xsl:value-of select="nombre"/></nombre>
            </ciclo>
          </xsl:for-each>
        </oferta_formativa>

      </centro>
    </xsl:template>
</xsl:stylesheet>