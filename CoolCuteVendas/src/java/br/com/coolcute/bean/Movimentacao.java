/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.coolcute.bean;

import org.joda.time.DateTime;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;

/**
 *
 * @author Fabiana
 */
public class Movimentacao {
    
    private int codigo;
    private TipoMovimentacao tipoMovimentacao;
    private String descricao;
    @NumberFormat(style=NumberFormat.Style.CURRENCY)
    private float valor;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private DateTime data;
    
    public Movimentacao(){
    
    }
    
    public Movimentacao(int codigo, TipoMovimentacao tipoMovimentacao, String descricao, float valor, DateTime data){
        this.codigo = codigo;
        this.tipoMovimentacao = tipoMovimentacao;
        this.descricao = descricao;
        this.valor = valor;
        this.data = data;
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
     * @return the tipoMovimentacao
     */
    public TipoMovimentacao getTipoMovimentacao() {
        return tipoMovimentacao;
    }

    /**
     * @param tipoMovimentacao the tipoMovimentacao to set
     */
    public void setTipoMovimentacao(TipoMovimentacao tipoMovimentacao) {
        this.tipoMovimentacao = tipoMovimentacao;
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
     * @return the valor
     */
    public float getValor() {
        return valor;
    }

    /**
     * @param valor the valor to set
     */
    public void setValor(float valor) {
        this.valor = valor;
    }

    /**
     * @return the data
     */
    public DateTime getData() {
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(DateTime data) {
        this.data = data;
    }
    
}
