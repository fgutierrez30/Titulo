
package cl.fgutierrez.legalwork.persistencia;


import cl.fgutierrez.legalwork.dto.AsignaDTO;
import cl.fgutierrez.legalwork.entidades.Asignacion;
import java.util.List;
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
          asig.setEstadoAsignacion(asigna.getAsig().getEstadoAsignacion());
          asig.setFechaAsignacion(asigna.getAsig().getFechaAsignacion());
          asig.setIdTrabajo(asigna.getTbj());
          asig.setIdUsr(asigna.getUsr());
          em.persist(asig);
          
          
      }
      
      public List<AsignaDTO> listaAsignados()
      {
          return em.createNamedQuery("Asignacion.listado", AsignaDTO.class).getResultList();
          
      }
      
      public List<AsignaDTO> listaAsignadosXID(int idUsr)
      {
          return em.createNamedQuery("Asignacion.listadoXUsr", AsignaDTO.class).setParameter("id_usr", idUsr).getResultList();
      }
}
