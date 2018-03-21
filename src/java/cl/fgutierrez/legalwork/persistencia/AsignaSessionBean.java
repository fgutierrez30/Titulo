
package cl.fgutierrez.legalwork.persistencia;


import cl.fgutierrez.legalwork.dto.AsignaDTO;
import cl.fgutierrez.legalwork.entidades.Asignacion;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Felipe
 */
@Stateless
public class AsignaSessionBean {

      @PersistenceContext(unitName = "LegalWorkEJBPU")
   
       private EntityManager em;
      
      public void addAsignacion (AsignaDTO asigna) throws ControladorExceptions
      {
          Asignacion asig=new Asignacion();
          asig.setEstadoAsignacion(asigna.getEstado());
          asig.setFechaAsignacion(asigna.getFecha_asignacion());
          asig.setIdTrabajo(asigna.getIdtrabajo());
          asig.setIdUsr(asigna.getIdusr());
          em.persist(asig);
          
          
      }
}
