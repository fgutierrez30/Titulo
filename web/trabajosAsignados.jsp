<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="master/head.jsp" %>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
          <jsp:include page="./getAsigXID?idUsr=${usuarioConectado.usr.idUsr}" flush="true"/>
           <jsp:useBean id="trabajosAsig" class="cl.fgutierrez.legalwork.dto.AsignaDTO" scope="page"></jsp:useBean>
        
        
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
                  <th>Usuario Encargado</th>
                  <th>Fecha de Asignacion</th>
                  <th>Trabajo</th>
                  <th>Fecha Vencimiento</th>
                </tr>
                <c:forEach items="${listadoAsig}" var="asigUsr">
                <tr>
                    <td><c:out value="${asigUsr.usr.nomUsr}"/> <c:out value="${asigUsr.usr.apellUsr}"/></td>
                    <td><fmt:formatDate pattern="dd-MM-yyyy" value="${asigUsr.asig.fechaAsignacion}"/></td>
                    <td><c:out value="${asigUsr.tbj.detTrabajo}"/></td>
                    <td><fmt:formatDate pattern="dd-MM-yyyy" value="${asigUsr.tbj.fechaFinTrabajo}"/></td>
                
                    <td><a href="./DetTrabajo?idTbj=${asigUsr.tbj.idTrabajo}"><span class="badge bg-red">Editar</span></a></td>
                                  
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
