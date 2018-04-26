<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                <jsp:useBean id="objTrabajo" class="cl.fgutierrez.legalwork.dto.TrabajoTpTrabajoClienteDTO" scope="page"/>
                
                <%@include file="master/header.jsp" %>
                <%@include file="menu.jsp" %>
        
        
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Detalle Trabajo
      </h1>
     </section>

    <!-- Main content -->
    <section class="invoice">

      <!-- Default box -->
      <div class="row">
        <div class="col-xs-12">
          <h2 class="page-header">
              <i class="fa fa-globe"></i> <c:out value="${sessionScope.objTrabajo.tpTrabajo.nomTipoTrabajo}"/>, <c:out value="${sessionScope.objTrabajo.trabajo.detTrabajo}" />
            
      <small class="pull-right">Fecha: <% Date date = new Date();
      SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
      out.print(ft.format(date));%> </small>
        
      
          </h2>
        </div>
        <!-- /.col -->
      </div>
      
           <div class="row invoice-info">
        <div class="col-sm-4 invoice-col">
         <strong> Cliente </strong>
          <address>
            Razon Social:  <c:out value="${sessionScope.objTrabajo.cliente.razonSocial}"/><br>
            Rut:  <c:out value="${sessionScope.objTrabajo.cliente.rutCliente}"/><br>
            Email:  <c:out value="${sessionScope.objTrabajo.cliente.correoCliente}"/><br>
            Telefono: <c:out value="${sessionScope.objTrabajo.cliente.telefCliente}" /><br>
            
          </address>
        </div>
        <!-- /.col -->
        <div class="col-sm-4 invoice-col">
         <strong> Trabajo </strong>
          <address>
              Fecha Inicio: <fmt:formatDate pattern="dd-MM-yyyy" value="${sessionScope.objTrabajo.trabajo.fechaInicioTrabajo}"/><br>
              Fecha Término: <fmt:formatDate pattern="dd-MM-yyyy" value="${sessionScope.objTrabajo.trabajo.fechaFinTrabajo}"/><br>
            
          </address>
        </div>
        <!-- /.col -->
        <div class="col-sm-4 invoice-col">
            <b>ID Trabajo #<c:out value="${sessionScope.objTrabajo.trabajo.idTrabajo}"/></b><br>
          <br>
          
        </div>
        <!-- /.col -->
      </div>
      
       <div class="row">
        <div class="col-xs-12 table-responsive">
          <table class="table table-striped">
            <thead>
            <tr>
              <th>Qty</th>
              <th>Product</th>
              <th>Serial #</th>
              <th>Description</th>
              <th>Subtotal</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>1</td>
              <td>Call of Duty</td>
              <td>455-981-221</td>
              <td>El snort testosterone trophy driving gloves handsome</td>
              <td>$64.50</td>
            </tr>
            <tr>
              <td>1</td>
              <td>Need for Speed IV</td>
              <td>247-925-726</td>
              <td>Wes Anderson umami biodiesel</td>
              <td>$50.00</td>
            </tr>
            <tr>
              <td>1</td>
              <td>Monsters DVD</td>
              <td>735-845-642</td>
              <td>Terry Richardson helvetica tousled street art master</td>
              <td>$10.70</td>
            </tr>
            <tr>
              <td>1</td>
              <td>Grown Ups Blue Ray</td>
              <td>422-568-642</td>
              <td>Tousled lomo letterpress</td>
              <td>$25.99</td>
            </tr>
            </tbody>
          </table>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.box -->
 
      <div class="row no-print">
        <div class="col-xs-12">
          <a target="_blank" class="btn btn-danger"><i class="fa fa-thumbs-o-up"></i> Finalizar Trabajo</a>
          <button type="button" class="btn btn-success pull-right"><i class="fa fa-pencil-square-o"></i> Agregar Detalle
          </button>
          
        </div>
      </div>
      
    </section>
    <!-- /.content -->
    
   
    
    
  </div>

   
        
        
      
              </c:otherwise>
        </c:choose>
    </body>
</html>
