
package cl.fgutierrez.legalwork.persistencia;


import cl.fgutierrez.legalwork.dto.TrabajoDTO;
import cl.fgutierrez.legalwork.dto.TrabajoTpTrabajoClienteDTO;
import cl.fgutierrez.legalwork.entidades.Cliente;
import cl.fgutierrez.legalwork.entidades.TipoTrabajo;
import cl.fgutierrez.legalwork.entidades.Trabajo;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Stateless
public class TrabajoSessionBean {

       @PersistenceContext(unitName = "LegalWorkEJBPU")
       private EntityManager em;
       
     public void addTrabajo (TrabajoDTO infoTrabajoDTO) throws ControladorExceptions
     {
         Trabajo trabajo=new Trabajo();
         
         SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
            
         Calendar fechaActual = Calendar.getInstance();
         
         trabajo.setFechaInicioTrabajo(fechaActual.getTime());
         trabajo.setFechaFinTrabajo(infoTrabajoDTO.getFecha_fin());
         trabajo.setEstadoTrabajo(infoTrabajoDTO.getEstado());
         trabajo.setFechaFinRealTrabajo(infoTrabajoDTO.getFecha_fin_real());
         trabajo.setDetTrabajo(infoTrabajoDTO.getComentario());
         Cliente cliente=em.find(Cliente.class, infoTrabajoDTO.getRut_cliente());
         trabajo.setRutCliente(cliente);
         TipoTrabajo tpTrabajo=em.find(TipoTrabajo.class, infoTrabajoDTO.getId_tpTrabajo());
         trabajo.setIdTipoTrabajo(tpTrabajo);
         
         em.persist(trabajo);
         
     }
     
     public List<TrabajoTpTrabajoClienteDTO> TrabajosPendientes()
     {
        String estado="Sin Asignar";
        return em.createNamedQuery("Trabajo.sinAsignar", TrabajoTpTrabajoClienteDTO.class)
                 .setParameter("estadoTrabajo",estado)
                 .getResultList();
     }
     
     public Trabajo buscaTbjXid( int id)
     {
         Trabajo tbj=em.find(Trabajo.class, id);
         return tbj;
     }
     
     public TrabajoTpTrabajoClienteDTO buscXID(int id)
     {
         TrabajoTpTrabajoClienteDTO tbj=em.createNamedQuery("Trabajo.buscar",TrabajoTpTrabajoClienteDTO.class)
                 .setParameter("id_trabajo", id)
                 .getSingleResult();
         
         return tbj;
     }
     
     public void updateTrabajo(Trabajo trabajo) throws ControladorExceptions
   {
       em.merge(trabajo);
   }
}
