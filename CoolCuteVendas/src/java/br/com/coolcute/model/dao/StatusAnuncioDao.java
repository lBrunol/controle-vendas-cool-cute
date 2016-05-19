package br.com.coolcute.model.dao;

import br.com.coolcute.bean.StatusAnuncio;
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
public class StatusAnuncioDao {
    
    private String query;
    private PreparedStatement stmt;
    private Connection c;
    
    public void adiciona(StatusAnuncio statusAnuncio) throws SQLException{
        query = "INSERT INTO statusAnuncio( staDescricao ) VALUES (?)";
        ConexaoBanco conn = new ConexaoBanco();
        
        c = conn.conectar();
        stmt = c.prepareStatement(query);

        stmt.setString(1, statusAnuncio.getDescricao());

        stmt.execute();
        stmt.close();

        c.close();
    }

    public void altera(StatusAnuncio statusAnuncio) throws SQLException{
        query = "UPDATE statusAnuncio SET staDescricao = ? WHERE staCodigo = ?";
        ConexaoBanco conn = new ConexaoBanco();

        c = conn.conectar();
        stmt = c.prepareStatement(query);

        stmt.setString(1, statusAnuncio.getDescricao());
        stmt.setInt(2, statusAnuncio.getCodigo());

        stmt.execute();
        stmt.close();

        c.close();
    }
    
    public void exclui(int id) throws SQLException{
        query = "DELETE FROM statusAnuncio WHERE staCodigo = ?";
        ConexaoBanco conn = new ConexaoBanco();

        c = conn.conectar();
        stmt = c.prepareStatement(query);

        stmt.setInt(1, id);

        stmt.execute();
        stmt.close();

        c.close();
    }
    
    public List<StatusAnuncio> getStatusAnuncio() throws SQLException {
        
        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        stmt = c.prepareStatement("SELECT * FROM statusAnuncio");
        ResultSet rs = stmt.executeQuery();
        List<StatusAnuncio> lstStatusAnuncio = new ArrayList<>();
        
        while (rs.next()) {
            StatusAnuncio tia = new StatusAnuncio();
            
            tia.setCodigo(rs.getInt(1));
            tia.setDescricao(rs.getString(2));
            
            lstStatusAnuncio.add(tia);
        }
        
        rs.close();
        stmt.close();
        c.close();
        
        return lstStatusAnuncio;
    }
    
    public List<StatusAnuncio> filterStatusAnuncio(StatusAnuncio statusAnuncio) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        CallableStatement cs = c.prepareCall("{CALL STATUSANUNCIO_SELECT (?,?)}");
            
        cs.setInt(1, statusAnuncio.getCodigo());
        cs.setString(2, statusAnuncio.getDescricao());
        cs.execute();

        ResultSet rs = cs.executeQuery();
        
        List<StatusAnuncio> lstStatusAnuncio = new ArrayList<>();
        
        while (rs.next()) {
            StatusAnuncio tia = new StatusAnuncio();
            
            tia.setCodigo(rs.getInt(1));
            tia.setDescricao(rs.getString(2));
            
            lstStatusAnuncio.add(tia);
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return lstStatusAnuncio;        
    }
    
    public StatusAnuncio getStatusAnuncioItem(Long id) throws SQLException{        
        
        ConexaoBanco cnn = new ConexaoBanco();
        StatusAnuncio itemStatusAnuncio = new StatusAnuncio();
        
        c = cnn.conectar();
        
        stmt = c.prepareStatement("SELECT * FROM statusAnuncio WHERE staCodigo = ?" );
        
        stmt.setLong(1, id);
        
        ResultSet rs = stmt.executeQuery();
        
        while(rs.next()){
            itemStatusAnuncio.setCodigo(rs.getInt(1));
            itemStatusAnuncio.setDescricao(rs.getString(2));       
        }
        
        rs.close();
        stmt.close();
        c.close();
        
        return itemStatusAnuncio;        
    }
}
