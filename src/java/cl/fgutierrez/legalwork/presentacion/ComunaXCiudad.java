/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.fgutierrez.legalwork.presentacion;

import cl.fgutierrez.legalwork.entidades.Comuna;
import cl.fgutierrez.legalwork.persistencia.ComunaSessionBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "ComunaXCiudad", urlPatterns = {"/ComunaXCiudad","/comXCity"})
public class ComunaXCiudad extends HttpServlet {

   @EJB
   private ComunaSessionBean objComunaSessionBean;
 

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion=request.getSession();
        
        int id=Integer.parseInt(request.getParameter("id_ciudad"));
        List<Comuna> comunaXCiudad=this.objComunaSessionBean.getComunaXCiudad(id);
        sesion.setAttribute("comXCity", comunaXCiudad);
        
        
    }

   
  

}
