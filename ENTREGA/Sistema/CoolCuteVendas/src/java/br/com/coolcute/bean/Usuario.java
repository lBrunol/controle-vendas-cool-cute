
package br.com.coolcute.bean;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;

public class Usuario {
    
    private int codigo;
    
    @NotNull(message="Por favor, insira um login válido")
    @NotEmpty(message="Por favor, insira um login válido")
    private String login;
    
    @NotNull(message="Por favor, insira uma senha válida")
    @NotEmpty(message="Por favor, insira uma senha válida")
    private String senha;
    
    private String confirmaSenha;
    
    private boolean administrador;

    /**
     * @return the codigo
     */
    public int getCodigo() {
        return codigo;
    }

    /**
     * @param codigo the codigo to set
     */
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    /**
     * @return the login
     */
    public String getLogin() {
        return login;
    }

    /**
     * @param login the login to set
     */
    public void setLogin(String login) {
        this.login = login;
    }

    /**
     * @return the senha
     */
    public String getSenha() {
        return senha;
    }

    /**
     * @param senha the senha to set
     */
    public void setSenha(String senha) {
        this.senha = senha;
    }

    /**
     * @return the confirmaSenha
     */
    public String getConfirmaSenha() {
        return confirmaSenha;
    }

    /**
     * @param confirmaSenha the confirmaSenha to set
     */
    public void setConfirmaSenha(String confirmaSenha) {
        this.confirmaSenha = confirmaSenha;
    }

    /**
     * @return the administrador
     */
    public boolean isAdministrador() {
        return administrador;
    }

    /**
     * @param administrador the administrador to set
     */
    public void setAdministrador(boolean administrador) {
        this.administrador = administrador;
    }
    
}
