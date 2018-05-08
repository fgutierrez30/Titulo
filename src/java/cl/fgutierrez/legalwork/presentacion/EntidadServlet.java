/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.fgutierrez.legalwork.presentacion;

import cl.fgutierrez.legalwork.entidades.Comuna;
import cl.fgutierrez.legalwork.entidades.Entidad;
import cl.fgutierrez.legalwork.persistencia.ComunaSessionBean;
import cl.fgutierrez.legalwork.persistencia.EntidadSessionBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author felipegutierrez
 */
@WebServlet(name = "EntidadServlet", urlPatterns = {"/EntidadServlet","/getEntidad"})
public class EntidadServlet extends HttpServlet {

    @EJB
    private ComunaSessionBean comunaSessionBean;
    
    @EJB
    private EntidadSessionBean entidadSessionBean;
   

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            HttpSession session=request.getSession();
            String nombre=request.getParameter("txtNombre");
            String direccion=request.getParameter("txtDireccion");
            String telefono=request.getParameter("txtFono");
            int id= Integer.parseInt(request.getParameter("cmbComuna"));
            Comuna comuna=this.comunaSessionBean.comunaXID(id);
            String correo=request.getParameter("txtEmail");
            
            Entidad enti=new Entidad();
            enti.setDireccEntidad(direccion);
            enti.setNomEntidad(nombre);
            enti.setTelefEntidad(telefono);
            enti.setCorreo(correo);
            enti.setIdComuna(comuna);
            
            
            this.entidadSessionBean.addEntidad(enti);
            response.sendRedirect("entidades.jsp");
            
        } catch (Exception ex) {
            Logger.getLogger(EntidadServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        
        
    }

   

}
