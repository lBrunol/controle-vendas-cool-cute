package br.com.coolcute.bean;

import javax.validation.constraints.*;
import org.hibernate.validator.constraints.NotEmpty;

public class Cliente {
    
    private int codigo;
    @NotNull(message="Por favor, insira um nome válido")
    @NotEmpty(message="Por favor, insira um nome válido")
    private String nome;
    @NotNull(message="Por favor, insira um e-mail válido")
    @NotEmpty (message="Por favor, insira um e-mail válido")
    private String email;

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
     * @return the nome
     */        
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }
    
}
