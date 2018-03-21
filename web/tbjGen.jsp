<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="master/head.jsp" %>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <jsp:include page="./getAllTbjAsig" flush="true"/>
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
                 Trabajo Asignados
                </h1>
            </section>
           
            <section class="content">
                
                <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Trabajos en Proceso</h3>

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
                
                                  
                 <c:forEach items="${listtrabajosAsig}" var="trabajosAsig">
                <tr>
                    <td><c:out value="${trabajosAsig.usr.nomUsr}"/></td>
                    
                    
                  <td><button>Editar</button></td>
                                  
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
  
 
  
  
    </body>
</html>
