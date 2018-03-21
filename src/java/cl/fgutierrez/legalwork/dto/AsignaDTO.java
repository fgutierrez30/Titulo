/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.fgutierrez.legalwork.dto;

import cl.fgutierrez.legalwork.entidades.Trabajo;
import cl.fgutierrez.legalwork.entidades.Usuario;
import java.util.Date;


public class AsignaDTO {
    
    private Date fecha_asignacion;
    private int estado;
    private Trabajo idtrabajo;
    private Usuario idusr;

    public AsignaDTO() {
    }

    public Date getFecha_asignacion() {
        return fecha_asignacion;
    }

    public void setFecha_asignacion(Date fecha_asignacion) {
        this.fecha_asignacion = fecha_asignacion;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public Trabajo getIdtrabajo() {
        return idtrabajo;
    }

    public void setIdtrabajo(Trabajo idtrabajo) {
        this.idtrabajo = idtrabajo;
    }

    public Usuario getIdusr() {
        return idusr;
    }

    public void setIdusr(Usuario idusr) {
        this.idusr = idusr;
    }

 


    
    
    
    
}
