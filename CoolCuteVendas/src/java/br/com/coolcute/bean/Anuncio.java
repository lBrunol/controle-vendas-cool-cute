/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.coolcute.bean;

import java.util.List;
import org.joda.time.DateTime;
import org.springframework.format.annotation.NumberFormat;

/**
 *
 * @author Fabiana
 */
public class Anuncio {
    
    private int codigo;
    private StatusAnuncio statusAnuncio;
    private TipoAnuncio tipoAnuncio;
    private String descricao;
    @NumberFormat(style=NumberFormat.Style.CURRENCY)
    private float preco;
    private DateTime dataCriacao;
    private List<ProdutoAnuncio> produtoAnuncio;
    
    public Anuncio(){
    
    }
    
    public Anuncio(int codigo, StatusAnuncio statusAnuncio, TipoAnuncio tipoAnuncio, String descricao, float preco ){
        this.codigo = codigo;
        this.statusAnuncio = statusAnuncio;
        this.tipoAnuncio = tipoAnuncio;
        this.descricao = descricao;
        this.preco = preco;
    }
    
    public Anuncio(int codigo, StatusAnuncio statusAnuncio, TipoAnuncio tipoAnuncio, String descricao, float preco, DateTime dataCriacao ){
        this.codigo = codigo;
        this.statusAnuncio = statusAnuncio;
        this.tipoAnuncio = tipoAnuncio;
        this.descricao = descricao;
        this.preco = preco;
        this.dataCriacao = dataCriacao;
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
    public DateTime getDataCriacao() {
        return dataCriacao;
    }

    /**
     * @param dataCriacao the dataCriacao to set
     */
    public void setDataCriacao(DateTime dataCriacao) {
        this.dataCriacao = dataCriacao;
    }

    /**
     * @return the produtoAnuncio
     */
    public List<ProdutoAnuncio> getProdutoAnuncio() {
        return produtoAnuncio;
    }

    /**
     * @param produtoAnuncio the produtoAnuncio to set
     */
    public void setProdutoAnuncio(List<ProdutoAnuncio> produtoAnuncio) {
        this.produtoAnuncio = produtoAnuncio;
    }
}
