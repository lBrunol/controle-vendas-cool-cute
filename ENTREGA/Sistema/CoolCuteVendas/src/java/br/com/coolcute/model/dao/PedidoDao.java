package br.com.coolcute.model.dao;

import br.com.coolcute.bean.Anuncio;
import br.com.coolcute.bean.Cliente;
import br.com.coolcute.bean.Pedido;
import br.com.coolcute.bean.ItensPedido;
import br.com.coolcute.bean.Produto;
import br.com.coolcute.bean.StatusPedido;
import br.com.coolcute.bean.TipoAvaliacao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import br.com.coolcute.util.ConexaoBanco;
import java.sql.CallableStatement;
import org.joda.time.DateTime;
import org.springframework.stereotype.Repository;
import br.com.coolcute.model.dao.ProdutoDao;

@Repository
public class PedidoDao {    
    
    private CallableStatement cs;
    private Connection c;
    
    public void adicionarPedido(Pedido pedido) throws SQLException{

        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        CallableStatement cs = c.prepareCall("{CALL PEDIDO_INSERT (?,?,?,?,?,?,?,?,?,?,?)}");
        
        cs.setInt(1, pedido.getTipoAvaliacao().getCodigo());
        cs.setInt(2, pedido.getStatusPedido().getCodigo());
        cs.setInt(3, pedido.getAnuncio().getCodigo());
        cs.setInt(4, pedido.getCliente().getCodigo());
        if(pedido.getDataVenda() != null)
            cs.setDate(5, new java.sql.Date(pedido.getDataVenda().getMillis()));
        else
            cs.setDate(5, null);
        cs.setFloat(6, pedido.getFrete());
        if(pedido.getDataPostagem() != null)
            cs.setDate(7, new java.sql.Date(pedido.getDataPostagem().getMillis()));
        else
            cs.setDate(7, null);
        if(pedido.getDataEntrega() != null)
            cs.setDate(8, new java.sql.Date(pedido.getDataEntrega().getMillis()));
        else
            cs.setDate(8, null);
        cs.setFloat(9, pedido.getValorTotal());
        cs.setString(10, pedido.getCodigoPostagem());
        cs.setString(11, pedido.getObservacao());

        cs.execute();
        
        cs = c.prepareCall("{CALL ITENSPEDIDO_INSERT (?,?,?,?,?,?)}");
        
        for( ItensPedido lstItens : pedido.getItensPedido()){
            new ProdutoDao().atualizaQuantidadeProduto(new Produto(lstItens.getCodigoProduto(),null,0,0,lstItens.getQuantidade()), false);
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

    public void alterarPedido(Pedido pedido) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        
        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL PEDIDO_UPDATE (?,?,?,?,?,?,?,?,?,?,?,?)}");
        
        cs.setInt(1, pedido.getCodigo());
        cs.setInt(2, pedido.getTipoAvaliacao().getCodigo());
        cs.setInt(3, pedido.getStatusPedido().getCodigo());
        cs.setInt(4, pedido.getAnuncio().getCodigo());
        cs.setInt(5, pedido.getCliente().getCodigo());
        if(pedido.getDataVenda() != null)
            cs.setDate(6, new java.sql.Date(pedido.getDataVenda().getMillis()));
        else
            cs.setDate(6, null);
        cs.setFloat(7, pedido.getFrete());
        if(pedido.getDataPostagem() != null)
            cs.setDate(8, new java.sql.Date(pedido.getDataPostagem().getMillis()));
        else
            cs.setDate(8, null);
        if(pedido.getDataEntrega() != null)
            cs.setDate(9, new java.sql.Date(pedido.getDataEntrega().getMillis()));
        else
            cs.setDate(9, null);
        cs.setFloat(10, pedido.getValorTotal());
        cs.setString(11, pedido.getCodigoPostagem());
        cs.setString(12, pedido.getObservacao());

        cs.execute();
        
        cs = c.prepareCall("{CALL ITENSPEDIDO_INSERT (?,?,?,?,?,?)}");        
        
        for( ItensPedido lstItens : pedido.getItensPedido()){
            if(pedido.getStatusPedido().getCodigo() != 9)
                new ProdutoDao().atualizaQuantidadeProduto(new Produto(lstItens.getCodigoProduto(),null,0,0,lstItens.getQuantidade()), false);
            else
                new ProdutoDao().atualizaQuantidadeProduto(new Produto(lstItens.getCodigoProduto(),null,0,0,lstItens.getQuantidade()), true);
            cs.setInt(1, pedido.getCodigo());
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
    
    public void excluirPedido(int id) throws SQLException{

        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL PEDIDO_DELETE (?)}");

        cs.setInt(1, id);

        cs.execute();
        cs.close();

        c.close();
    }
    
    public void excluirItensPedido (Pedido pedido) throws SQLException{
        
        List<ItensPedido> lstItensAntigos = new ArrayList();
        lstItensAntigos = getItensPedido(pedido.getCodigo());
        
        for( ItensPedido lstItens : lstItensAntigos){
            new ProdutoDao().atualizaQuantidadeProduto(new Produto(lstItens.getCodigoProduto(),null,0,0,lstItens.getQuantidade()), true);
        }
        
        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();        
        
        cs = c.prepareCall("{CALL ITENSPEDIDO_DELETE (?)}");
        
        cs.setInt(1, pedido.getCodigo());        

        cs.execute();
        cs.close();

        c.close();
    }
    
    public Pedido getPedidoItem(int id) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        Pedido itemPedido = new Pedido();
        
        c = conn.conectar();
        
        CallableStatement cs = c.prepareCall("{CALL PEDIDO_SELECT (?,?,?,?,?,?,?,?,?)}");
            
        cs.setInt(1, id);
        cs.setDate(2, null);
        cs.setDate(3, null);
        cs.setDate(4, null);
        cs.setString(5, null);
        cs.setString(6, null);
        cs.setString(7, null);
        cs.setString(8, null);
        cs.setString(9, null);

        ResultSet rs = cs.executeQuery();
        
        if (rs.next()) {
            
            itemPedido.setCodigo(rs.getInt(1));
            if(rs.getDate(7) != null)
                itemPedido.setDataVenda(new DateTime(rs.getDate(7).getTime()));
            if(rs.getDate(9) != null)
                itemPedido.setDataPostagem(new DateTime(rs.getDate(9).getTime()));
            if(rs.getDate(10) != null)
                itemPedido.setDataEntrega(new DateTime(rs.getDate(10).getTime()));
            itemPedido.setFrete(rs.getFloat(8));
            itemPedido.setValorTotal(rs.getFloat(11));
            itemPedido.setCodigoPostagem(rs.getString(12));
            itemPedido.setObservacao(rs.getString(13));
            itemPedido.setStatusPedido(new StatusPedido(rs.getInt(15), rs.getString(3)));
            itemPedido.setTipoAvaliacao(new TipoAvaliacao(rs.getInt(14), rs.getString(2)));          
            itemPedido.setCliente(new Cliente(rs.getInt(17), rs.getString(5), rs.getString(6)));
            itemPedido.setAnuncio(new Anuncio(rs.getInt(16), rs.getString(4)));
            
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return itemPedido;        
    }
    
    public List<Pedido> getPedido(Pedido pedido) throws SQLException {
        
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

        ResultSet rs = cs.executeQuery();
        
        List<Pedido> lstPedido = new ArrayList<>();
        
       
        while (rs.next()) {
            Pedido ped = new Pedido();
        
            ped.setCodigo(rs.getInt(1));
            if(rs.getDate(7) != null)
                ped.setDataVenda(new DateTime(rs.getDate(7).getTime()));
            if(rs.getDate(9) != null)
                ped.setDataPostagem(new DateTime(rs.getDate(9).getTime()));
            if(rs.getDate(10) != null)
                ped.setDataEntrega(new DateTime(rs.getDate(10).getTime()));
            ped.setFrete(rs.getFloat(8));
            ped.setValorTotal(rs.getFloat(11));
            ped.setCodigoPostagem(rs.getString(12));
            ped.setObservacao(rs.getString(13));
            ped.setStatusPedido(new StatusPedido(rs.getInt(15), rs.getString(3)));
            ped.setTipoAvaliacao(new TipoAvaliacao(rs.getInt(14), rs.getString(2)));          
            ped.setCliente(new Cliente(rs.getInt(17), rs.getString(5), rs.getString(6)));
            ped.setAnuncio(new Anuncio(rs.getInt(16), rs.getString(4)));
            
            lstPedido.add(ped);
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return lstPedido;        
    }
    
    public List<ItensPedido> getItensPedido(int codigo) throws SQLException {
        
        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL ITENSPEDIDO_SELECT (?)}");
        
        cs.setInt(1, codigo);
        
        ResultSet rs = cs.executeQuery();
        
        List<ItensPedido> lstItensPedido = new ArrayList<>();
        
        while (rs.next()) {
            ItensPedido itens = new ItensPedido();
                    
            itens.setCodigoPedido(rs.getInt(1));
            itens.setCodigoProduto(rs.getInt(2));
            itens.setValorVenda(rs.getFloat(3));
            itens.setValorCompra(rs.getFloat(4));
            itens.setQuantidade(rs.getInt(5));
            itens.setTaxa(rs.getFloat(6));
            itens.setNomeCliente(rs.getString(7));
            itens.setValorTotal(rs.getFloat(8));
           
            lstItensPedido.add(itens);
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return lstItensPedido;
    }

}