<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
    <head>

        <title><xsl:value-of select="ite/@nombre"/></title>
        <link rel="stylesheet" href="estilos.css" />
    </head>
    <body>

    <div class="cabecera">
    <h1><xsl:value-of select="ite/@nombre"/></h1>
    <h2><a href= "{ite/@web}">Pagina Web</a></h2>
   </div>
   <nav class="barra_nav">
        <ul>
            <li><a class="enlace-navbar" href="#prof">Profesores del centro</a></li>
            <li><a class="enlace-navbar" href="#dire"> Direccion del centro</a></li>
            <li><a class="enlace-navbar" href="#estuof">Estudios ofertados</a></li>
            <li><a class="enlace-navbar" href="#contacto">Contcato</a></li>
        </ul>
    </nav>

    <div class="profesores" id="prof">
    <h2>Lista de profesores del centro:</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
        </tr>
        <xsl:for-each select="ite/profesores/profesor">
            <tr>
                <td><xsl:value-of select="id"/></td>
                <td><xsl:value-of select="nombre"/></td>
            </tr>
        </xsl:for-each>
    </table>
    </div>
    <div class="direccion" id="dire">
    <h2>Equipo de direccion del centro: </h2>
    <ul>
        <li>Director: <xsl:value-of select="ite/director/nombre"/></li>
        <li>Jefe de estudios: <xsl:value-of select="ite/jefe_estudios/nombre"/> </li>
    </ul>

    <h2>Dirección de los despachos del equipo directivo:</h2>
    <ol>
        <li>Director: <xsl:value-of select="ite/director/despacho"/></li>
        <li>Jefe de estudios: <xsl:value-of select="ite/jefe_estudios/despacho"/></li>
    </ol>
    </div>
    <h2>Ciclos ofertados</h2>

    <table>
        <tr>
            <th>Codigo del ciclo</th>
            <th>Nombre</th>
            <th>grado</th>
            <th>Año del decreto</th>
        </tr>
        <xsl:for-each select="ite/ciclos/ciclo">
        <tr>
            <td><xsl:value-of select="@id"/></td>
            <td><xsl:value-of select="nombre"/></td>
            <td><xsl:value-of select="grado"/></td>
            <td><xsl:value-of select="decretoTitulo/@año"/></td>
        </tr>

        </xsl:for-each>
    
    </table>

    <div class="contacto" id="contacto">
        <h2>Contacto</h2>

        <fieldset>
            <legend>Datos personales:</legend>
            <label for="nombre">Nombre: </label>
            <input id="nombre" type="text" name="nombre"/>
            <br/>

            <label for="apellidos">Apellidos:</label>
            <input id="apellidos" type="next" name="apellidos"/>
            <br/>

            <label for="curso">Curso interesado:</label>
            <select name="curso" id="lang">
            <xsl:for-each select="ite/ciclos/ciclo">
                <option value=""><xsl:value-of select="nombre"/></option>
            </xsl:for-each>
            </select>
            <br/>
        
            <label for="curso">Elige el profesor al que quieres realizar la consulta:</label>
            <br/>
            <xsl:for-each select="ite/profesores/profesor">
            <label for="id"><xsl:value-of select="nombre"/></label>
            <input type="radio" id="id" name="opcion" value="id"/>
            <br/>
            </xsl:for-each>
            <br/>
            <input type="submit" value="Enviar" />
        </fieldset>
    </div>
    </body>
    </html>
  </xsl:template>

</xsl:stylesheet>


            