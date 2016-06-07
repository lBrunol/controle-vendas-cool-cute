/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.coolcute.bean;

import java.util.List;
import org.joda.time.DateTime;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;

/**
 *
 * @author Casa
 */
public class Entrada {
    
    private int codigo;
    
    private String lote;
    @NumberFormat(style=NumberFormat.Style.CURRENCY)
    private float valorTotal;    
    private String observacao;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private DateTime dataEntrada;
    private List<ItensEntrada> itensEntrada;

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
     * @return the lote
     */
    public String getLote() {
        return lote;
    }

    /**
     * @param lote the lote to set
     */
    public void setLote(String lote) {
        this.lote = lote;
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

    /**
     * @return the dataEntrada
     */
    public DateTime getDataEntrada() {
        return dataEntrada;
    }

    /**
     * @param dataEntrada the dataEntrada to set
     */
    public void setDataEntrada(DateTime dataEntrada) {
        this.dataEntrada = dataEntrada;
    }

    /**
     * @return the itensEntrada
     */
    public List<ItensEntrada> getItensEntrada() {
        return itensEntrada;
    }

    /**
     * @param itensEntrada the itensEntrada to set
     */
    public void setItensEntrada(List<ItensEntrada> itensEntrada) {
        this.itensEntrada = itensEntrada;
    }
    
}
