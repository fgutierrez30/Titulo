/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.fgutierrez.legalwork.presentacion;

import cl.fgutierrez.legalwork.dto.UsuarioDTO;
import cl.fgutierrez.legalwork.dto.UsuarioPerfilDTO;
import cl.fgutierrez.legalwork.entidades.Usuario;
import cl.fgutierrez.legalwork.persistencia.PerfilSessionBean;
import cl.fgutierrez.legalwork.persistencia.UsuarioSessionBean;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Felipe
 */
@WebServlet(name = "ModificaUsuarioServlet", urlPatterns = {"/modificaUsuarioServlet","/modificarUsuario"})
public class ModificaUsuarioServlet extends HttpServlet {
    
    @EJB
    private UsuarioSessionBean objUsuarioSessionBean;
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
               HttpSession session=request.getSession();
        
        int id_usr=Integer.parseInt(request.getParameter("id_usr"));
        try{
            
            UsuarioPerfilDTO infoUsuarioPerfil=this.objUsuarioSessionBean.buscaXID(id_usr);
            if(infoUsuarioPerfil!=null)
            {
                session.setAttribute("objetoAeditar", infoUsuarioPerfil);
                response.sendRedirect("actUsr.jsp");
            }else{
            response.sendRedirect("usuarios.jsp");
            }
        }catch(Exception ex)
        {
            System.out.print(ex.toString());
        }
       
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
            
           int id_usr=Integer.parseInt(request.getParameter("idUsr"));
            
            try{
             UsuarioPerfilDTO usrEditar=this.objUsuarioSessionBean.buscaXID(id_usr);
             usrEditar.getUsr().setNomUsr(request.getParameter("txtNombre"));
             usrEditar.getUsr().setApellUsr(request.getParameter("txtApell"));
             usrEditar.getUsr().setRutUsr(request.getParameter("txtRut"));
             usrEditar.getUsr().setLoginUsr(request.getParameter("txtNomUsr"));
             usrEditar.getUsr().setPassUsr(request.getParameter("txtPass"));
             usrEditar.getPerfil().setIdPerfil(Integer.parseInt(request.getParameter("cmbPerfil")));
             usrEditar.getUsr().setEmailUsr(request.getParameter("txtEmail"));
             usrEditar.getUsr().setTelefUsr(request.getParameter("txtFono"));
             usrEditar.getUsr().setEstadoUsr(Integer.parseInt(request.getParameter("cmbEstado")));
             
             Usuario usr=new Usuario();
             
             usr.setIdUsr(id_usr);
             usr.setNomUsr(usrEditar.getUsr().getNomUsr());
             usr.setApellUsr(usrEditar.getUsr().getApellUsr());
             usr.setRutUsr(usrEditar.getUsr().getRutUsr());
             usr.setLoginUsr(usrEditar.getUsr().getLoginUsr());
             usr.setPassUsr(usrEditar.getUsr().getPassUsr());
             usr.setIdPerfil(usrEditar.getPerfil());
             usr.setEmailUsr(usrEditar.getUsr().getEmailUsr());
             usr.setTelefUsr(usrEditar.getUsr().getTelefUsr());
             usr.setEstadoUsr(usrEditar.getUsr().getEstadoUsr());
             
             this.objUsuarioSessionBean.updateUsuario(usr);
             response.sendRedirect("usuarios.jsp");
            
             
                
            }catch(Exception ex)
            {
                System.out.print(ex.toString());
            }
        
    }

}

