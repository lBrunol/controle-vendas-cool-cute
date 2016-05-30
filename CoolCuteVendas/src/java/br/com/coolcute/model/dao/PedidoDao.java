/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.coolcute.model.dao;

import br.com.coolcute.bean.Anuncio;
import br.com.coolcute.bean.Cliente;
import br.com.coolcute.bean.ItensPedido;
import br.com.coolcute.bean.Pedido;
import br.com.coolcute.bean.StatusPedido;
import br.com.coolcute.bean.TipoAvaliacao;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import br.com.coolcute.util.ConexaoBanco;
import java.sql.CallableStatement;
import org.joda.time.DateTime;
import org.springframework.stereotype.Repository;

@Repository
public class PedidoDao {
    
    private String query;
    private PreparedStatement stmt;
    private Connection c;
    
    public void adiciona(Pedido pedido) throws SQLException{
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        CallableStatement cs = c.prepareCall("{CALL PEDIDO_INSERT (?,?,?,?,?,?,?,?,?,?,?)}");
        
        /*float valorTotal = 0;
        for (ItensPedido ped: pedido.getItensEntrada()){
            valorTotal = valorTotal + (ped.getValorVenda() * ped.getQuantidade());
        }*/
        
        cs.setInt(1, pedido.getTipoAvaliacao().getCodigo());
        cs.setInt(2, pedido.getStatusPedido().getCodigo());
        cs.setInt(3, pedido.getAnuncio().getCodigo());
        cs.setInt(4, pedido.getCliente().getCodigo());
        cs.setDate(5, new java.sql.Date(pedido.getDataVenda().getMillis()));
        cs.setFloat(6, pedido.getFrete());
        cs.setDate(7, new java.sql.Date(pedido.getDataPostagem().getMillis()));
        cs.setDate(8, new java.sql.Date(pedido.getDataEntrega().getMillis()));
        cs.setFloat(9, pedido.getValorTotal());
        cs.setString(10, pedido.getCodigoPostagem());
        cs.setString(11, pedido.getObservacao());

        cs.execute();
        
        cs = c.prepareCall("{CALL ITENSPEDIDO_INSERT (?,?,?,?,?,?)}");
        
        for( ItensPedido lstItens : pedido.getItensEntrada()){
            cs.setInt(1, lstItens.getCodigoPedido());
            cs.setInt(2, lstItens.getCodigoProduto());
            cs.setFloat(3, lstItens.getValorVenda());
            cs.setFloat(4, lstItens.getValorCompra());
            cs.setInt(5, lstItens.getQuantidade());
            cs.setFloat(6, lstItens.getTaxa());
            
            cs.execute();
        }       
        
        cs.close();
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
    
    public List<Pedido> filterPedido(Pedido pedido) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        CallableStatement cs = c.prepareCall("{CALL PEDIDO_SELECT (?,?,?,?,?,?,?,?,?)}");
            
        cs.setInt(1, pedido.getCodigo());
        if(pedido.getDataVenda() != null)
            cs.setDate(2, new java.sql.Date(pedido.getDataVenda().getMillis()));
        else
            cs.setDate(2, null);
        if(pedido.getDataPostagem() != null)
            cs.setDate(3, new java.sql.Date(pedido.getDataPostagem().getMillis()));
        else
            cs.setDate(3, null);
        if(pedido.getDataEntrega() != null)
            cs.setDate(4, new java.sql.Date(pedido.getDataEntrega().getMillis()));
        else
            cs.setDate(4, null);
        
        cs.setString(5, pedido.getStatusPedido().getDescricao());
        cs.setString(6, pedido.getTipoAvaliacao().getDescricao());
        cs.setString(7, pedido.getCliente().getNome());
        cs.setString(8, pedido.getCliente().getEmail());
        cs.setString(9, pedido.getAnuncio().getDescricao());
        //cs.execute();

        ResultSet rs = cs.executeQuery();
        
        List<Pedido> lstPedido = new ArrayList<>();
        
       
        while (rs.next()) {
            Pedido ped = new Pedido();
             StatusPedido stp = new StatusPedido();
        Cliente cli = new Cliente();
        Anuncio anu = new Anuncio();
        TipoAvaliacao tiv = new TipoAvaliacao();
        
            ped.setCodigo(rs.getInt(1));
            ped.setDataVenda(new DateTime(rs.getDate(7).getTime()));
            ped.setDataPostagem(new DateTime(rs.getDate(9).getTime()));
            ped.setDataEntrega(new DateTime(rs.getDate(10).getTime()));
            
            stp.setDescricao(rs.getString(3));
            ped.setStatusPedido(stp);
            
            tiv.setDescricao(rs.getString(2));
            ped.setTipoAvaliacao(tiv);
            
            cli.setNome(rs.getString(5));
            cli.setEmail(rs.getString(6));            
            ped.setCliente(cli);
            
            anu.setDescricao(rs.getString(4));
            ped.setAnuncio(anu);
            
            lstPedido.add(ped);
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return lstPedido;        
    }
}
