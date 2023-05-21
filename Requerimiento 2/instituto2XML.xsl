<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <xsl:apply-templates select="ite"/>
  </xsl:template>

  <xsl:template match="ite">
    <instituto>
      <nombre>
        <xsl:value-of select="@nombre"/>
      </nombre>
      <web>
        <xsl:value-of select="@web"/>
      </web>
      <empresa>
        <xsl:value-of select="empresa"/>
      </empresa>
      <telefono>
        <xsl:value-of select="telefono"/>
      </telefono>
      <profesores>
        <xsl:apply-templates select="profesores/profesor"/>
      </profesores>
      <director>
        <nombre>
          <xsl:value-of select="director/nombre"/>
        </nombre>
        <despacho>
          <xsl:value-of select="director/despacho"/>
        </despacho>
      </director>
      <jefe_estudios>
        <nombre>
          <xsl:value-of select="jefe_estudios/nombre"/>
        </nombre>
        <despacho>
          <xsl:value-of select="jefe_estudios/despacho"/>
        </despacho>
      </jefe_estudios>
      <ciclos>
        <xsl:apply-templates select="ciclos/ciclo"/>
      </ciclos>
    </instituto>
  </xsl:template>

  <xsl:template match="profesor">
    <profesor>
      <id>
        <xsl:value-of select="id"/>
      </id>
      <nombre>
        <xsl:value-of select="nombre"/>
      </nombre>
    </profesor>
  </xsl:template>

  <xsl:template match="ciclo">
    <ciclo>
      <id>
        <xsl:value-of select="@id"/>
      </id>
      <nombre>
        <xsl:value-of select="nombre"/>
      </nombre>
      <grado>
        <xsl:value-of select="grado"/>
      </grado>
      <decretoTitulo>
        <xsl:attribute name="año">
          <xsl:value-of select="decretoTitulo/@año"/>
        </xsl:attribute>
      </decretoTitulo>
    </ciclo>
  </xsl:template>

</xsl:stylesheet>
