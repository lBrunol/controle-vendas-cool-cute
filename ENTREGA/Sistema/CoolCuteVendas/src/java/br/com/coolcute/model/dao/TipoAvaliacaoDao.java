package br.com.coolcute.model.dao;

import br.com.coolcute.bean.TipoAvaliacao;
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
    
    private CallableStatement cs;
    private Connection c;
    
    public void adicionarTipoAvaliacao(TipoAvaliacao tipoAvaliacao) throws SQLException{

        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL TIPOAVALIACOES_INSERT (?)}");

        cs.setString(1, tipoAvaliacao.getDescricao());

        cs.execute();
        cs.close();

        c.close();
    }

    public void alterarTipoAvaliacao(TipoAvaliacao tipoAvaliacao) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL TIPOAVALIACOES_UPDATE (?,?)}");
        
        cs.setInt(1, tipoAvaliacao.getCodigo());
        cs.setString(2, tipoAvaliacao.getDescricao());

        cs.execute();
        cs.close();

        c.close();
    }
    
    public void excluirTipoAvaliacao(int id) throws SQLException{

        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL TIPOAVALIACOES_DELETE (?)}");

        cs.setInt(1, id);

        cs.execute();
        cs.close();

        c.close();
    }
    
    public TipoAvaliacao getTipoAvaliacaoItem(int id) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        TipoAvaliacao itemTipoAvaliacao = new TipoAvaliacao();
        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL TIPOAVALIACAO_SELECT (?,?)}");
            
        cs.setInt(1, id);
        cs.setString(2, null);

        ResultSet rs = cs.executeQuery();
        
        if (rs.next()) {            
            itemTipoAvaliacao.setCodigo(rs.getInt(1));
            itemTipoAvaliacao.setDescricao(rs.getString(2));           
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return itemTipoAvaliacao;        
    }
    
    public List<TipoAvaliacao> getTipoAvaliacao(TipoAvaliacao tipoAvaliacao) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL TIPOAVALIACAO_SELECT (?,?)}");
            
        cs.setInt(1, tipoAvaliacao.getCodigo());
        cs.setString(2, tipoAvaliacao.getDescricao());

        ResultSet rs = cs.executeQuery();
        
        List<TipoAvaliacao> lstTipoAvaliacao = new ArrayList<>();
        
        while (rs.next()) {
            TipoAvaliacao sta = new TipoAvaliacao();
            
            sta.setCodigo(rs.getInt(1));
            sta.setDescricao(rs.getString(2));
            
            lstTipoAvaliacao.add(sta);
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return lstTipoAvaliacao;        
    }

}