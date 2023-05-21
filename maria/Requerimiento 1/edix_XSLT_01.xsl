<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:template match="/">
        <html>
            <header>
                <title id="titulo">AE-3. XSLT y XPATH</title>
                <link rel="stylesheet" href="estilos.css"/>
            </header>

            <body>
                <div id="cabecera">
                <h1><xsl:value-of select="ite/@nombre"/></h1>
                </div>

                <div class="contenedor_ppal">
                    <div class="contenedor_izquierda">
                        <h3> Información sobre profesores </h3>
                        <div>
                            <table class="tabla_profesores">
                                <thead class="thead">
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre</th>
                                    </tr>
                                </thead>
                                <tbody class="tbody">
                                    <xsl:for-each select="ite/profesores/profesor">
                                        <tr>
                                            <td><xsl:value-of select="id"/></td>
                                            <td><xsl:value-of select="nombre"/></td>
                                        </tr>
                                    </xsl:for-each>
                                </tbody>
                            </table>
                        </div>

                        <h3>Información sobre dirección educativa </h3>
                        <div>
                            <table border="3" class="tabla_direccion">
                                <tr class="thead">
                                    <th>Nombre Director</th>
                                    <th>Despacho</th>
                                </tr>
                                    <tr class="tbody">
                                        <td><xsl:value-of select="ite/director/nombre"/></td>
                                        <td><xsl:value-of select="ite/director/despacho"/></td>
                                    </tr>
                                <tr class="thead">
                                    <th>Nombre Jefe de Estudios</th>
                                    <th>Despacho</th>
                                </tr>
                                    <tr class="tbody">
                                        <td><xsl:value-of select="/ite/jefe_estudios/nombre"/></td>
                                        <td><xsl:value-of select="/ite/jefe_estudios/despacho"/></td>
                                    </tr>
                            </table>
                        </div>

                        <h3>Relación de ciclos formativos</h3>
                        <div id="ciclos">
                            <xsl:for-each select="/ite/ciclos/ciclo">
                                <ol>
                                    <li><b><xsl:value-of select="nombre"/></b>
                                        <ul>
                                            <li>Siglas: <xsl:value-of select="@id"/></li>
                                            <li>Grado:  <xsl:value-of select="grado"/></li>
                                            <li>Año: <xsl:value-of select="decretoTitulo/@año"/></li>
                                        </ul>
                                    </li>
                                </ol>
                            </xsl:for-each>
                        </div>
                    </div>

                    <div class="contenedor_derecha">
                        <h3>Formulario de contacto</h3>
                        <div id="formulario">
                            <form action="procesarPeticion.jsp" method="post">
                                <fieldset>
                                    <legend> Introduce tus datos personales </legend>
                                    
                                    <div>
                                        <label for="nombre">Nombre: </label>
                                        <input id="nombre" type="text" name="nombre"/>
                                    </div>

                                    <div>
                                        <label for="apellidos">Apellidos: </label>
                                        <input id="apellidos" type="text" name="apellidos"/>
                                    </div>                           

                                    <div>
                                        <label for="fecha_nacimiento">Fecha de nacimiento: </label>
                                        <input id="fecha_nacimiento" type="date" name="fecha_nacimiento"/>
                                    </div>

                                    <div>
                                        <label for="email">Email: </label>
                                        <input id="email" type="email" name="email"/>
                                    </div>

                                    <div>
                                        <label for="telefono">Teléfono: </label>
                                        <input id="telefono" type="tel" name="telefono"/>
                                    </div>

                                    <div>
                                        <label for="solicitud">Indique cuales son los grados de los que desea recibir información: </label>
                                        <br/>
                                        <input type="checkbox" name="solicitud"/> <xsl:value-of select="ite/ciclos/ciclo[1]/@id"/> <br/>
                                        <input type="checkbox" name="solicitud"/><xsl:value-of select="ite/ciclos/ciclo[2]/@id"/><br/>
                                        <input type="checkbox" name="solicitud"/><xsl:value-of select="ite/ciclos/ciclo[3]/@id"/><br/>
                                    </div>

                                    <div>
                                    <label for="comunicacion">Indique con quién desea contactar   </label>
                                    <select name="comunicacion">
                                            <option value="F"><xsl:value-of select="ite/profesores/profesor[1]/nombre"/></option>
                                            <option value="R"><xsl:value-of select="ite/profesores/profesor[2]/nombre"/></option>
                                            <option value="RA"><xsl:value-of select="ite/profesores/profesor[3]/nombre"/></option>
                                            <option value="T"><xsl:value-of select="ite/profesores/profesor[4]/nombre"/></option>
                                    </select> 
                                    </div>
                                    <br/>

                                    <div>
                                        <input type="submit" value="Enviar datos"/>
                                        <input type="reset" value="Limpiar formulario"/>
                                    </div>

                                </fieldset>
                            </form>
                        </div>
                    </div>

                </div>
            </body>
            <br/>
            <footer>
                <h1>Datos de contacto</h1>
                 <div id="pie_pagina_img">
                    <img src="img/edix.jfif"/>
                </div>
                <div id="pie_pagina">
                    <p>Empresa: <xsl:value-of select="ite/empresa"/></p>
                    <p>Teléfono: <xsl:value-of select="ite/telefono"/></p>
                    <p>Página web: <a href= "{ite/@web}">https://institutotecnologico.edix.com</a> </p>
                </div>

            </footer>
        </html>
    </xsl:template>
</xsl:stylesheet>