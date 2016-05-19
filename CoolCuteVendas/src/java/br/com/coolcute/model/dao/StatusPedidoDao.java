package br.com.coolcute.model.dao;

import br.com.coolcute.bean.StatusPedido;
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
public class StatusPedidoDao {
    
    private String query;
    private PreparedStatement stmt;
    private Connection c;
    
    public void adiciona(StatusPedido statusPedido) throws SQLException{
        query = "INSERT INTO statusPedido( stpDescricao ) VALUES (?)";
        ConexaoBanco conn = new ConexaoBanco();
        
        c = conn.conectar();
        stmt = c.prepareStatement(query);

        stmt.setString(1, statusPedido.getDescricao());

        stmt.execute();
        stmt.close();

        c.close();
    }

    public void altera(StatusPedido statusPedido) throws SQLException{
        query = "UPDATE statusPedido SET stpDescricao = ? WHERE stpCodigo = ?";
        ConexaoBanco conn = new ConexaoBanco();

        c = conn.conectar();
        stmt = c.prepareStatement(query);

        stmt.setString(1, statusPedido.getDescricao());
        stmt.setInt(2, statusPedido.getCodigo());

        stmt.execute();
        stmt.close();

        c.close();
    }
    
    public void exclui(int id) throws SQLException{
        query = "DELETE FROM statusPedido WHERE stpCodigo = ?";
        ConexaoBanco conn = new ConexaoBanco();

        c = conn.conectar();
        stmt = c.prepareStatement(query);

        stmt.setInt(1, id);

        stmt.execute();
        stmt.close();

        c.close();
    }
    
    public List<StatusPedido> getStatusPedido() throws SQLException {
        
        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        stmt = c.prepareStatement("SELECT * FROM statusPedido");
        ResultSet rs = stmt.executeQuery();
        List<StatusPedido> lstStatusPedido = new ArrayList<>();
        
        while (rs.next()) {
            StatusPedido stp = new StatusPedido();
            
            stp.setCodigo(rs.getInt(1));
            stp.setDescricao(rs.getString(2));
            
            lstStatusPedido.add(stp);
        }
        
        rs.close();
        stmt.close();
        c.close();
        
        return lstStatusPedido;
    }
    
    public List<StatusPedido> filterStatusPedido(StatusPedido statusPedido) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        CallableStatement cs = c.prepareCall("{CALL STATUSANUNCIO_SELECT (?,?)}");
            
        cs.setInt(1, statusPedido.getCodigo());
        cs.setString(2, statusPedido.getDescricao());
        cs.execute();

        ResultSet rs = cs.executeQuery();
        
        List<StatusPedido> lstStatusPedido = new ArrayList<>();
        
        while (rs.next()) {
            StatusPedido stp = new StatusPedido();
            
            stp.setCodigo(rs.getInt(1));
            stp.setDescricao(rs.getString(2));
            
            lstStatusPedido.add(stp);
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return lstStatusPedido;        
    }
    
    public StatusPedido getStatusPedidoItem(Long id) throws SQLException{        
        
        ConexaoBanco cnn = new ConexaoBanco();
        StatusPedido itemStatusPedido = new StatusPedido();
        
        c = cnn.conectar();
        
        stmt = c.prepareStatement("SELECT * FROM statusPedido WHERE stpCodigo = ?" );
        
        stmt.setLong(1, id);
        
        ResultSet rs = stmt.executeQuery();
        
        while(rs.next()){
            itemStatusPedido.setCodigo(rs.getInt(1));
            itemStatusPedido.setDescricao(rs.getString(2));       
        }
        
        rs.close();
        stmt.close();
        c.close();
        
        return itemStatusPedido;        
    }
}
