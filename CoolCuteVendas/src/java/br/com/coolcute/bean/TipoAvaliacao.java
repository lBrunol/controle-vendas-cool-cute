package br.com.coolcute.bean;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;

public class TipoAvaliacao {
    
    private int codigo;
    @NotNull(message="Por favor, insira uma descrição válido")
    @NotEmpty(message="Por favor, insira uma descrição válido")
    private String descricao;
    
    public TipoAvaliacao(){
    
    }
    
    public TipoAvaliacao(int codigo, String descricao){
        this.codigo = codigo;
        this.descricao = descricao;
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
    
}
