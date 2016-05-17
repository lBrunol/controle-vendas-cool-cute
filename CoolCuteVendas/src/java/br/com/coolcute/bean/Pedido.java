/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.coolcute.bean;

import java.util.Calendar;

/**
 *
 * @author Casa
 */
public class Pedido {
    
    private int codigo;
    private TipoAvaliacao tipoAvaliacao;
    private StatusPedido statusPedido;
    private Anuncio anuncio;
    private Cliente cliente;
    private Calendar dataVenda;
    private float frete;
    private Calendar dataPostagem;
    private Calendar dataEntrega;
    private float valorTotal;
    private String codigoPostagem;
    private String observacao;
    

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
     * @return the tipoAvaliacao
     */
    public TipoAvaliacao getTipoAvaliacao() {
        return tipoAvaliacao;
    }

    /**
     * @param tipoAvaliacao the tipoAvaliacao to set
     */
    public void setTipoAvaliacao(TipoAvaliacao tipoAvaliacao) {
        this.tipoAvaliacao = tipoAvaliacao;
    }

    /**
     * @return the statusPedido
     */
    public StatusPedido getStatusPedido() {
        return statusPedido;
    }

    /**
     * @param statusPedido the statusPedido to set
     */
    public void setStatusPedido(StatusPedido statusPedido) {
        this.statusPedido = statusPedido;
    }

    /**
     * @return the anuncio
     */
    public Anuncio getAnuncio() {
        return anuncio;
    }

    /**
     * @param anuncio the anuncio to set
     */
    public void setAnuncio(Anuncio anuncio) {
        this.anuncio = anuncio;
    }

    /**
     * @return the cliente
     */
    public Cliente getCliente() {
        return cliente;
    }

    /**
     * @param cliente the cliente to set
     */
    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    /**
     * @return the dataVenda
     */
    public Calendar getDataVenda() {
        return dataVenda;
    }

    /**
     * @param dataVenda the dataVenda to set
     */
    public void setDataVenda(Calendar dataVenda) {
        this.dataVenda = dataVenda;
    }

    /**
     * @return the frete
     */
    public float getFrete() {
        return frete;
    }

    /**
     * @param frete the frete to set
     */
    public void setFrete(float frete) {
        this.frete = frete;
    }

    /**
     * @return the dataPostagem
     */
    public Calendar getDataPostagem() {
        return dataPostagem;
    }

    /**
     * @param dataPostagem the dataPostagem to set
     */
    public void setDataPostagem(Calendar dataPostagem) {
        this.dataPostagem = dataPostagem;
    }

    /**
     * @return the dataEntrega
     */
    public Calendar getDataEntrega() {
        return dataEntrega;
    }

    /**
     * @param dataEntrega the dataEntrega to set
     */
    public void setDataEntrega(Calendar dataEntrega) {
        this.dataEntrega = dataEntrega;
    }

    /**
     * @return the valorTotal
     */
    public float getValorTotal() {
        return valorTotal;
    }

    /**
     * @param valorTotal the valorTotal to set
     */
    public void setValorTotal(float valorTotal) {
        this.valorTotal = valorTotal;
    }

    /**
     * @return the codigoPostagem
     */
    public String getCodigoPostagem() {
        return codigoPostagem;
    }

    /**
     * @param codigoPostagem the codigoPostagem to set
     */
    public void setCodigoPostagem(String codigoPostagem) {
        this.codigoPostagem = codigoPostagem;
    }

    /**
     * @return the observacao
     */
    public String getObservacao() {
        return observacao;
    }

    /**
     * @param observacao the observacao to set
     */
    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }
    
}
