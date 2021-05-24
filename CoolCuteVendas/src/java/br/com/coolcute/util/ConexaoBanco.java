package br.com.coolcute.util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConexaoBanco {

    private String usuario;
    private String senha;
    private boolean connected;
   
    public Connection c;
   
    /**
     * Construtor da classe
     * @param usuario Nome do usuário
     * @param senha Senha do usuário
     */
    public ConexaoBanco(String usuario, String senha ) {
        this.senha = senha;
        this.usuario = usuario;
    }
    
    public ConexaoBanco() {
        this.senha = "Fanbno022!";
        this.usuario = "gaia";
    }
   
    /**
     * Método que estabelece a conexão com o banco de dados
     *
     * @return True se conseguir conectar, falso em caso contrário.
     */
    public Connection conectar() {
      
        String userName   = this.usuario;
        String passName   = this.senha;
        String url = "jdbc:mysql://192.168.1.113:3306/cool?tcpKeepAlive=true&autoReconnect=true&user=gaia&password=Fanbno022!&useSSL=false"; 
        try {
            Class.forName("com.mysql.jdbc.Driver");
            this.c = DriverManager.getConnection(url,userName, passName);            
            connected = true;
        } catch( SQLException e ) {
            System.out.println(e.getStackTrace().toString());
            connected = false;
        } catch ( ClassNotFoundException e ) {
        	
            connected = false;
        }
        return this.c;
    }
   
    /**
     * Método que estabelece a desconexão com o banco de dados
     *
     * @return True se conseguir desconectar, falso em caso contrário.
     */
    public boolean desconectar() {
      
        try {
            if (connected == true){
                c.close();
                connected = false;
            }
        } catch( SQLException e ) {            
            connected = false;
        }
       
        //Retorna se está ou não conectado
        return connected;
    }

    /**
     * Esse método executa a query dada, e retorna um ResultSet
     * Talvez fosse melhor idéia fazer esse método lançar uma exception
     * a faze-lo retornar null como eu fiz, porém isso é apenas um exemplo
     * para demonstrar a funcionalidade do comando execute
     *
     * @param query String contendo a query que se deseja executar
     * @return ResultSet em caso de estar tudo Ok, null em caso de erro.
     */
    public ResultSet executar( String query ) {            	
    	PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
        	conectar();
        	stmt = this.c.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(query);
            return rs;
        } catch ( SQLException e ) {
            
        }finally{
            desconectar();            
        }
        return null;        
    }
   
    /**
     * Executa uma query como update, delete ou insert.
     * Retorna o número de registros afetados quando falamos de um update ou delete
     * ou retorna 1 quando o insert é bem sucedido. Em outros casos retorna -1
     *
     * @param query A query que se deseja executar
     * @return 0 para um insert bem sucedido. -1 para erro
     */
    public int inserir( String query ) {
        Statement st = null;
        int result = -1;
       
        try {
            conectar();
            st = this.c.createStatement();
            result = st.executeUpdate(query);
        } catch ( SQLException e ) {
            e.printStackTrace();
        }finally{
            desconectar();
        }
       
        return result;
    }
        
    /**
     * Este executa procedures do tipo Update, Insert e Delete.
     * @param procedure Passar a string da procedure
     */
    public void executaProcedure(String procedure) throws SQLException{        
        try {
            conectar();
            CallableStatement stmt = c.prepareCall("{call " + procedure + "}");    
            stmt.execute();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            desconectar();
        }
    }
}