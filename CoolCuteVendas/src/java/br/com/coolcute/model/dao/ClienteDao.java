package br.com.coolcute.model.dao;

import br.com.coolcute.bean.Cliente;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import br.com.coolcute.util.ConexaoBanco;
import java.sql.CallableStatement;
import org.springframework.stereotype.Repository;

@Repository
public class ClienteDao {    
    
    private CallableStatement cs;
    private Connection c;
    
    public void adicionarCliente(Cliente cliente) throws SQLException{

        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL CLIENTE_INSERT (?,?)}");

        cs.setString(1, cliente.getNome());
        cs.setString(2, cliente.getEmail());

        cs.execute();
        cs.close();

        c.close();
    }

    public void alterarCliente(Cliente cliente) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL CLIENTE_UPDATE (?,?,?)}");
        
        cs.setInt(1, cliente.getCodigo());
        cs.setString(2, cliente.getNome());
        cs.setString(3, cliente.getEmail());

        cs.execute();
        cs.close();

        c.close();
    }
    
    public void excluirCliente(int id) throws SQLException{

        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL CLIENTE_DELETE (?)}");

        cs.setInt(1, id);

        cs.execute();
        cs.close();

        c.close();
    }
    
    public Cliente getClienteItem(int id) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        Cliente itemCliente = new Cliente();
        
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL CLIENTE_SELECT (?,?,?)}");
            
        cs.setInt(1, id);
        cs.setString(2, null);
        cs.setString(3, null);

        ResultSet rs = cs.executeQuery();
        
        if (rs.next()) {            
            itemCliente.setCodigo(rs.getInt(1));
            itemCliente.setNome(rs.getString(2));
            itemCliente.setEmail(rs.getString(3));
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return itemCliente;        
    }
    
    public List<Cliente> getCliente(Cliente cliente) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        cs = c.prepareCall("{CALL CLIENTE_SELECT (?,?,?)}");
            
        cs.setInt(1, cliente.getCodigo());
        cs.setString(2, cliente.getNome());
        cs.setString(3, cliente.getEmail());

        ResultSet rs = cs.executeQuery();
        
        List<Cliente> lstCliente = new ArrayList<>();
        
        while (rs.next()) {
            Cliente sta = new Cliente();
            
            sta.setCodigo(rs.getInt(1));
            sta.setNome(rs.getString(2));
            sta.setEmail(rs.getString(3));
            
            lstCliente.add(sta);
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return lstCliente;        
    }
}