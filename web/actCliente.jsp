<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%@include file="master/head.jsp" %>
    </head>
    <body>
        
        
       
          <form role="form" name="frmActUsr" method="post" action="./modificarUsuario" >
                                
              <div class="box-body">
                <div class="form-group col-xs-6">
                  <label for="exampleInputEmail1">Nombre</label>
                  <input type="text" class="form-control" id="exampleInputEmail1" name="txtNombre" value="<c:out value="${objetoAeditar.usr.nomUsr}" />">
                </div>
                                
                 <div class="form-group col-xs-6">
                  <label for="exampleInputEmail1">Apellido</label>
                  <input type="text" class="form-control" id="exampleInputEmail1" name="txtApell" value="<c:out value="${objetoAeditar.usr.apellUsr}" />">
                </div>
                  <div class="form-group col-xs-6">
                  <label for="exampleInputEmail1">Rut</label>
                  <input type="text" class="form-control" id="exampleInputEmail1" name="txtRut" value="<c:out value="${objetoAeditar.usr.rutUsr}" />">
                </div>
                <div class="form-group col-xs-6">
                  <label for="exampleInputPassword1">Nombre de Usuario</label>
                  <input type="text" class="form-control" id="exampleInputPassword1" name="txtNomUsr" value="<c:out value="${objetoAeditar.usr.loginUsr}" />">
                </div>
                  <div class="form-group col-xs-6">
                  <label for="exampleInputPassword1">Contraseña</label>
                  <input type="password" class="form-control" id="exampleInputPassword1" name="txtPass" value="<c:out value="${objetoAeditar.usr.passUsr}" />">
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
                  <input type="email" class="form-control" id="exampleInputPassword1" name="txtEmail" value="<c:out value="${objetoAeditar.usr.emailUsr}" />">
                </div>
               <div class="form-group col-xs-6">
                  <label for="exampleInputEmail1">Telefono</label>
                  <input type="text" class="form-control" id="exampleInputEmail1" name="txtFono" value="<c:out value="${objetoAeditar.usr.telefUsr}" />">
                </div>
                
                <div class="form-group col-xs-6">
                  <label for="exampleInputPassword1">Estado</label>
                  <select class="form-control" name="cmbEstado">
                          <option>(Seleccione)</option>
                          <option value="1">Activo</option>
                          <option value="0">Bloqueado</option>
                      
                  </select>
                </div>
                
                <input type="hidden" name="idUsr" value="${objetoAeditar.usr.idUsr}" />
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-success">Actualizar</button>
                
                
                <td><a href="./borrarUsr?idUsr=${objetoAeditar.usr.idUsr}"><span class="btn btn-danger" >Eliminar</span></a></td>
              
              </div>
              
               
              
            </form>
       
       
              
              
              
              
         
    </body>
</html>
