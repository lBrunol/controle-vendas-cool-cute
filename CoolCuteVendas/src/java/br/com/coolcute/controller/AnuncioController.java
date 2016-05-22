package br.com.coolcute.controller;

import br.com.coolcute.bean.Anuncio;
import br.com.coolcute.bean.ProdutoAnuncio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import br.com.coolcute.model.dao.AnuncioDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.sql.SQLException;
import java.util.List;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AnuncioController {
    
    @Autowired
    private AnuncioDao daoAnuncio;
    private boolean retorno;
    private String msg;
    
    //Retorna os clientes em formato json para chamadas ajax
    @RequestMapping("servicoConsultarAnuncio")
    @ResponseBody
    public String servicoConsultarAnuncio() {
        
        ObjectMapper mapper = new ObjectMapper();
        List<Anuncio> lstAnu = null;
        String jsonValue = null;
        
        try {            
            lstAnu = daoAnuncio.getAnuncio();
            jsonValue = mapper.writeValueAsString(lstAnu);
        } catch (SQLException | JsonProcessingException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return jsonValue;
    }
    
    @RequestMapping("servicoConsultaAnuncioProduto/{codigo}")
    @ResponseBody
    public String servicoConsultaAnuncioProduto(@PathVariable int codigo){
        ObjectMapper mapper = new ObjectMapper();
        List<ProdutoAnuncio> lstAnu = null;
        String jsonValue = null;
        
        try {            
            lstAnu = daoAnuncio.getAnuncioProduto(codigo);
            jsonValue = mapper.writeValueAsString(lstAnu);
        } catch (SQLException | JsonProcessingException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return jsonValue;
    }    
}
