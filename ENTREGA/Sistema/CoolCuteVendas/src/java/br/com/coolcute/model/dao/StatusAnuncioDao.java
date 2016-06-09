package br.com.coolcute.model.dao;

import br.com.coolcute.bean.StatusAnuncio;
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
    
    private CallableStatement cs;
    private Connection c;
    
    public void adicionarStatusAnuncio(StatusAnuncio statusAnuncio) throws SQLException{

        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL STATUSANUNCIO_INSERT (?)}");

        cs.setString(1, statusAnuncio.getDescricao());

        cs.execute();
        cs.close();

        c.close();
    }

    public void alterarStatusAnuncio(StatusAnuncio statusAnuncio) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL STATUSANUNCIO_UPDATE (?,?)}");
        
        cs.setInt(1, statusAnuncio.getCodigo());
        cs.setString(2, statusAnuncio.getDescricao());

        cs.execute();
        cs.close();

        c.close();
    }
    
    public void excluirStatusAnuncio(int id) throws SQLException{

        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL STATUSANUNCIO_DELETE (?)}");

        cs.setInt(1, id);

        cs.execute();
        cs.close();

        c.close();
    }
    
    public StatusAnuncio getStatusAnuncioItem(int id) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        StatusAnuncio itemStatusAnuncio = new StatusAnuncio();
        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL STATUSANUNCIO_SELECT (?,?)}");
            
        cs.setInt(1, id);
        cs.setString(2, null);

        ResultSet rs = cs.executeQuery();
        
        if (rs.next()) {            
            itemStatusAnuncio.setCodigo(rs.getInt(1));
            itemStatusAnuncio.setDescricao(rs.getString(2));           
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return itemStatusAnuncio;        
    }
    
    public List<StatusAnuncio> getStatusAnuncio(StatusAnuncio statusAnuncio) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL STATUSANUNCIO_SELECT (?,?)}");
            
        cs.setInt(1, statusAnuncio.getCodigo());
        cs.setString(2, statusAnuncio.getDescricao());

        ResultSet rs = cs.executeQuery();
        
        List<StatusAnuncio> lstStatusAnuncio = new ArrayList<>();
        
        while (rs.next()) {
            StatusAnuncio sta = new StatusAnuncio();
            
            sta.setCodigo(rs.getInt(1));
            sta.setDescricao(rs.getString(2));
            
            lstStatusAnuncio.add(sta);
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return lstStatusAnuncio;        
    }

}