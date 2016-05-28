package br.com.coolcute.model.dao;

import br.com.coolcute.bean.Usuario;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import br.com.coolcute.util.ConexaoBanco;
import java.sql.CallableStatement;
import org.springframework.stereotype.Repository;

@Repository
public class UsuarioDao {    
    
    private CallableStatement cs;
    private Connection c;
    
    public void adicionarUsuario(Usuario usuario) throws SQLException{

        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL USUARIO_INSERT (?,?,?,?)}");

        cs.setString(1, usuario.getLogin());
        cs.setString(2, usuario.getSenha());
        cs.setBoolean(3, usuario.isAdministrador());
        cs.setBoolean(4, true);

        cs.execute();
        cs.close();

        c.close();
    }

    public void alterarUsuario(Usuario usuario) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL USUARIO_UPDATE (?,?,?,?,?)}");
        
        cs.setInt(1,usuario.getCodigo());
        cs.setString(2, usuario.getLogin());
        cs.setString(3, usuario.getSenha());
        cs.setBoolean(4, usuario.isAdministrador());
        cs.setBoolean(5, true);

        cs.execute();
        cs.close();

        c.close();
    }
    
    public void excluirUsuario(int id) throws SQLException{

        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL USUARIO_DELETE (?)}");

        cs.setInt(1, id);

        cs.execute();
        cs.close();

        c.close();
    }
    
    public Usuario getUsuarioItem(int id) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        Usuario itemUsuario = new Usuario();
        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL USUARIO_SELECT (?,?)}");
            
        cs.setInt(1, id);
        cs.setString(2, null);

        ResultSet rs = cs.executeQuery();
        
        if (rs.next()) {            
            itemUsuario.setCodigo(rs.getInt(1));
            itemUsuario.setLogin(rs.getString(2));
            itemUsuario.setSenha(rs.getString(3));
            itemUsuario.setConfirmaSenha(rs.getString(3));
            itemUsuario.setAdministrador(rs.getBoolean(4));           
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return itemUsuario;        
    }
    
    public List<Usuario> getUsuario(Usuario usuario) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL USUARIO_SELECT (?,?)}");
            
        cs.setInt(1, usuario.getCodigo());
        cs.setString(2, usuario.getLogin());

        ResultSet rs = cs.executeQuery();
        
        List<Usuario> lstUsuario = new ArrayList<>();
        
        while (rs.next()) {
            Usuario sta = new Usuario();
            
            sta.setCodigo(rs.getInt(1));
            sta.setLogin(rs.getString(2));
            sta.setSenha(rs.getString(3));
            sta.setConfirmaSenha(rs.getString(3));
            sta.setAdministrador(rs.getBoolean(4));
            
            lstUsuario.add(sta);
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return lstUsuario;        
    }
    
    public boolean getUsuarioLogin(String usuario) throws SQLException{
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL VERIFICA_USUARIO (?)}");
            
        cs.setString(1, usuario);
        
        ResultSet rs = cs.executeQuery();
        
        if(rs.next()){
            if(rs.getInt(1) > 0){
                return true;
            } else {
                return false;
            }
        }
        
        return true;
    }

}