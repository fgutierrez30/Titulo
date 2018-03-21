<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%@include file="master/head.jsp" %>
    </head>
    <body>
        
        <jsp:include page="./getAllUsr" flush="true"/>
        <jsp:useBean id="usuarios" class="cl.fgutierrez.legalwork.dto.UsuarioPerfilDTO" scope="page"></jsp:useBean>
        
       
          <form role="form" name="frmActUsr" method="post" action="./asignaTrabajo" >
                                
              <div class="box-body"> 
                <div class="form-group col-xs-6">
                  <label for="exampleInputEmail1">ID</label>
                  <c:out value="${objTbj.getTrabajo().getIdTrabajo()}"/>
                </div>
                                
                 <div class="form-group col-xs-6">
                  <label for="exampleInputEmail1">Cliente</label>
                  <c:out value="${objTbj.getCliente().getRazonSocial()}"/>
                </div>
                  <div class="form-group col-xs-6">
                  <label for="exampleInputEmail1">Tipo de Trabajo</label>
                  <c:out value="${objTbj.getTpTrabajo().getNomTipoTrabajo()}"/>
                </div>
                <div class="form-group col-xs-6">
                  <label for="exampleInputPassword1">Descripcion</label>
                  <c:out value="${objTbj.getTrabajo().getDetTrabajo()}"/>
                </div>
                  <div class="form-group col-xs-6">
                  <label for="exampleInputPassword1">Fecha Inicio:</label> 
                  <fmt:formatDate pattern="dd-MM-yyyy" value="${objTbj.getTrabajo().getFechaInicioTrabajo()}"/>
                </div>
                <div class="form-group col-xs-6"> 
                  <label for="exampleInputPassword1">Fecha Entrega:</label>
                  <fmt:formatDate pattern="dd-MM-yyyy" value="${objTbj.getTrabajo().getFechaFinTrabajo()}"/>
                </div>
                <div class="form-group col-xs-6">
                  <label for="exampleInputPassword1">Asignar Usuario</label>
                  <select class="form-control" name="cmbUsuario">
                         <option value="">(SELECCIONE)</option>
                    <c:forEach items="${listadoUsr}" var="usuarios">
                        <option value="${usuarios.usr.idUsr}"><c:out value="${usuarios.usr.nomUsr} ${usuarios.usr.apellUsr}"/></option>
                    </c:forEach>
                  </select>
                </div>
               
                
                <input type="hidden" name="idTbj" value="${objTbj.getTrabajo().getIdTrabajo()}" />
               </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-success">Actualizar</button>
                                           
              
              </div>
              
               
              
            </form>
       
       
              
              
              
              
         
    </body>
</html>