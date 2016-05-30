/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.coolcute.bean;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.NumberFormat;

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
    @NumberFormat(style=NumberFormat.Style.CURRENCY)
    private float preco;
    private int quantidade;
    
    public Produto(){
    
    }

    public Produto(int codigo, String nome, int estoqueMinimo, float preco, int quantidade ){
        this.codigo = codigo;
        this.nome = nome;
        this.estoqueMinimo = estoqueMinimo;
        this.preco = preco;
        this.quantidade = quantidade;       
    }

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

    /**
     * @return the preco
     */
    public float getPreco() {
        return preco;
    }

    /**
     * @param preco the preco to set
     */
    public void setPreco(float preco) {
        this.preco = preco;
    }

    /**
     * @return the quantidade
     */
    public int getQuantidade() {
        return quantidade;
    }

    /**
     * @param quantidade the quantidade to set
     */
    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
    
}
