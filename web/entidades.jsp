<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="master/head.jsp" %>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        
        <jsp:include page="./getAllCiudades" flush="true"/>
        <jsp:useBean id="ciudades" class="cl.fgutierrez.legalwork.entidades.Ciudad" scope="page"></jsp:useBean>
        
        
       
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
        Entidades
      </h1>
     </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Maestro de Entidades</h3>

        </div>
        <div class="box-body">
          <div class="col-md-6">
          <!-- general form elements -->
          <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title">Nueva Entidad</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" name="frmUsuario" method="post" action="./getEntidad">
              <div class="box-body">
                <div class="form-group col-xs-6">
                  <label for="exampleInputEmail1">Nombre</label>
                  <input type="text" class="form-control" id="exampleInputEmail1" name="txtNombre">
                </div>
                  <div class="form-group col-xs-6">
                  <label for="exampleInputEmail1">Direccion</label>
                  <input type="text" class="form-control" id="exampleInputEmail1" name="txtDireccion">
                </div>
                  <div class="form-group col-xs-6">
                  <label for="exampleInputPassword1">Telefono</label>
                  <input type="text" class="form-control" id="exampleInputPassword1" name="txtFono">
                 </div>
                  
                  <div class="form-group col-xs-6">
                   <label for="exampleInputPassword1">Ciudad</label>
                   <select class="form-control" name="cmbCiudad" id="cmbCiudad">
                      <option value="0">(Seleccione)</option>
                      <c:forEach items="${listarCiudades}" var="ciudad">
                          <option value="${ciudad.idCiudad}"><c:out value="${ciudad.nomCiudad}"/> </option>
                          
                      </c:forEach>
                     
                    </select>
                  </div>
                  
                  <div class="form-group col-xs-6">
                   <label for="exampleInputPassword1">Comuna</label>
                    <select class="form-control" name="cmbComuna" id="cmbComuna">
                      <option value="0">(Seleccione)</option>
                      
                     
                    </select>
                  </div>
                  <div class="form-group col-xs-6">
                  <label for="exampleInputPassword1">Correo</label>
                  <input type="email" class="form-control" id="exampleInputPassword1" name="txtEmail">
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
              <h3 class="box-title">Editar Entidad</h3>
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
              <table class="table table-striped table-hover">
                <tr>
                  <th>Nombre</th>
                  <th>Direccion</th>
                  <th>Comuna</th>
                  <th style="width: 40px"></th>
                </tr>
               
              </table>
            </div>
            
          </div>
          <!-- /.box -->
    
           </div>
            
        </div>
   
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->
 
    </section>
    <!-- /.content -->
    
   
    
    
  </div>

              
                
                            
        
        
      
              </c:otherwise>
        </c:choose>
        
        <script>
            
$(document).ready(function() {
    
    
    // Obtener estados
        $.ajax({
        // Obtener municipios
        $("#cmbCiudad").change(function(){
        var estado = $("#cmbCiudad option:selected").val();
        $.ajax({
        type: "POST",
        url: "./comXCity",
        data: { id_ciudad : estado } 
        }).done(function(data){
        $("#cmbComuna").html(data);
        });
        });



            });
        });   
        
        
        </script>





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
