/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.fgutierrez.legalwork.presentacion;

import cl.fgutierrez.legalwork.dto.AsignaDTO;
import cl.fgutierrez.legalwork.dto.TrabajoTpTrabajoClienteDTO;
import cl.fgutierrez.legalwork.entidades.Asignacion;
import cl.fgutierrez.legalwork.entidades.Trabajo;
import cl.fgutierrez.legalwork.entidades.Usuario;
import cl.fgutierrez.legalwork.persistencia.AsignaSessionBean;
import cl.fgutierrez.legalwork.persistencia.TrabajoSessionBean;
import cl.fgutierrez.legalwork.persistencia.UsuarioSessionBean;
import java.io.IOException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "AsignaTrabajoServlet", urlPatterns = {"/AsignaTrabajoServlet","/asignaTrabajo"})
public class AsignaTrabajoServlet extends HttpServlet {

  @EJB
    private TrabajoSessionBean objTrabajoSessionBean;
  @EJB
    private AsignaSessionBean objAsignaSessionBean;
  @EJB
    private UsuarioSessionBean objUsuarioSessionBean;
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion=request.getSession();
        
        TrabajoTpTrabajoClienteDTO objTbj=this.objTrabajoSessionBean.buscXID(Integer.parseInt(request.getParameter("id_trabajo")));
        sesion.setAttribute("objTbj", objTbj);
        
        response.sendRedirect("actTrabajo.jsp");
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
           java.util.Date fecha = new Date();  
           Asignacion asig=new Asignacion();
           asig.setFechaAsignacion(fecha);
           asig.setEstadoAsignacion(1);
           
           int idtbj=Integer.parseInt(request.getParameter("idTbj"));
           Trabajo tbj=objTrabajoSessionBean.buscaTbjXid(idtbj);
           
           int idUsr=Integer.parseInt(request.getParameter("cmbUsuario"));
           Usuario usr=objUsuarioSessionBean.usrXID(idUsr);
           
           AsignaDTO asi=new AsignaDTO(asig, tbj, usr);
                        
            this.objAsignaSessionBean.addAsignacion(asi);
            
            tbj.setEstadoTrabajo("Asignado");
            this.objTrabajoSessionBean.updateTrabajo(tbj);
            response.sendRedirect("asignatrabajo.jsp");
            
          
      } catch (Exception ex) {
          Logger.getLogger(AsignaTrabajoServlet.class.getName()).log(Level.SEVERE, null, ex);
            
      }
        
    }

   

}
