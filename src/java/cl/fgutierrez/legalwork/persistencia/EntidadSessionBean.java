/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.fgutierrez.legalwork.persistencia;

import cl.fgutierrez.legalwork.entidades.Entidad;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Stateless
public class EntidadSessionBean {

    @PersistenceContext(name = "LegalWorkEJBPU")
    
    private EntityManager em;
    
    public void addEntidad(Entidad enti)throws ControladorExceptions
 {
     em.persist(enti);
 }
    
    
}
