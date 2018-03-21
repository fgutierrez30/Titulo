
package cl.fgutierrez.legalwork.dto;

import cl.fgutierrez.legalwork.entidades.Asignacion;
import cl.fgutierrez.legalwork.entidades.Trabajo;
import cl.fgutierrez.legalwork.entidades.Usuario;
import java.io.Serializable;



public class AsignaDTO implements Serializable{
    
    private Asignacion asig;
    private Trabajo tbj;
    private Usuario usr;

    public AsignaDTO() {
    }

    public AsignaDTO(Asignacion asig, Trabajo tbj, Usuario usr) {
        this.asig = asig;
        this.tbj = tbj;
        this.usr = usr;
    }
    

    public Asignacion getAsig() {
        return asig;
    }

    public void setAsig(Asignacion asig) {
        this.asig = asig;
    }

    public Trabajo getTbj() {
        return tbj;
    }

    public void setTbj(Trabajo tbj) {
        this.tbj = tbj;
    }

    public Usuario getUsr() {
        return usr;
    }

    public void setUsr(Usuario usr) {
        this.usr = usr;
    }

    

 


    
    
    
    
}
