package br.com.coolcute.model.dao;

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
public class ProdutoDao {    
    
    private CallableStatement cs;
    private Connection c;
    
    public void adicionarProduto(Produto produto) throws SQLException{

        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL PRODUTO_INSERT (?,?,?,?)}");

        cs.setString(1, produto.getNome());
        cs.setInt(2, produto.getEstoqueMinimo());
        cs.setFloat(3, produto.getPreco());
        cs.setBoolean(4, true);

        cs.execute();
        cs.close();

        c.close();
    }

    public void alterarProduto(Produto produto) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL PRODUTO_UPDATE (?,?,?,?,?)}");
        
        cs.setInt(1, produto.getCodigo());
        cs.setString(2, produto.getNome());
        cs.setInt(3, produto.getEstoqueMinimo());
        cs.setFloat(4, produto.getPreco());
        cs.setBoolean(5, true);

        cs.execute();
        cs.close();

        c.close();
    }
    
    public void excluirProduto(int id) throws SQLException{

        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL PRODUTO_DELETE (?)}");

        cs.setInt(1, id);

        cs.execute();
        cs.close();

        c.close();
    }
    
    public Produto getProdutoItem(int id) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        Produto itemProduto = new Produto();
        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL PRODUTO_SELECT (?,?,?,?)}");
            
        cs.setInt(1, id);
        cs.setString(2, null);
        cs.setFloat(3, 0);
        cs.setInt(4, 0);

        ResultSet rs = cs.executeQuery();
        
        if (rs.next()) {            
            itemProduto.setCodigo(rs.getInt(1));
            itemProduto.setNome(rs.getString(2));            
            itemProduto.setEstoqueMinimo(rs.getInt(3));
            itemProduto.setPreco(rs.getFloat(4));
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return itemProduto;        
    }
    
    public List<Produto> getProduto(Produto produto) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL PRODUTO_SELECT (?,?,?,?)}");
            
        cs.setInt(1, produto.getCodigo());
        cs.setString(2, produto.getNome());
        cs.setFloat(3, produto.getPreco());
        cs.setInt(4, produto.getQuantidade());

        ResultSet rs = cs.executeQuery();
        
        List<Produto> lstProduto = new ArrayList<>();
        
        while (rs.next()) {
            Produto sta = new Produto();
            
            sta.setCodigo(rs.getInt(1));
            sta.setNome(rs.getString(2));
            sta.setEstoqueMinimo(rs.getInt(3));
            sta.setPreco(rs.getFloat(4));
            sta.setQuantidade(rs.getInt(5));
            
            lstProduto.add(sta);
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return lstProduto;        
    }
    
    public void atualizaQuantidadeProduto (Produto produto, boolean operacao) throws SQLException{
        ConexaoBanco conn = new ConexaoBanco();
        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL ATUALIZA_QUANTIDADE_PRODUTO(?,?,?)}");
        
        cs.setInt(1, produto.getCodigo());
        cs.setInt(2, produto.getQuantidade());
        cs.setBoolean(3, operacao);
        
        cs.execute();
        cs.close();
        
        c.close();       
    }

}