package br.com.coolcute.model.dao;

import br.com.coolcute.bean.Entrada;
import br.com.coolcute.bean.ItensEntrada;
import br.com.coolcute.bean.Produto;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import br.com.coolcute.util.ConexaoBanco;
import java.sql.CallableStatement;
import org.springframework.stereotype.Repository;

@Repository
public class EntradaDao {    
    
    private CallableStatement cs;
    private Connection c;
    
    public void adicionarEntrada(Entrada entrada) throws SQLException{

        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        CallableStatement cs = c.prepareCall("{CALL ENTRADA_INSERT (?,?,?)}");
        
        cs.setString(1, entrada.getLote());
        cs.setFloat(2, entrada.getValorTotal());
        cs.setString(3, entrada.getObservacao());
        
        cs.execute();
        
        cs = c.prepareCall("{CALL ITENSENTRADA_INSERT (?,?,?,?)}");
        
        for( ItensEntrada lstItens : entrada.getItensEntrada()){
            new ProdutoDao().atualizaQuantidadeProduto(new Produto(lstItens.getCodigoProduto(),null,0,0,lstItens.getQuantidade()), true);
            cs.setInt(1, lstItens.getCodigoProduto());
            cs.setInt(2, lstItens.getCodigoEntrada());
            cs.setFloat(3, lstItens.getQuantidade());
            cs.setFloat(4, lstItens.getValorTotal());            
            cs.execute();
        }
        
        cs.close();
        c.close();
    }

    public void alterarEntrada(Entrada entrada) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        
        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL ENTRADA_UPDATE (?,?,?,?)}");
        
        cs.setInt(1, entrada.getCodigo());
        cs.setString(2, entrada.getLote());
        cs.setFloat(3, entrada.getValorTotal());
        cs.setString(4, entrada.getObservacao());
        
        cs.execute();
        
        cs = c.prepareCall("{CALL ITENSENTRADA_INSERT (?,?,?,?)}");        
        
        for( ItensEntrada lstItens : entrada.getItensEntrada()){
            new ProdutoDao().atualizaQuantidadeProduto(new Produto(lstItens.getCodigoProduto(),null,0,0,lstItens.getQuantidade()), true);
            cs.setInt(1, lstItens.getCodigoProduto());
            cs.setInt(2, entrada.getCodigo());
            cs.setFloat(3, lstItens.getQuantidade());
            cs.setFloat(4, lstItens.getValorTotal());            
            cs.execute();
        }
        
        cs.close();

        c.close();
    }
    
    public void excluirEntrada(int id) throws SQLException{

        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL ENTRADA_DELETE (?)}");

        cs.setInt(1, id);

        cs.execute();
        cs.close();

        c.close();
    }
    
    public void excluirItensEntrada (Entrada entrada) throws SQLException{
        
        List<ItensEntrada> lstItensAntigos = new ArrayList();
        lstItensAntigos = getItensEntrada(entrada.getCodigo());
        
        for( ItensEntrada lstItens : lstItensAntigos){
            new ProdutoDao().atualizaQuantidadeProduto(new Produto(lstItens.getCodigoProduto(),null,0,0,lstItens.getQuantidade()), false);
        }
        
        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();        
        
        cs = c.prepareCall("{CALL ITENSENTRADA_DELETE (?)}");
        
        cs.setInt(1, entrada.getCodigo());        

        cs.execute();
        cs.close();

        c.close();
    }
    
    public Entrada getEntradaItem(int id) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        Entrada itemEntrada = new Entrada();
        
        c = conn.conectar();
        
        CallableStatement cs = c.prepareCall("{CALL ENTRADA_SELECT (?,?,?,?)}");
            
        cs.setInt(1, id);
        cs.setString(2, null);
        cs.setFloat(3, 0);
        cs.setString(4, null);

        ResultSet rs = cs.executeQuery();
        
        if (rs.next()) {            
            itemEntrada.setCodigo(rs.getInt(1));            
            itemEntrada.setLote(rs.getString(2));
            itemEntrada.setValorTotal(rs.getFloat(3));
            itemEntrada.setObservacao(rs.getString(4));
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return itemEntrada;        
    }
    
    public List<Entrada> getEntrada(Entrada entrada) throws SQLException {
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        CallableStatement cs = c.prepareCall("{CALL ENTRADA_SELECT (?,?,?,?)}");
            
        cs.setInt(1, entrada.getCodigo());
        cs.setString(2, entrada.getLote());
        cs.setFloat(3, entrada.getValorTotal());
        cs.setString(4, entrada.getObservacao());

        ResultSet rs = cs.executeQuery();
        
        List<Entrada> lstEntrada = new ArrayList<>();
        
       
        while (rs.next()) {
            Entrada ent = new Entrada();
        
            ent.setCodigo(rs.getInt(1));            
            ent.setLote(rs.getString(2));
            ent.setValorTotal(rs.getFloat(3));
            ent.setObservacao(rs.getString(4));
            
            lstEntrada.add(ent);
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return lstEntrada;        
    }
    
    public List<ItensEntrada> getItensEntrada(int codigo) throws SQLException {
        
        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL ITENSENTRADA_SELECT (?)}");
        
        cs.setInt(1, codigo);
        
        ResultSet rs = cs.executeQuery();
        
        List<ItensEntrada> lstItensEntrada = new ArrayList<>();
        
        while (rs.next()) {
            ItensEntrada itens = new ItensEntrada();
                    
            itens.setCodigoProduto(rs.getInt(1));
            itens.setCodigoEntrada(rs.getInt(2));
            itens.setQuantidade(rs.getInt(3));
            itens.setValorTotal(rs.getFloat(4));
            itens.setNomeProduto(rs.getString(5));
            itens.setValorProduto(rs.getFloat(6));
            
            lstItensEntrada.add(itens);
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return lstItensEntrada;
    }

}