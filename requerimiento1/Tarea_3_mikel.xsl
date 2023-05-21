<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">   
           <html>

<head>

    <title>Instituto Edix</title>
     <link rel="stylesheet" href="style.css"></link>
 
 

       
</head>

<body>
    <header>
     <div id="contenedor-barra-cabecera">
            <div id="barra-cabecera">  
               <div id="contenedor-logo-home">
               <a id="enlace-home" href="#"></a>
                <img id="logo-home" src="img/logo_edix.png" alt=""></img>
                 <h1 id="nombre-web"><xsl:value-of select="ite/@nombre"/></h1>   
             </div>
            <nav>
                 <ul class="nav-desplegable">
                            <li> <a href="#">Menú</a>
                                <ul class="lista-nav">
                                    <li><a class="enlace-navbar" href="#"> Profesores</a></li>
                                    <li><a class="enlace-navbar" href=""> Ciclos</a></li>
                                    <li><a class="enlace-navbar" href="#"> Empresa</a></li>
                                    <li><a class="enlace-navbar" href="https://institutotecnologico.edix.com"> Publicaciones</a></li>
                                    <li><a class="enlace-navbar" href="#"> Localizacion</a></li>
                                    <li><a class="enlace-navbar" href="formulari"> Contacto</a></li>
                                </ul>
                            </li>
                     </ul>
            </nav>
      </div>
      </div>
   </header>
  <div id="div-vacio-header"></div>

    <main>
     
      <div class="contenedor-ppal">
<xsl:for-each select="ite">

        <section>
            <h3 class="titulo-1">Profesorado del Instituto</h3>
            <article>
               <table border="5">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Profesor</th>
                    
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="profesores/profesor">
                        <tr>
                            <!-- Con arroba (@) accedemos a los atributos -->
                            <td><xsl:value-of select="id"/></td>
                            <td><xsl:value-of select="nombre"/></td>
                           
                        </tr>
                    </xsl:for-each> <!-- Fin de for each de Profesores-->
                </tbody>
            </table>
            <h3>Direccion del Instituto</h3>
            <table border ="4">
             <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Despacho</th>
                    </tr>
            </thead>
              <tbody>
              <xsl:for-each select="director">
                        <tr>
                           
                            <td><xsl:value-of select="nombre"/></td>
                            <td><xsl:value-of select="despacho"/></td>
                           
                        </tr>
                    </xsl:for-each> <!-- Fin de for each de director-->
             </tbody>  
             <tbody>
              <xsl:for-each select="jefe_estudios">
                        <tr>
                            <!-- Con arroba (@) accedemos a los atributos -->
                            <td><xsl:value-of select="nombre"/></td>
                            <td><xsl:value-of select="despacho"/></td>
                           
                        </tr>
                    </xsl:for-each> <!-- Fin de for each de escala-->
             </tbody>  
             </table>
           
    </article>
        </section>
<section>
            <h3>Grados del Instituto</h3>
            <article>
               <table border="2">
                <thead>
                    <tr>
                        <th>Tipo de ciclo</th>
                        <th>Nombre</th>
                        <th>Grado</th>
                        <th>Año</th>
                    
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="ciclos/ciclo">
                        <tr>
                            <!-- Con arroba (@) accedemos a los atributos -->
                            <td><xsl:value-of select= "@id"/></td>
                            <td><xsl:value-of select="nombre"/></td>
                            <td><xsl:value-of select="grado"/></td>
                             <td><xsl:value-of select="decretoTitulo/@año"/></td>
                           
                        </tr>
                    </xsl:for-each> <!-- Fin de for each de ciclos -->
                </tbody>
            </table>
           
        </article>
</section>
</xsl:for-each>
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
    </main>

    <aside>
    </aside>

    <footer>
     
            <div class="footer-three-col">
              
                <div class="contenedor-footer footer-col-1">
                    <div class="tit-cont-footer"> Empresa</div>
                   
                        <div class="content-cont-footer">
                            <div class="fila-col-footer">
                             <img class="icono-ubicacion" src="img/green_heaven_iconolocalizacion.svg" alt=""/>
                         
                                <p class="p-con-icono ubicacion"><xsl:value-of select="ite/empresa"/></p>
                                
                            </div>
                        </div>
                </div>

                <div class="contenedor-footer footer-col-2">
                    <div class="tit-cont-footer">Contacto</div>
                    <div class="contenedor-footer">
                        <div class="fila-col-footer">
                        <img id="icono-mail" src="img/icono_contacto.svg" alt=""/>
                            <p class="p-con-icono mail"><xsl:value-of select="ite/@web"/></p>
                        </div>

                        <div class="fila-col-footer">
                         <img class="icono-telefono" src="img/icono_telefono.svg" alt=""/>
                            <p class="p-con-icono tel"><xsl:value-of select="ite/telefono"/></p>
                        </div>
                    </div>
                </div>
            </div>
          
    </footer>

           </body>

           </html>
        </xsl:template>
    </xsl:stylesheet>  