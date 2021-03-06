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
public class TipoMovimentacao {
    
    private int codigo;
    
    @NotNull(message="Por favor, insira uma descrição válido")
    @NotEmpty(message="Por favor, insira uma descrição válido")
    private String descricao;
    
    private boolean operacao;
    
    public TipoMovimentacao(){
    
    }
    
    public TipoMovimentacao(int codigo, String descricao, boolean operacao){
        this.codigo = codigo;
        this.descricao = descricao;
        this.operacao = operacao;    
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
     * @return the descricao
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descricao the descricao to set
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    /**
     * @return the operacao
     */
    public boolean isOperacao() {
        return operacao;
    }

    /**
     * @param operacao the estoqueMinimo to set
     */
    public void setOperacao(boolean operacao) {
        this.operacao = operacao;
    }
    
}
