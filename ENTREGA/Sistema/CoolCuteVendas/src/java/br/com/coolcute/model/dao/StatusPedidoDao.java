package br.com.coolcute.model.dao;

import br.com.coolcute.bean.StatusPedido;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import br.com.coolcute.util.ConexaoBanco;
import java.sql.CallableStatement;
import org.springframework.stereotype.Repository;

@Repository
public class StatusPedidoDao {    
    
    private CallableStatement cs;
    private Connection c;
    
    public void adicionarStatusPedido(StatusPedido statusPedido) throws SQLException{

        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL STATUSPEDIDO_INSERT (?)}");

        cs.setString(1, statusPedido.getDescricao());

        cs.execute();
        cs.close();

        c.close();
    }

    public void alterarStatusPedido(StatusPedido statusPedido) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL STATUSPEDIDO_UPDATE (?,?)}");
        
        cs.setInt(1, statusPedido.getCodigo());
        cs.setString(2, statusPedido.getDescricao());

        cs.execute();
        cs.close();

        c.close();
    }
    
    public void excluirStatusPedido(int id) throws SQLException{

        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL STATUSPEDIDO_DELETE (?)}");

        cs.setInt(1, id);

        cs.execute();
        cs.close();

        c.close();
    }
    
    public StatusPedido getStatusPedidoItem(int id) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        StatusPedido itemStatusPedido = new StatusPedido();
        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL STATUSPEDIDO_SELECT (?,?)}");
            
        cs.setInt(1, id);
        cs.setString(2, null);

        ResultSet rs = cs.executeQuery();
        
        if (rs.next()) {            
            itemStatusPedido.setCodigo(rs.getInt(1));
            itemStatusPedido.setDescricao(rs.getString(2));           
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return itemStatusPedido;        
    }
    
    public List<StatusPedido> getStatusPedido(StatusPedido statusPedido) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL STATUSPEDIDO_SELECT (?,?)}");
            
        cs.setInt(1, statusPedido.getCodigo());
        cs.setString(2, statusPedido.getDescricao());

        ResultSet rs = cs.executeQuery();
        
        List<StatusPedido> lstStatusPedido = new ArrayList<>();
        
        while (rs.next()) {
            StatusPedido sta = new StatusPedido();
            
            sta.setCodigo(rs.getInt(1));
            sta.setDescricao(rs.getString(2));
            
            lstStatusPedido.add(sta);
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return lstStatusPedido;        
    }

}