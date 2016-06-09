/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.coolcute.util;

import br.com.coolcute.bean.Cliente;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Casa
 */
public class ObterId {
    
    private String query;
    private PreparedStatement stmt;
    private static Connection c;
    
    public static int obterId(String tabela) throws SQLException{
        
        int proximoId = 0;
        
        ConexaoBanco conn = new ConexaoBanco();
        c = conn.conectar();
        
        CallableStatement cs = c.prepareCall("{CALL RETORNA_INDEX (?)}");
            
        cs.setString(1, tabela);
        cs.execute();

        ResultSet rs = cs.executeQuery();

        if (rs.next()) {            
            proximoId = rs.getInt(1);
        }
        
        rs.close();
        cs.close();
        c.close();
        
        return proximoId;         
    }    
}
