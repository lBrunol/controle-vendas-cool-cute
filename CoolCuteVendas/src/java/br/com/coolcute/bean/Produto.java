/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.coolcute.bean;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author Casa
 */
public class Produto {
    
    private int codigo;
    
    @NotNull(message="Por favor, insira um nome válido")
    @NotEmpty(message="Por favor, insira um nome válido")
    private String nome;    
    @NotNull(message="Por favor, um número válido")
    private int estoqueMinimo;

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
    public String getDescricao() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setDescricao(String nome) {
        this.nome = nome;
    }

    /**
     * @return the estoqueMinimo
     */
    public int getEstoqueMinimo() {
        return estoqueMinimo;
    }

    /**
     * @param estoqueMinimo the estoqueMinimo to set
     */
    public void setEstoqueMinimo(int estoqueMinimo) {
        this.estoqueMinimo = estoqueMinimo;
    }
    
}
