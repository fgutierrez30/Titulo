/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.fgutierrez.legalwork.presentacion;

import cl.fgutierrez.legalwork.dto.UsuarioPerfilDTO;
import cl.fgutierrez.legalwork.entidades.Usuario;
import cl.fgutierrez.legalwork.persistencia.UsuarioSessionBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author fgutierrez
 */
@WebServlet(name = "EliminaUsrServlet", urlPatterns = {"/EliminaUsrServlet","/borrarUsr"})
public class EliminaUsrServlet extends HttpServlet {
    
    
     @EJB
    private UsuarioSessionBean objUsuarioSessionBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id_usr=Integer.parseInt(request.getParameter("idUsr"));
              
                
        try{
            
            this.objUsuarioSessionBean.deleteUsr(id_usr);
           
            response.sendRedirect("usuarios.jsp");
            
        }catch(Exception ex)
        {
            System.out.print(ex.toString());
        }
        
        
        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

   

}
