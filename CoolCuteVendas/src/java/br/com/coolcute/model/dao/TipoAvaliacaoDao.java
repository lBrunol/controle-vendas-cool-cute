package br.com.coolcute.model.dao;

import br.com.coolcute.bean.TipoAvaliacao;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import br.com.coolcute.util.ConexaoBanco;
import java.sql.CallableStatement;
import org.springframework.stereotype.Repository;

@Repository
public class TipoAvaliacaoDao {
    
    private String query;
    private PreparedStatement stmt;
    private Connection c;
    
    public void adiciona(TipoAvaliacao tipoAvaliacoes) throws SQLException{
        query = "INSERT INTO tipoAvaliacoes( tivDescricao ) VALUES (?)";
        ConexaoBanco conn = new ConexaoBanco();
        
        c = conn.conectar();
        stmt = c.prepareStatement(query);

        stmt.setString(1, tipoAvaliacoes.getDescricao());

        stmt.execute();
        stmt.close();

        c.close();
    }

    public void altera(TipoAvaliacao tipoAvaliacoes) throws SQLException{
        query = "UPDATE tipoAvaliacoes SET tivDescricao = ? WHERE tivCodigo = ?";
        ConexaoBanco conn = new ConexaoBanco();

        c = conn.conectar();
        stmt = c.prepareStatement(query);

        stmt.setString(1, tipoAvaliacoes.getDescricao());
        stmt.setInt(2, tipoAvaliacoes.getCodigo());

        stmt.execute();
        stmt.close();

        c.close();
    }
    
    public void exclui(int id) throws SQLException{
        query = "DELETE FROM tipoAvaliacoes WHERE tivCodigo = ?";
        ConexaoBanco conn = new ConexaoBanco();

        c = conn.conectar();
        stmt = c.prepareStatement(query);

        stmt.setInt(1, id);

        stmt.execute();
        stmt.close();

        c.close();
    }
    
    public List<TipoAvaliacao> getTipoAvaliacao() throws SQLException {
        
        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        stmt = c.prepareStatement("SELECT * FROM tipoAvaliacoes");
        ResultSet rs = stmt.executeQuery();
        List<TipoAvaliacao> lstTipoAvaliacao = new ArrayList<>();
        
        while (rs.next()) {
            TipoAvaliacao tia = new TipoAvaliacao();
            
            tia.setCodigo(rs.getInt(1));
            tia.setDescricao(rs.getString(2));
            
            lstTipoAvaliacao.add(tia);
        }
        
        rs.close();
        stmt.close();
        c.close();
        
        return lstTipoAvaliacao;
    }
    
    public List<TipoAvaliacao> filterTipoAvaliacao(TipoAvaliacao tipoAvaliacoes) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        CallableStatement cs = c.prepareCall("{CALL STATUSANUNCIO_SELECT (?,?)}");
            
        cs.setInt(1, tipoAvaliacoes.getCodigo());
        cs.setString(2, tipoAvaliacoes.getDescricao());
        cs.execute();

        ResultSet rs = cs.executeQuery();
        
        List<TipoAvaliacao> lstTipoAvaliacao = new ArrayList<>();
        
        while (rs.next()) {
            TipoAvaliacao tia = new TipoAvaliacao();
            
            tia.setCodigo(rs.getInt(1));
            tia.setDescricao(rs.getString(2));
            
            lstTipoAvaliacao.add(tia);
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return lstTipoAvaliacao;        
    }
    
    public TipoAvaliacao getTipoAvaliacaoItem(Long id) throws SQLException{        
        
        ConexaoBanco cnn = new ConexaoBanco();
        TipoAvaliacao itemTipoAvaliacao = new TipoAvaliacao();
        
        c = cnn.conectar();
        
        stmt = c.prepareStatement("SELECT * FROM tipoAvaliacoes WHERE tivCodigo = ?" );
        
        stmt.setLong(1, id);
        
        ResultSet rs = stmt.executeQuery();
        
        while(rs.next()){
            itemTipoAvaliacao.setCodigo(rs.getInt(1));
            itemTipoAvaliacao.setDescricao(rs.getString(2));       
        }
        
        rs.close();
        stmt.close();
        c.close();
        
        return itemTipoAvaliacao;        
    }
}