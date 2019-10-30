<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <%@include file="master/head.jsp" %>
        
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    
   <script>
    
    $(document).ready( function () {
        
    $('#ejemplo').DataTable(
            {
                language:{
                    
                    search: "Buscar:",
                    sInfoEmpty:"Mostrando registros del 0 al 0 de un total de 0 registros",
                    sInfo:"Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                    oPaginate: {
                                sFirst:    "Primero",
                                sLast:     "Último",
                                sNext:     "Siguiente",
                                sPrevious: "Anterior"
                                },
                    sInfoFiltered:   "(filtrado de un total de _MAX_ registros)",
                    sLengthMenu:     "Mostrar _MENU_ registros"
                }
            } 
                );
    
    } );
    
</script>
  
  
 
  

          <script>
      
      $(document).ready(function () {
        $('#tblComuna').DataTable(
                
                {
                language:{
                    
                    search: "Buscar:",
                    sInfoEmpty:"Mostrando registros del 0 al 0 de un total de 0 registros",
                    sInfo:"Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                    oPaginate: {
                                sFirst:    "Primero",
                                sLast:     "Último",
                                sNext:     "Siguiente",
                                sPrevious: "Anterior"
                                },
                    sInfoFiltered:   "(filtrado de un total de _MAX_ registros)",
                    sLengthMenu:     "Mostrar _MENU_ registros"
                }
            }
                
                
                
                );
        $('#tblCiudad').DataTable(
                
                 {
                language:{
                    
                    search: "Buscar:",
                    sInfoEmpty:"Mostrando registros del 0 al 0 de un total de 0 registros",
                    sInfo:"Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                    oPaginate: {
                                sFirst:    "Primero",
                                sLast:     "Último",
                                sNext:     "Siguiente",
                                sPrevious: "Anterior"
                                },
                    sInfoFiltered:   "(filtrado de un total de _MAX_ registros)",
                    sLengthMenu:     "Mostrar _MENU_ registros"
                }
            }
                
                
                
                );
        
    });
      
  </script>

    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <jsp:include page="./getAllRegion" flush="true"/>
        <jsp:useBean id="regiones" class="cl.fgutierrez.legalwork.entidades.Region" scope="page"></jsp:useBean>
        
        <jsp:include page="./getAllCiudades" flush="true"/>
        <jsp:useBean id="ciudades" class="cl.fgutierrez.legalwork.entidades.Ciudad" scope="page"/>
        
        <jsp:include page="./getAllComuna" flush="true"/>
        <jsp:useBean id="comunas" class="cl.fgutierrez.legalwork.entidades.Comuna" scope="page"></jsp:useBean>
        
        
          
        
        
        <c:choose>
            <c:when test="${sessionScope.usuarioConectado==null}">
                <jsp:forward page="login.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:useBean id="usuarioConectado" class="cl.fgutierrez.legalwork.dto.UsuarioPerfilDTO" scope="session"></jsp:useBean>  
                
                
                <%@include file="master/header.jsp" %>
                <%@include file="menu.jsp" %>
        
        
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Provincias y Comunas
      </h1>
     </section>

    <!-- Main content -->
    <section class="content"> 

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Maestro Ciudades y Comunas</h3>

        </div>
        <div class="box-body">
          <div class="col-md-6">
          <!-- general form elements -->
          <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title">Nueva Ciudad</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" name="frmCiudad" method="post" action="./getAllCiudades">
              <div class="box-body">
                             
                              
                <div class="form-group col-xs-6">
                  <label for="exampleInputPassword1">Region</label>
                  <select class="form-control" name="cmbRegion">
                      <option value="0">(Seleccione)</option>
                      <c:forEach items="${listaRegiones}" var="regiones">
                          <option value="${regiones.idRegion}"><c:out value="${regiones.nomRegion}"/></option>
                      </c:forEach>
                  </select>
                </div>
                  
                  <div class="form-group col-xs-6">
                  <label for="exampleInputPassword1">Nombre Ciudad</label>
                  <input type="text" class="form-control" id="exampleInputPassword1" name="txtNomCiudad">
                </div>
               
                
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-success">Crear</button>
              </div>
            </form>
          </div>
          <!-- /.box -->
          </div>
            
            
            
            
            
            <div class="col-md-6">
          <!-- general form elements -->
          <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title">Nueva Comuna</h3>
<!--              <div class="box-tools">
                <div class="input-group input-group-sm" style="width: 150px;">
                  <input type="text" name="table_search" class="form-control pull-right" placeholder="Buscar">

                  <div class="input-group-btn">
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                  </div>
                </div>
              </div>-->
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <form role="form" name="frmComuna" method="post" action="./getAllComuna">
              <div class="box-body">
                             
                              
                <div class="form-group col-xs-6">
                  <label for="exampleInputPassword1">Provincia</label>
                  <select class="form-control" name="cmbCiudad">
                      <option value="0">(Seleccione)</option>
                      <c:forEach items="${listarCiudades}" var="ciudades">
                          <option value="${ciudades.idCiudad}"><c:out value="${ciudades.nomCiudad}"/></option>
                      </c:forEach>
                  </select>
                </div>
                  
                  <div class="form-group col-xs-6">
                  <label for="exampleInputPassword1">Nombre Comuna</label>
                  <input type="text" class="form-control" id="exampleInputPassword1" name="txtNomComuna">
                </div>
               
                
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-success">Crear</button>
              </div>
            </form>
            </div>
            
          </div>
          <!-- /.box -->
    
           </div>
            
            
            
            
            <div class="col-md-6">
          <!-- general form elements -->
           <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Ciudades</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <table class="table table-condensed" id="tblCiudad">
                    <thead>
                <tr>
                  <th style="width: 10px">#</th>
                  <th>Nombre</th>
                  
                  <th style="width: 40px"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listarCiudades}" var="ciudad">
                <tr>
                  <td><c:out value="${ciudad.idCiudad}"/></td>
                  <td><c:out value="${ciudad.nomCiudad}"/></td>
                  <td><span class="badge bg-red">Editar</span></td>
                </tr>
                 </c:forEach>
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
            
          </div>
          <!-- /.box -->
    
           </div>
            
            
            
            
            <div class="col-md-6">
          <!-- general form elements -->
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Comunas</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
                <table class="table table-condensed" id="tblComuna">
                    <thead>
                <tr>
                  <th style="width: 10px">#</th>
                  <th>Nombre</th>
                  <th></th>
                </tr>
                    </thead>
                    <tbody>
                <tr>
                    <c:forEach items="${listarComuna}" var="comuna">  
                        <td><c:out value="${comuna.idComuna}"/></td>
                        <td><c:out value="${comuna.nomComuna}"/></td>
                  <td><span class="badge bg-red">Editar</span></td>
                </tr>
                </tbody>
                 </c:forEach>             
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
    
           </div>
            
            
            
            
            
        </div>
        <!-- /.box-body -->
        
        <!-- /.box-footer-->
      </div>
      
            <!-- /.box-body -->
             </section>
          </div>
      
      </div>
      
    
      
        
      <!-- /.box -->

   
    <!-- /.content -->
  </div>

                
              </c:otherwise>
        </c:choose>
  
 

 

    </body>
</html>
