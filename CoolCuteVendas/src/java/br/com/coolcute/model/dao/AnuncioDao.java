package br.com.coolcute.model.dao;

import br.com.coolcute.bean.Anuncio;
import br.com.coolcute.bean.ProdutoAnuncio;
import br.com.coolcute.bean.StatusAnuncio;
import br.com.coolcute.bean.TipoAnuncio;
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
public class AnuncioDao {    
    
    private CallableStatement cs;
    private Connection c;
    
    public void adicionarAnuncio(Anuncio anuncio) throws SQLException{

        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL ANUNCIO_INSERT (?,?,?,?,?,?)}");

        cs.setInt(1, anuncio.getStatusAnuncio().getCodigo());
        cs.setInt(2, anuncio.getTipoAnuncio().getCodigo());
        cs.setString(3, anuncio.getDescricao());
        cs.setFloat(4, anuncio.getPreco());
        cs.setDate(5, new java.sql.Date(new DateTime().getMillis()));
        cs.setBoolean(6, true);

        cs.execute();
        
        cs = c.prepareCall("{CALL ANUNCIOPRODUTO_INSERT (?,?)}");
        
        for( ProdutoAnuncio lstItens : anuncio.getProdutoAnuncio()){
            cs.setInt(1, lstItens.getCodigo());
            cs.setInt(2, lstItens.getCodigoProduto());
            
            cs.execute();
        }
        
        cs.close();
        c.close();
    }

    public void alterarAnuncio(Anuncio anuncio) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL ANUNCIO_UPDATE (?,?,?,?,?,?)}");
        
        cs.setInt(1, anuncio.getCodigo());
        cs.setInt(2, anuncio.getStatusAnuncio().getCodigo());
        cs.setInt(3, anuncio.getTipoAnuncio().getCodigo());
        cs.setString(4, anuncio.getDescricao());
        cs.setFloat(5 ,anuncio.getPreco());
        cs.setBoolean(6, true);
        cs.execute();
        
        cs = c.prepareCall("{CALL ANUNCIOPRODUTO_INSERT (?,?)}");
        
        for( ProdutoAnuncio lstItens : anuncio.getProdutoAnuncio()){
            cs.setInt(1, anuncio.getCodigo());
            cs.setInt(2, lstItens.getCodigoProduto());
            
            cs.execute();
        }
        
        cs.close();

        c.close();
    }
    
    public void excluirAnuncio(int id) throws SQLException{

        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL ANUNCIO_DELETE (?)}");

        cs.setInt(1, id);

        cs.execute();
        cs.close();

        c.close();
    }
    
    public void excluirProdutoAnuncio (int id) throws SQLException{
        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL ANUNCIOPRODUTO_DELETE (?)}");

        cs.setInt(1, id);

        cs.execute();
        cs.close();

        c.close();
    }
    
    public Anuncio getAnuncioItem(int id) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        Anuncio itemAnuncio = new Anuncio();
        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL ANUNCIO_SELECT (?,?,?,?,?,?)}");
            
        cs.setInt(1, id);
        cs.setString(2, null);
        cs.setFloat(3, 0);
        cs.setDate(4, null);
        cs.setString(5, null);
        cs.setString(6, null);

        ResultSet rs = cs.executeQuery();
        
        if (rs.next()) {
            
            itemAnuncio.setCodigo(rs.getInt(1));
            itemAnuncio.setDescricao(rs.getString(4));
            itemAnuncio.setPreco(rs.getFloat(5));
            itemAnuncio.setDataCriacao(new DateTime(rs.getDate(6).getTime()));
            itemAnuncio.setStatusAnuncio(new StatusAnuncio(rs.getInt(7), rs.getString(2)));            
            itemAnuncio.setTipoAnuncio(new TipoAnuncio(rs.getInt(8), rs.getString(3), 0));
            
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return itemAnuncio;        
    }
    
    public List<Anuncio> getAnuncio(Anuncio anuncio) throws SQLException {
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL ANUNCIO_SELECT (?,?,?,?,?,?)}");
            
        cs.setInt(1, anuncio.getCodigo());
        cs.setString(2, anuncio.getDescricao());
        cs.setFloat(3, anuncio.getPreco());
        
        if(anuncio.getDataCriacao() != null)
            cs.setDate(4, new java.sql.Date(anuncio.getDataCriacao().getMillis()));
        else
            cs.setDate(4, null);        
        
        if(anuncio.getTipoAnuncio() != null)
            cs.setString(5, anuncio.getTipoAnuncio().getDescricao());
        else
            cs.setString(5, null);
        
        if(anuncio.getStatusAnuncio() != null)
            cs.setString(6, anuncio.getStatusAnuncio().getDescricao());
        else
            cs.setString(6, null);
        
        ResultSet rs = cs.executeQuery();
        
        List<Anuncio> lstAnuncio = new ArrayList<>();
        
        while (rs.next()) {
            Anuncio anu = new Anuncio();
            
            anu.setCodigo(rs.getInt(1));
            anu.setDescricao(rs.getString(4));
            anu.setPreco(rs.getFloat(5));
            anu.setDataCriacao(new DateTime(rs.getDate(6).getTime()));
            anu.setStatusAnuncio(new StatusAnuncio(rs.getInt(7), rs.getString(2)));            
            anu.setTipoAnuncio(new TipoAnuncio(rs.getInt(8), rs.getString(3), 0));
            
            lstAnuncio.add(anu);
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return lstAnuncio;        
    }
    
    public List<ProdutoAnuncio> getAnuncioProduto(int codigo) throws SQLException {
        
        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL ANUNCIOPRODUTO_SELECT (?)}");
        
        cs.setInt(1, codigo);
        
        ResultSet rs = cs.executeQuery();
        
        List<ProdutoAnuncio> lstAnuncioProduto = new ArrayList<>();
        
        while (rs.next()) {
            ProdutoAnuncio proAnu = new ProdutoAnuncio();
                    
            proAnu.setCodigoProduto(rs.getInt(1));
            proAnu.setNome(rs.getString(2));
            proAnu.setPrecoCompra(rs.getFloat(3));
            proAnu.setPrecoVenda(rs.getFloat(4));
            proAnu.setTaxa(rs.getFloat(5));
           
            lstAnuncioProduto.add(proAnu);
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return lstAnuncioProduto;
    }

}