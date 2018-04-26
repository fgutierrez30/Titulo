<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="master/head.jsp" %>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <jsp:include page="./getAllClient" flush="true"/>
        <jsp:useBean id="clientes" class="cl.fgutierrez.legalwork.entidades.Cliente" scope="page"></jsp:useBean>
       
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
        Clientes
      </h1>
     </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Maestro de Clientes</h3>

        </div>
        <div class="box-body">
          <div class="col-md-6">
          <!-- general form elements -->
          <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title">Nuevo Cliente</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" name="frmUsuario" method="post" action="./getAllClient">
              <div class="box-body">
                <div class="form-group col-xs-6">
                  <label for="exampleInputEmail1">Rut</label>
                  <input type="text" class="form-control" id="exampleInputEmail1" name="txtRut">
                </div>
                  <div class="form-group col-xs-6">
                  <label for="exampleInputEmail1">Razon Social</label>
                  <input type="text" class="form-control" id="exampleInputEmail1" name="txtRazonSocial">
                </div>
                  <div class="form-group col-xs-6">
                  <label for="exampleInputPassword1">E-Mail</label>
                  <input type="email" class="form-control" id="exampleInputPassword1" name="txtEmail">
                 </div>
                <div class="form-group col-xs-6">
                  <label for="exampleInputPassword1">Telefono</label>
                  <input type="text" class="form-control" id="exampleInputPassword1" name="txtFono">
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
              <h3 class="box-title">Edicion de Clientes</h3>
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
                  <th>Rut</th>
                  <th>Razon Social</th>
                  <th>Correo</th>
                  <th style="width: 40px"></th>
                </tr>
                <c:forEach items="${listaCliente}" var="clientes">
                <tr>
                    <td><c:out value="${clientes.rutCliente}"/></td>
                    <c:url value="./actualizaCliente" var="modificaCliente">
                        <c:param name="rutCliente" value="${clientes.rutCliente}"/>
                    </c:url>
                    <td><c:out value="${clientes.razonSocial}"/></td>
                  <td>
                      <c:out value="${clientes.correoCliente}"/>
                  </td>
                  <td><button data-toggle="modal" data-target="#view-modal" data-id="${usuarios.usr.idUsr}" id="getCliente" class="btn btn-sm btn-danger">Editar</button></td>
                </tr>
                </c:forEach>
                
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

   
  <div id="view-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog"> 
            <div class="modal-content">  

               <div class="modal-header"> 
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button> 
                  <h4 class="modal-title">
                  <i class="glyphicon glyphicon-user"></i> Modificar Cliente
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
	
	$(document).on('click', '#getCliente', function(e){
		
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
