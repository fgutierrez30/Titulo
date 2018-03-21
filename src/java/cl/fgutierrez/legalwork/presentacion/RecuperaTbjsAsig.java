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

/**
 *
 * @author fgutierrez
 */
@WebServlet(name = "RecuperaTbjsAsig", urlPatterns = {"/RecuperaTbjsAsig","/getAllTbjAsig"})
public class RecuperaTbjsAsig extends HttpServlet {

    @EJB
    private AsignaSessionBean objAsignaSessionBean;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion=request.getSession();
        List<AsignaDTO> trabajosAsig=this.objAsignaSessionBean.listaAsignados();
        sesion.setAttribute("listtrabajosAsig", trabajosAsig);
        System.out.println("Prueba");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   

}
