/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.fgutierrez.legalwork.presentacion;

import cl.fgutierrez.legalwork.dto.AsignaDTO;
import cl.fgutierrez.legalwork.persistencia.AsignaSessionBean;
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


@WebServlet(name = "RecuperaAsigXUsr", urlPatterns = {"/RecuperaAsigXUsr","/getAsigXID"})
public class RecuperaAsigXUsr extends HttpServlet {

 @EJB
 private AsignaSessionBean objAsignaSessionBean;
 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        int id=Integer.parseInt(request.getParameter("idUsr"));
        List <AsignaDTO>listAsig=this.objAsignaSessionBean.listaAsignadosXID(id);
        session.setAttribute("listadoAsig", listAsig);
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

  

}
