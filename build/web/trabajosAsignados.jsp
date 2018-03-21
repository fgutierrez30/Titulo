<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="master/head.jsp" %>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <jsp:include page="./getAllTrabajos" flush="true"/>
        <jsp:useBean id="trabajosPen" class="cl.fgutierrez.legalwork.dto.TrabajoTpTrabajoClienteDTO" scope="page"></jsp:useBean>
        
        
        <c:choose>
            <c:when test="${sessionScope.usuarioConectado==null}">
                <jsp:forward page="login.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:useBean id="usuarioConectado" class="cl.fgutierrez.legalwork.dto.UsuarioPerfilDTO" scope="session"></jsp:useBean>  
                
                
                <%@include file="master/header.jsp" %>
                <%@include file="menu.jsp" %>
        
                   <div class="content-wrapper">
            <section class="content-header">
                <h1>
                 Trabajos Asignados
                </h1>
            </section>
           
            <section class="content">
                
                <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Trabajos Asignados en Proceso</h3>

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
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tr>
                  <th>ID</th>
                  <th>Cliente</th>
                  <th>Tipo de Trabajo</th>
                  <th>Descripcion</th>
                  <th>Fecha de Inicio</th>
                  <th>Fecha de Entrega</th>
                  <th>Estado</th>
                </tr>
                <c:forEach items="${listTrabajosPen}" var="trabajosPen">
                <tr>
                    <td><c:out value="${trabajosPen.trabajo.idTrabajo}"/></td>
                    <td><c:out value="${trabajosPen.cliente.razonSocial}"/></td>
                    <td><c:out value="${trabajosPen.tpTrabajo.nomTipoTrabajo}"/></td>
                    <td><c:out value="${trabajosPen.trabajo.detTrabajo}"/></td>
                    <td><fmt:formatDate pattern="dd-MM-yyyy" value="${trabajosPen.trabajo.fechaInicioTrabajo}"/></td>
                    <td><fmt:formatDate pattern="dd-MM-yyyy" value="${trabajosPen.trabajo.fechaFinTrabajo}"/></td>
                    <td><span class="label label-success"><c:out value="${trabajosPen.trabajo.estadoTrabajo}"/></span></td>
                    
                  <td><button data-toggle="modal" data-target="#view-modal" data-id="${trabajosPen.trabajo.idTrabajo}" id="getTrabajo" class="btn btn-sm btn-danger">Editar</button></td>
                                  
                </tr>
                </c:forEach>
             
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
      </div>
                
            </section>
            
            
        </div>
        
      <div id="view-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
  <div class="modal-dialog"> 
     <div class="modal-content">  
   
        <div class="modal-header"> 
           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button> 
           <h4 class="modal-title">
           <i class="glyphicon glyphicon-user"></i> Asignar Trabajo
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
	
	$(document).on('click', '#getTrabajo', function(e){
		
		e.preventDefault();
		
		var uid = $(this).data('id');   // it will get id of clicked row
		
		$('#dynamic-content').html(''); // leave it blank before ajax call
		$('#modal-loader').show();      // load ajax loader
		
		$.ajax({
			url: './asignaTrabajo',
			type: 'GET',
			data: 'id_trabajo='+uid,
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
