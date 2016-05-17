/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.coolcute.bean;

import java.util.Calendar;

/**
 *
 * @author Fabiana
 */
public class Anuncio {
    
    private int codigo;
    private StatusAnuncio statusAnuncio;
    private TipoAnuncio tipoAnuncio;
    private String descricao;
    private float preco;
    private Calendar dataCriacao;

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
     * @return the statusAnuncio
     */
    public StatusAnuncio getStatusAnuncio() {
        return statusAnuncio;
    }

    /**
     * @param statusAnuncio the statusAnuncio to set
     */
    public void setStatusAnuncio(StatusAnuncio statusAnuncio) {
        this.statusAnuncio = statusAnuncio;
    }

    /**
     * @return the tipoAnuncio
     */
    public TipoAnuncio getTipoAnuncio() {
        return tipoAnuncio;
    }

    /**
     * @param tipoAnuncio the tipoAnuncio to set
     */
    public void setTipoAnuncio(TipoAnuncio tipoAnuncio) {
        this.tipoAnuncio = tipoAnuncio;
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
     * @return the dataCriacao
     */
    public Calendar getDataCriacao() {
        return dataCriacao;
    }

    /**
     * @param dataCriacao the dataCriacao to set
     */
    public void setDataCriacao(Calendar dataCriacao) {
        this.dataCriacao = dataCriacao;
    }
}
