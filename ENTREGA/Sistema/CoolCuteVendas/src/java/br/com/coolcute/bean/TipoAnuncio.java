/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.coolcute.bean;

import org.springframework.format.annotation.NumberFormat;

/**
 *
 * @author Casa
 */
public class TipoAnuncio {
    
    private int codigo;
    private String descricao;
    @NumberFormat(style=NumberFormat.Style.PERCENT)
    private float percentual;

    
    public TipoAnuncio(){
    
    }
    
    public TipoAnuncio (int codigo, String descricao, float percentual){
        this.codigo = codigo;
        this.descricao = descricao;
        this.percentual = percentual;
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
     * @return the percentual
     */
    public float getPercentual() {
        return percentual;
    }

    /**
     * @param percentual the percentual to set
     */
    public void setPercentual(float percentual) {
        this.percentual = percentual;
    }
    
    
}
