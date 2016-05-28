package br.com.coolcute.model.dao;

import br.com.coolcute.bean.TipoMovimentacao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import br.com.coolcute.util.ConexaoBanco;
import java.sql.CallableStatement;
import org.springframework.stereotype.Repository;

@Repository
public class TipoMovimentacaoDao {    
    
    private CallableStatement cs;
    private Connection c;
    
    public void adicionarTipoMovimentacao(TipoMovimentacao tipoMovimentacao) throws SQLException{

        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL TIPOMOVIMENTACAO_INSERT (?,?)}");

        cs.setString(1, tipoMovimentacao.getDescricao());
        cs.setBoolean(2, tipoMovimentacao.isOperacao());

        cs.execute();
        cs.close();

        c.close();
    }

    public void alterarTipoMovimentacao(TipoMovimentacao tipoMovimentacao) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL TIPOMOVIMENTACAO_UPDATE (?,?,?)}");
        
        cs.setInt(1, tipoMovimentacao.getCodigo());
        cs.setString(2, tipoMovimentacao.getDescricao());
        cs.setBoolean(3, tipoMovimentacao.isOperacao());
        
        cs.execute();
        cs.close();

        c.close();
    }
    
    public void excluirTipoMovimentacao(int id) throws SQLException{

        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL TIPOMOVIMENTACAO_DELETE (?)}");

        cs.setInt(1, id);

        cs.execute();
        cs.close();

        c.close();
    }
    
    public TipoMovimentacao getTipoMovimentacaoItem(int id) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        TipoMovimentacao itemTipoMovimentacao = new TipoMovimentacao();
        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL TIPOMOVIMENTACAO_SELECT (?,?)}");
            
        cs.setInt(1, id);
        cs.setString(2, null);

        ResultSet rs = cs.executeQuery();
        
        if (rs.next()) {            
            itemTipoMovimentacao.setCodigo(rs.getInt(1));
            itemTipoMovimentacao.setDescricao(rs.getString(2));
            itemTipoMovimentacao.setOperacao(rs.getBoolean(3));
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return itemTipoMovimentacao;        
    }
    
    public List<TipoMovimentacao> getTipoMovimentacao(TipoMovimentacao tipoMovimentacao) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL TIPOMOVIMENTACAO_SELECT (?,?)}");
            
        cs.setInt(1, tipoMovimentacao.getCodigo());
        cs.setString(2, tipoMovimentacao.getDescricao());

        ResultSet rs = cs.executeQuery();
        
        List<TipoMovimentacao> lstTipoMovimentacao = new ArrayList<>();
        
        while (rs.next()) {
            TipoMovimentacao sta = new TipoMovimentacao();
            
            sta.setCodigo(rs.getInt(1));
            sta.setDescricao(rs.getString(2));
            sta.setOperacao(rs.getBoolean(3));
            
            lstTipoMovimentacao.add(sta);
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return lstTipoMovimentacao;        
    }

}