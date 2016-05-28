package br.com.coolcute.model.dao;

import br.com.coolcute.bean.TipoAnuncio;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import br.com.coolcute.util.ConexaoBanco;
import java.sql.CallableStatement;
import org.springframework.stereotype.Repository;

@Repository
public class TipoAnuncioDao {    
    
    private CallableStatement cs;
    private Connection c;
    
    public void adicionarTipoAnuncio(TipoAnuncio tipoAnuncio) throws SQLException{

        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL TIPOANUNCIO_INSERT (?,?)}");

        cs.setString(1, tipoAnuncio.getDescricao());
        cs.setFloat(2, tipoAnuncio.getPercentual());
        cs.execute();
        cs.close();

        c.close();
    }

    public void alterarTipoAnuncio(TipoAnuncio tipoAnuncio) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL TIPOANUNCIO_UPDATE (?,?,?)}");
        
        cs.setInt(1, tipoAnuncio.getCodigo());
        cs.setString(2, tipoAnuncio.getDescricao());
        cs.setFloat(3, tipoAnuncio.getPercentual());
        
        cs.execute();
        cs.close();

        c.close();
    }
    
    public void excluirTipoAnuncio(int id) throws SQLException{

        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL TIPOANUNCIO_DELETE (?)}");

        cs.setInt(1, id);

        cs.execute();
        cs.close();

        c.close();
    }
    
    public TipoAnuncio getTipoAnuncioItem(int id) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        TipoAnuncio itemTipoAnuncio = new TipoAnuncio();
        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL TIPOANUNCIO_SELECT (?,?)}");
            
        cs.setInt(1, id);
        cs.setString(2, null);

        ResultSet rs = cs.executeQuery();
        
        if (rs.next()) {            
            itemTipoAnuncio.setCodigo(rs.getInt(1));
            itemTipoAnuncio.setDescricao(rs.getString(2));
            itemTipoAnuncio.setPercentual(rs.getFloat(3));
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return itemTipoAnuncio;        
    }
    
    public List<TipoAnuncio> getTipoAnuncio(TipoAnuncio tipoAnuncio) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL TIPOANUNCIO_SELECT (?,?)}");
            
        cs.setInt(1, tipoAnuncio.getCodigo());
        cs.setString(2, tipoAnuncio.getDescricao());

        ResultSet rs = cs.executeQuery();
        
        List<TipoAnuncio> lstTipoAnuncio = new ArrayList<>();
        
        while (rs.next()) {
            TipoAnuncio sta = new TipoAnuncio();
            
            sta.setCodigo(rs.getInt(1));
            sta.setDescricao(rs.getString(2));
            sta.setPercentual(rs.getFloat(3));
            
            lstTipoAnuncio.add(sta);
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return lstTipoAnuncio;        
    }

}