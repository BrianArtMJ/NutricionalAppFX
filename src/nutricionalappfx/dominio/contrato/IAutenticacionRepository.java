/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package nutricionalappfx.dominio.contrato;

import nutricionalappfx.dominio.pojo.Colaborador;
import nutricionalappfx.dominio.pojo.ColaboradorEstatus;

/**
 *
 * @author brian
 */
public interface IAutenticacionRepository {
    
    public int verificarCredenciales(String noPersonal, String constrasenia) throws RuntimeException;
    
    public ColaboradorEstatus verificarEstatusColaborador(int idColaborador);
    
    Colaborador obtenerInformacionColaborador(int idColaborador);
    
    
    
}
