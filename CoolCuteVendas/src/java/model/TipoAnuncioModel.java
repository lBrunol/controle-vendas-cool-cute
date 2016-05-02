/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import bean.TipoAnuncio;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.ConexaoBanco;

public class TipoAnuncioModel {
    
    private String query;
    private PreparedStatement stmt;
    private Connection c;
    
    public void adiciona(TipoAnuncio tipoAnuncio) throws SQLException{
        query = "INSERT INTO tipoanuncio( tiaDescricao, tiaPercentual) VALUES (?,?)";
        ConexaoBanco conn = new ConexaoBanco();
        
        c = conn.conectar();
        stmt = c.prepareStatement(query);

        stmt.setString(1, tipoAnuncio.getDescricao());
        stmt.setFloat(2, tipoAnuncio.getPercentual());

        stmt.execute();
        stmt.close();

        c.close();
    }

    public void altera(TipoAnuncio tipoAnuncio) throws SQLException{
        query = "UPDATE tipoanuncio SET tiaDescricao = ? , tiaPercentual = ? WHERE tiaCodigo = ?";
        ConexaoBanco conn = new ConexaoBanco();

        c = conn.conectar();
        stmt = c.prepareStatement(query);

        stmt.setString(1, tipoAnuncio.getDescricao());
        stmt.setFloat(2, tipoAnuncio.getPercentual());
        stmt.setInt(3, tipoAnuncio.getCodigo());

        stmt.execute();
        stmt.close();

        c.close();
    }
    
    public void exclui(TipoAnuncio tipoAnuncio) throws SQLException{
        query = "DELETE FROM tipoanuncio WHERE tiaCodigo = ?";
        ConexaoBanco conn = new ConexaoBanco();

        c = conn.conectar();
        stmt = c.prepareStatement(query);

        stmt.setInt(1, tipoAnuncio.getCodigo());

        stmt.execute();
        stmt.close();

        c.close();
    }
    
    public List<TipoAnuncio> getTipoAnuncio() throws SQLException {
        
        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        stmt = c.prepareStatement("SELECT * FROM tipoanuncio");
        ResultSet rs = stmt.executeQuery();
        List<TipoAnuncio> lstTipoAnuncio = new ArrayList<>();
        
        while (rs.next()) {
            TipoAnuncio tia = new TipoAnuncio();
            
            tia.setCodigo(rs.getInt(1));
            tia.setDescricao(rs.getString(2));
            tia.setPercentual(rs.getFloat(3));
            
            lstTipoAnuncio.add(tia);
        }
        
        rs.close();
        stmt.close();
        c.close();
        
        return lstTipoAnuncio;
    }
}
