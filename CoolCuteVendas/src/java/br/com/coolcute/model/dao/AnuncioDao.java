/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.coolcute.model.dao;

import br.com.coolcute.bean.Anuncio;
import br.com.coolcute.bean.ProdutoAnuncio;
import br.com.coolcute.bean.StatusAnuncio;
import br.com.coolcute.bean.TipoAnuncio;
import br.com.coolcute.util.ConexaoBanco;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Casa
 */
@Repository
public class AnuncioDao {
    
    private String query;
    private PreparedStatement stmt;
    private Connection c;
    
    public List<Anuncio> getAnuncio() throws SQLException {
        
        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        stmt = c.prepareStatement("SELECT a.anuCodigo, s.staDescricao, t.tiaDescricao, a.anuDescricao, a.anuPreco, a.anuDataCriacao FROM anuncio AS a INNER JOIN statusanuncio AS s ON a.staCodigo = s.staCodigo INNER JOIN tipoanuncio AS t on a.tiaCodigo = t.tiaCodigo ORDER BY a.anuCodigo");
        ResultSet rs = stmt.executeQuery();
        List<Anuncio> lstAnuncio = new ArrayList<>();
        
        while (rs.next()) {
            Anuncio anu = new Anuncio();
            StatusAnuncio sta = new StatusAnuncio();
            TipoAnuncio tia = new TipoAnuncio();
            Calendar cal = Calendar.getInstance();
                    
            anu.setCodigo(rs.getInt(1));
            sta.setDescricao(rs.getString(2));
            anu.setStatusAnuncio(sta);
            tia.setDescricao(rs.getString(3));
            anu.setTipoAnuncio(tia);
            anu.setDescricao(rs.getString(4));
            anu.setPreco(rs.getFloat(5));
            
            cal.setTime(rs.getDate(6));
            
            anu.setDataCriacao(cal);
            
            lstAnuncio.add(anu);
        }
        
        rs.close();
        stmt.close();
        c.close();
        
        return lstAnuncio;
    }
    
    public List<ProdutoAnuncio> getAnuncioProduto(int codigo) throws SQLException {
        
        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        stmt = c.prepareStatement("SELECT pro.proCodigo, pro.proNome, pro.proPreco, anu.anuPreco, ROUND((tip.tiaPercentual *  anu.anuPreco),2) as taxa \n" +
"FROM tipoanuncio as tip INNER JOIN (produto AS pro INNER JOIN (anuncio as anu INNER JOIN produtoAnuncio as prodAnu ON prodAnu.anuCodigo = anu.anuCodigo) ON pro.proCodigo = prodAnu.proCodigo) ON tip.tiaCodigo = anu.tiaCodigo WHERE anu.anuCodigo = ? ORDER BY anu.anuDescricao");
        stmt.setInt(1, codigo);
        
        ResultSet rs = stmt.executeQuery();
        List<ProdutoAnuncio> lstAnuncioProduto = new ArrayList<>();
        
        while (rs.next()) {
            ProdutoAnuncio proAnu = new ProdutoAnuncio();
                    
            proAnu.setCodigo(rs.getInt(1));
            proAnu.setNome(rs.getString(2));
            proAnu.setPrecoCompra(rs.getFloat(3));
            proAnu.setPrecoVenda(rs.getFloat(4));
            proAnu.setTaxa(rs.getFloat(5));
           
            lstAnuncioProduto.add(proAnu);
        }
        
        rs.close();
        stmt.close();
        c.close();
        
        return lstAnuncioProduto;
    }
    
}
