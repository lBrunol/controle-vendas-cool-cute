/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.coolcute.model.dao;

import br.com.coolcute.bean.Pedido;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import br.com.coolcute.util.ConexaoBanco;
import org.springframework.stereotype.Repository;

@Repository
public class PedidoDao {
    
    private String query;
    private PreparedStatement stmt;
    private Connection c;
    
    public void adiciona(Pedido tipoAnuncio) throws SQLException{
        query = "INSERT INTO pedido( pedDescricao, pedPercentual) VALUES (?,?)";
        ConexaoBanco conn = new ConexaoBanco();
        
        c = conn.conectar();
        stmt = c.prepareStatement(query);

        //stmt.setString(1, tipoAnuncio.getDescricao());
        //stmt.setFloat(2, tipoAnuncio.getPercentual());

        stmt.execute();
        stmt.close();

        c.close();
    }

    public void altera(Pedido tipoAnuncio) throws SQLException{
        query = "UPDATE pedido SET pedDescricao = ? , pedPercentual = ? WHERE pedCodigo = ?";
        ConexaoBanco conn = new ConexaoBanco();

        c = conn.conectar();
        stmt = c.prepareStatement(query);

        //stmt.setString(1, tipoAnuncio.getDescricao());
        //stmt.setFloat(2, tipoAnuncio.getPercentual());
        //stmt.setInt(3, tipoAnuncio.getCodigo());

        stmt.execute();
        stmt.close();

        c.close();
    }
    
    public void exclui(Long id) throws SQLException{
        query = "DELETE FROM pedido WHERE pedCodigo = ?";
        ConexaoBanco conn = new ConexaoBanco();

        c = conn.conectar();
        stmt = c.prepareStatement(query);

        stmt.setLong(1, id);

        stmt.execute();
        stmt.close();

        c.close();
    }
    
    public List<Pedido> getPedido() throws SQLException {
        
        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        stmt = c.prepareStatement("SELECT * FROM pedido");
        ResultSet rs = stmt.executeQuery();
        List<Pedido> lstPedido = new ArrayList<>();
        
        while (rs.next()) {
            Pedido ped = new Pedido();
            
            //ped.setCodigo(rs.getInt(1));
            //ped.setDescricao(rs.getString(2));
            //ped.setPercentual(rs.getFloat(3));
            
            lstPedido.add(ped);
        }
        
        rs.close();
        stmt.close();
        c.close();
        
        return lstPedido;
    }
    
    public Pedido getPedidoItem(Long id) throws SQLException{        
        
        ConexaoBanco cnn = new ConexaoBanco();
        Pedido itemPedido = new Pedido();
        
        c = cnn.conectar();
        
        stmt = c.prepareStatement("SELECT * FROM tipoAnuncio WHERE pedCodigo = ?" );
        
        stmt.setLong(1, id);
        
        ResultSet rs = stmt.executeQuery();
        
        while(rs.next()){
            //itemPedido.setCodigo(rs.getInt(1));
            //itemPedido.setDescricao(rs.getString(2));
            //itemPedido.setPercentual(rs.getFloat(3));            
        }
        
        rs.close();
        stmt.close();
        c.close();
        
        return itemPedido;        
    }
}