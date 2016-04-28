/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import bean.TipoAnuncio;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;
import util.ConexaoBanco;

public class TipoAnuncioModel {
    
    private String query;
    private PreparedStatement stmt;
    private Connection c;
    
    public boolean adiciona(TipoAnuncio tipoAnuncio) throws SQLException{
        query = "insert into tipoanuncio( tiaDescricao, tiaPercentual) VALUES (?,?)";
        ConexaoBanco conn = new ConexaoBanco();
        
        try{
            c = conn.conectar();
            stmt = c.prepareStatement(query);
            
            //seta os valores
            stmt.setString(1, tipoAnuncio.getDescricao());
            stmt.setFloat(2, tipoAnuncio.getPercentual());
            
            stmt.execute();
            stmt.close();
            
            c.close();
            
            return true;
            
        } catch (SQLException e) {
            e.getCause();
        }        
        
        return false;
        
    }

    public boolean altera(TipoAnuncio tipoAnuncio) throws SQLException{
        query = "insert into tipoanuncio( tiaDescricao, tiaPercentual) VALUES (?,?)";
        ConexaoBanco conn = new ConexaoBanco();
        
        try{
            c = conn.conectar();
            stmt = c.prepareStatement(query);
            
            //seta os valores
            stmt.setString(1, tipoAnuncio.getDescricao());
            stmt.setFloat(2, tipoAnuncio.getPercentual());
            
            stmt.execute();
            stmt.close();
            
            c.close();
            
            return true;
            
        } catch (SQLException e) {
            e.getCause();
        }        
        
        return false;
        
    }
}
