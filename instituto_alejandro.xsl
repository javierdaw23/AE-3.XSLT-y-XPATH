<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Nos situamos en el nodo raíz -->
    <xsl:template match="/">    
        <html>
            <head>
                <title><xsl:value-of select="/ite/@nombre"></xsl:value-of></title>
                <link rel="stylesheet" href="styles.css" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
            </head>

        <body>
            <div class="main-container">
                <main>
                    <div class="header-container"> 
                            <h1 class="page-title" id="homepage"><xsl:value-of select="/ite/@nombre"/></h1>

                            <h2 class="subtitle"> Te damos la bienvenida a <span class="text_highlight"><xsl:value-of select="/ite/@nombre"/></span>, un centro de educación que pertenece al grupo <span class="text_highlight"><xsl:value-of select="/ite/empresa"/></span>, y sobre el que puedes econtrar información en detalle en este <a class="content-link" href="{/ite/@web}">enlace</a>.<br/>
                            Selecciona el apartado que quieres conocer:</h2>
                            <nav>
                                <ul class="nav-list">
                                    <li><a href="#oferta-formativa">Oferta formativa</a></li>
                                    <li><a href="#organigrama">Organigrama</a></li>
                                    <li><a href="#docentes">Docentes</a></li>
                                    <li><a href="#contacto">Contacto</a></li>                         
                                </ul>
                            </nav>
                    </div>    



                        <section class="section" id="oferta-formativa"> 
                            <h3 class="section-title">Oferta formativa</h3>
                            <div class="section-container">
                                <p>La oferta formativa de nuestro centro cuenta con numerosos grados, a continuación puedes ver una tabla resumen con cada uno:</p>
                                <table class="default-table">
                                    <thead>
                                        <th>Nombre titulación</th>
                                        <th>Tipo de grado</th>
                                        <th>Decreto del titulo</th>
                                    </thead>
                                    <tbody>
                                        <xsl:for-each select="ite/ciclos/ciclo">
                                            <tr>
                                                <td><xsl:value-of select="nombre"/></td>
                                                <td><xsl:value-of select="grado"/></td>
                                                <td><xsl:value-of select="decretoTitulo/@año"/></td>
                                            </tr>
                                        </xsl:for-each>    
                                    </tbody>
                                </table>
                                <p><a href="#homepage">Volver arriba</a></p>
                        </div>
                        </section>

                        <section class="section" id="organigrama"> 
                            <h3 class="section-title">Organigrama</h3>
                            <div class="section-container">
                                <p>Si necesitas realizar alguna gestión o tienes una consulta del plan de estudios, este es el organigrama del centro:</p>
                                <table class="default-table">
                                    <thead>
                                        <th>Puesto</th>
                                        <th>Nombre</th>
                                        <th>Despacho</th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                                                                                                <td>Director</td>
                                            <td><xsl:value-of select="/ite/director/nombre"/></td>
                                            <td><xsl:value-of select="/ite/director/despacho"/></td>
                                        </tr>
                                        <tr>
                                            <td>Jefe de estudios</td>
                                            <td><xsl:value-of select="/ite/jefe_estudios/nombre"/></td>
                                            <td><xsl:value-of select="/ite/jefe_estudios/despacho"/></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <p><a href="#homepage">Volver arriba</a></p>
                            </div>
                        </section>

                        <section class="section" id="docentes"> 
                            <h3 class="section-title">Docentes</h3>
                            <div class="section-container">
                                <p>Te presentamos a los docentes que te acompañarán a lo largo de la titulación</p>                            
                                <ol class="lista-docentes">
                                    <xsl:for-each select="ite/profesores/profesor">
                                        <li><xsl:value-of select="nombre"/></li>                              
                                    </xsl:for-each>
                                </ol>
                                <p><a href="#homepage">Volver arriba</a></p>
                            </div>
                        </section>

                        <section class="section" id="contacto"> 
                            <h3 class="section-title">Formulario de contacto</h3>
                            <div class="section-container">
                                <p>Utiliza este formulario para enviarnos cualquier duda que tengas sobre los estudios que ofrecemos</p>                            
                                    <form action="procesarPeticion.jsp" method="get">
                                        <fieldset class="form-contacto">
                                            <legend>Formulario de contacto</legend>
                                            <label for="nombre">Nombre: </label>
                                            <input id="nombre" type="text" name="edad"/>
                                            <label for="email">Correo electrónico:</label>
                                            <input id="email" type="email"/>

                                            <label for="estudios">Estudios interesados</label>
                                                <xsl:for-each select="ite/ciclos/ciclo">
                                                    <div class="opcion-estudios">
                                                        <input type="checkbox" name="estudios" value="{/@id}"/><xsl:value-of select="nombre"/> 
                                                    </div>  
                                                </xsl:for-each>
                                            
                                            <label for="consulta"> Consulta
                                            </label>
                                            <textarea name="consulta"/>

                                            <input type="submit" value="Enviar datos" />
                                        </fieldset>
                                    </form>

                                <p><a href="#homepage">Volver arriba</a></p>
                            </div>
                        </section>

                </main>
            </div>
        </body>

        </html>
    </xsl:template>
</xsl:stylesheet>
  