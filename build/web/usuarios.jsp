<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="master/head.jsp" %>
    </head>
    

    
    <body class="hold-transition skin-blue sidebar-mini">
        
        
        <jsp:include page="./getAllUsr" flush="true"/>
        <jsp:useBean id="usuarios" class="cl.fgutierrez.legalwork.dto.UsuarioPerfilDTO" scope="page"></jsp:useBean>
        <jsp:include page="./getAllPerfiles" flush="true"/>
        <jsp:useBean id="perfil" class="cl.fgutierrez.legalwork.entidades.Perfil" scope="page"/>
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
        Usuarios
      </h1>
     </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Maestro de Usuarios</h3>

        </div>
        <div class="box-body">
          <div class="col-md-6">
          <!-- general form elements -->
          <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title">Nuevo Usuario</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" name="frmUsuario" method="post" action="./registraUsuario">
              <div class="box-body">
                <div class="form-group col-xs-6">
                  <label for="exampleInputEmail1">Nombre</label>
                  <input type="text" class="form-control" id="exampleInputEmail1" name="txtNombre">
                </div>
                  <div class="form-group col-xs-6">
                  <label for="exampleInputEmail1">Apellido</label>
                  <input type="text" class="form-control" id="exampleInputEmail1" name="txtApell">
                </div>
                  <div class="form-group col-xs-6">
                  <label for="exampleInputEmail1">Rut</label>
                  <input type="text" class="form-control" id="exampleInputEmail1" name="txtRut">
                </div>
                <div class="form-group col-xs-6">
                  <label for="exampleInputPassword1">Nombre de Usuario</label>
                  <input type="text" class="form-control" id="exampleInputPassword1" name="txtNomUsr">
                </div>
                  <div class="form-group col-xs-6">
                  <label for="exampleInputPassword1">Contraseña</label>
                  <input type="password" class="form-control" id="exampleInputPassword1" name="txtPass">
                </div>
                <div class="form-group col-xs-6">
                  <label for="exampleInputPassword1">Tipo de Usuario</label>
                  <select class="form-control" name="cmbPerfil">
                      <option value="0">(Seleccione)</option>
                      <c:forEach items="${listaPerfiles}" var="perfil">
                          <option value="${perfil.idPerfil}"><c:out value="${perfil.nomPerfil}"/></option>
                      </c:forEach>
                  </select>
                </div>
                  
                  <div class="form-group col-xs-6">
                  <label for="exampleInputPassword1">E-Mail</label>
                  <input type="email" class="form-control" id="exampleInputPassword1" name="txtEmail">
                </div>
               <div class="form-group col-xs-6">
                  <label for="exampleInputEmail1">Telefono</label>
                  <input type="text" class="form-control" id="exampleInputEmail1" name="txtFono">
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
              <h3 class="box-title">Edicion de Usuarios</h3>

            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <table class="table table-striped table-hover">
                <tr>
                  <th style="width: 10px">ID</th>
                  <th>Nombre Completo</th>
                  <th>Tipo de Usuario</th>
                  <th>Estado</th>
                  <th style="width: 40px"></th>
                </tr>
                <c:forEach items="${listadoUsr}" var="usuarios">
                <tr>
                    
                                      
                    <td><c:out value="${usuarios.usr.idUsr}"/></td>
                    
                    <td><c:out value="${usuarios.usr.nomUsr} ${usuarios.usr.apellUsr}"/></td>
                  <td>
                      <c:out value="${usuarios.perfil.nomPerfil}"/>
                  </td>
                  
                  <td>
                      <c:set var="estado" scope="session" value="${usuarios.usr.estadoUsr}"/>
                      <c:choose>
                          <c:when test="${estado==1}">
                              Activo
                          </c:when>
                          <c:when test="${estado==0}">
                              Bloqueado
                          </c:when>
                      </c:choose>
                          
                      
                  </td>
                  
                  <td><button data-toggle="modal" data-target="#view-modal" data-id="${usuarios.usr.idUsr}" id="getUsr" class="btn btn-sm btn-danger">Editar</button></td>
                  
                
                  
                </tr>

                </c:forEach>
                  
                
              </table>
            </div>
            
          </div>
          <!-- /.box -->
    
           </div>
        </div>
        <!-- /.box-body -->
        
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
 
         
                
    <div id="view-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
  <div class="modal-dialog"> 
     <div class="modal-content">  
   
        <div class="modal-header"> 
           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button> 
           <h4 class="modal-title">
           <i class="glyphicon glyphicon-user"></i> Modificar Usuario
           </h4> 
        </div> 
            
        <div class="modal-body">                     
           <div id="modal-loader" style="display: none; text-align: center;">
               
              
               
               
               <!-- ajax loader -->
           <img src="ajax-loader.gif">
           </div>
                            
           <!-- mysql data will be load here -->                          
           <div id="dynamic-content"></div>
        </div> 
        
                        
    </div> 
  </div>
</div>      
                
       

  
              </c:otherwise>
        </c:choose>  

<script>
$(document).ready(function(){
	
	$(document).on('click', '#getUsr', function(e){
		
		e.preventDefault();
		
		var uid = $(this).data('id');   // it will get id of clicked row
		
		$('#dynamic-content').html(''); // leave it blank before ajax call
		$('#modal-loader').show();      // load ajax loader
		
		$.ajax({
			url: './modificarUsuario',
			type: 'GET',
			data: 'id_usr='+uid,
			dataType: 'html'
		})
		.done(function(data){
			console.log(data);	
			$('#dynamic-content').html('');    
			$('#dynamic-content').html(data); // load response 
			$('#modal-loader').hide();		  // hide ajax loader	
		})
		.fail(function(){
			$('#dynamic-content').html('<i class="glyphicon glyphicon-info-sign"></i> Something went wrong, Please try again...');
			$('#modal-loader').hide();
		});
		
	});
	
});

</script>


    </body>
   
    
    
  
</html>

