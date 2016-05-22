package br.com.coolcute.model.dao;

import br.com.coolcute.bean.Cliente;
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
public class ClienteDao {
    
    private String query;
    private PreparedStatement stmt;
    private Connection c;
    
    public void adiciona(Cliente cliente) throws SQLException{
        query = "INSERT INTO cliente( cliNome, cliEmail) VALUES (?,?)";
        ConexaoBanco conn = new ConexaoBanco();
        
        c = conn.conectar();
        stmt = c.prepareStatement(query);

        stmt.setString(1, cliente.getNome());
        stmt.setString(2, cliente.getEmail());

        stmt.execute();
        stmt.close();

        c.close();
    }

    public void altera(Cliente cliente) throws SQLException{
        query = "UPDATE cliente SET cliNome = ? , cliEmail = ? WHERE cliCodigo = ?";
        ConexaoBanco conn = new ConexaoBanco();

        c = conn.conectar();
        stmt = c.prepareStatement(query);

        stmt.setString(1, cliente.getNome());
        stmt.setString(2, cliente.getEmail());
        stmt.setInt(3, cliente.getCodigo());

        stmt.execute();
        stmt.close();

        c.close();
    }
    
    public void exclui(int id) throws SQLException{
        query = "DELETE FROM cliente WHERE cliCodigo = ?";
        ConexaoBanco conn = new ConexaoBanco();

        c = conn.conectar();
        stmt = c.prepareStatement(query);

        stmt.setInt(1, id);

        stmt.execute();
        stmt.close();

        c.close();
    }
    
    public List<Cliente> getCliente() throws SQLException {
        
        ConexaoBanco conn = new ConexaoBanco();        
        c = conn.conectar();
        
        stmt = c.prepareStatement("SELECT * FROM cliente ORDER BY cliNome");
        ResultSet rs = stmt.executeQuery();
        List<Cliente> lstCliente = new ArrayList<>();
        
        while (rs.next()) {
            Cliente tia = new Cliente();
            
            tia.setCodigo(rs.getInt(1));
            tia.setNome(rs.getString(2));
            tia.setEmail(rs.getString(3));
            
            lstCliente.add(tia);
        }
        
        rs.close();
        stmt.close();
        c.close();
        
        return lstCliente;
    }
    
    public List<Cliente> filterCliente(Cliente cliente) throws SQLException{
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        CallableStatement cs = c.prepareCall("{CALL CLIENTE_SELECT (?,?,?)}");
            
        cs.setInt(1, cliente.getCodigo());
        cs.setString(2, cliente.getNome());
        cs.setString(3, cliente.getEmail());
        cs.execute();

        ResultSet rs = cs.executeQuery();
        
        List<Cliente> lstCliente = new ArrayList<>();
        
        while (rs.next()) {
            Cliente tia = new Cliente();
            
            tia.setCodigo(rs.getInt(1));
            tia.setNome(rs.getString(2));
            tia.setEmail(rs.getString(3));
            
            lstCliente.add(tia);
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return lstCliente;        
    }
    
    public Cliente getClienteItem(Long id) throws SQLException{        
        
        ConexaoBanco cnn = new ConexaoBanco();
        Cliente itemCliente = new Cliente();
        
        c = cnn.conectar();
        
        stmt = c.prepareStatement("SELECT * FROM cliente WHERE cliCodigo = ?" );
        
        stmt.setLong(1, id);
        
        ResultSet rs = stmt.executeQuery();
        
        while(rs.next()){
            itemCliente.setCodigo(rs.getInt(1));
            itemCliente.setNome(rs.getString(2));
            itemCliente.setEmail(rs.getString(3));            
        }
        
        rs.close();
        stmt.close();
        c.close();
        
        return itemCliente;        
    }
}
