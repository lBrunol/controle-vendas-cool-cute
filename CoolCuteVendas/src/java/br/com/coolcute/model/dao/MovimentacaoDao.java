package br.com.coolcute.model.dao;

import br.com.coolcute.bean.Movimentacao;
import br.com.coolcute.bean.TipoMovimentacao;
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
public class MovimentacaoDao {    
    
    private CallableStatement cs;
    private Connection c;
    
    public void adicionarMovimentacao(Movimentacao movimentacao) throws SQLException{

        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL OUTRASMOVIMENTACOES_INSERT (?,?,?,?)}");

        cs.setInt(1, movimentacao.getTipoMovimentacao().getCodigo());
        cs.setString(2, movimentacao.getDescricao());
        cs.setFloat(3, movimentacao.getValor());
        cs.setDate(4, new java.sql.Date(movimentacao.getData().getMillis()));

        cs.execute();
        
        cs.close();
        c.close();
    }

    public void alterarMovimentacao(Movimentacao movimentacao) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL OUTRASMOVIMENTACOES_UPDATE (?,?,?,?,?)}");
        
        cs.setInt(1, movimentacao.getCodigo());
        cs.setInt(2, movimentacao.getTipoMovimentacao().getCodigo());
        cs.setString(3, movimentacao.getDescricao());
        cs.setFloat(4 ,movimentacao.getValor());
        cs.setDate(5, new java.sql.Date(movimentacao.getData().getMillis()));
        
        cs.execute();
        
        cs.close();

        c.close();
    }
    
    public void alterarMovimentacaoDescricao(Movimentacao movimentacao) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL OUTRASMOVIMENTACOES_DESCRICAO_UPDATE (?,?,?)}");
        
        cs.setString(1, movimentacao.getDescricao());
        cs.setFloat(2 ,movimentacao.getValor());
        cs.setDate(3, new java.sql.Date(movimentacao.getData().getMillis()));
        
        cs.execute();
        
        cs.close();

        c.close();
    }
    
    public void excluirMovimentacao(int id) throws SQLException{

        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL OUTRASMOVIMENTACOES_DELETE (?)}");

        cs.setInt(1, id);

        cs.execute();
        cs.close();

        c.close();
    }
    
    public void excluirMovimentacaoDescricao(String descricao) throws SQLException{

        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL OUTRASMOVIMENTACOES_DESCRICAO_DELETE (?)}");

        cs.setString(1, descricao);

        cs.execute();
        cs.close();

        c.close();
    }
    
    public Movimentacao getMovimentacaoItem(int id) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        Movimentacao itemMovimentacao = new Movimentacao();
        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL OUTRASMOVIMENTACOES_SELECT (?,?,?,?,?)}");
            
        cs.setInt(1, id);
        cs.setString(2, null);
        cs.setFloat(3, 0);
        cs.setDate(4, null);
        cs.setString(5, null);

        ResultSet rs = cs.executeQuery();
        
        if (rs.next()) {
            
            itemMovimentacao.setCodigo(rs.getInt(1));
            itemMovimentacao.setDescricao(rs.getString(2));
            itemMovimentacao.setValor(rs.getFloat(3));
            itemMovimentacao.setData(new DateTime(rs.getDate(4).getTime()));
            itemMovimentacao.setTipoMovimentacao(new TipoMovimentacao(rs.getInt(5), rs.getString(6), true));
            
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return itemMovimentacao;        
    }
    
    public List<Movimentacao> getMovimentacao(Movimentacao movimentacao) throws SQLException {
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL OUTRASMOVIMENTACOES_SELECT (?,?,?,?,?)}");
            
        cs.setInt(1, movimentacao.getCodigo());
        cs.setString(2, movimentacao.getDescricao());
        cs.setFloat(3, movimentacao.getValor());
        
        if(movimentacao.getData() != null)
            cs.setDate(4, new java.sql.Date(movimentacao.getData().getMillis()));
        else
            cs.setDate(4, null);        
        
        if(movimentacao.getTipoMovimentacao() != null)
            cs.setString(5, movimentacao.getTipoMovimentacao().getDescricao());
        else
            cs.setString(5, null);
        
        ResultSet rs = cs.executeQuery();
        
        List<Movimentacao> lstMovimentacao = new ArrayList<>();
        
        while (rs.next()) {
            Movimentacao mov = new Movimentacao();
            
            mov.setCodigo(rs.getInt(1));
            mov.setDescricao(rs.getString(2));
            mov.setValor(rs.getFloat(3));
            mov.setData(new DateTime(rs.getDate(4).getTime()));
            mov.setTipoMovimentacao(new TipoMovimentacao(rs.getInt(5), rs.getString(6), true));
            
            lstMovimentacao.add(mov);
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return lstMovimentacao;        
    }  
}