package br.com.coolcute.controller;

import br.com.coolcute.bean.TipoAnuncio;
import br.com.coolcute.model.dao.TipoAnuncioDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.sql.SQLException;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TipoAnuncioController {
    
    @Autowired
    private TipoAnuncioDao daoTipoAnuncio;
    private boolean retorno;
    private String msg;
    
    //Mapeamento dos forms
    @RequestMapping("tipo-anuncio/criar/")
    public String form() {
        return "tipo-anuncio/criar/";
    }
    
    @RequestMapping("tipo-anuncio/consultar/")
    public String consulta(){        
        return "tipo-anuncio/consultar/";
    }
    
    //No request verifica se é alteração ou criação
    @RequestMapping("adicionarAlterarTipoAnuncio")
    public ModelAndView adicionarAlterarTipoAnuncio (@Valid TipoAnuncio tipoAnuncio, BindingResult result){
        if(tipoAnuncio.getCodigo() != 0){        
            return alterarTipoAnuncio(tipoAnuncio, result);
        } else {
            return adicionarTipoAnuncio(tipoAnuncio, result);
        }        
    }	
    
    @RequestMapping("adicionarTipoAnuncio")
    public ModelAndView adicionarTipoAnuncio(@Valid TipoAnuncio tipoAnuncio, BindingResult result){
        ModelAndView modelAndView = new ModelAndView("tipo-anuncio/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {
            daoTipoAnuncio.adiciona(tipoAnuncio);
            retorno = true;
            msg = "Cadastrado com sucesso";
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao cadastrar o registro. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao cadastrar os registros. " + e.getMessage();
        }

        
        modelAndView.addObject("retorno", retorno);
        modelAndView.addObject("msg", msg);
        
        return modelAndView;		
    }
    
    @RequestMapping("consultarTipoAnuncio")
    public ModelAndView lista(){
        
        ModelAndView modelAndView = new ModelAndView("tipo-anuncio/consultar/");
        
        try {            
            modelAndView.addObject("tipoAnuncio", daoTipoAnuncio.getTipoAnuncio());
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return modelAndView;
    }
    
    @RequestMapping("consultarTipoAnuncioItem/{id}")
    public ModelAndView listaItem(@PathVariable("id") Long id){
        
        ModelAndView modelAndView = new ModelAndView("tipo-anuncio/criar/");
        
        try {            
            modelAndView.addObject("tipoAnuncio", daoTipoAnuncio.getTipoAnuncioItem(id));
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return modelAndView;
    }
    
    @RequestMapping("alterarTipoAnuncio")
    public ModelAndView alterarTipoAnuncio(@Valid TipoAnuncio tipoAnuncio, BindingResult result) {
        
        ModelAndView modelAndView = new ModelAndView("tipo-anuncio/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {
            daoTipoAnuncio.altera(tipoAnuncio);
            retorno = true;
            msg = "Registro alterado com sucesso";
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao alterar o registro. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao alterar os registros. " + e.getMessage();
        }
        
        modelAndView.addObject("retorno", retorno);
        modelAndView.addObject("msg", msg);
        
        return modelAndView;
    }
    
    @RequestMapping("excluirTipoAnuncio") 
    public ModelAndView removerTipoAnuncio(TipoAnuncio tipoAnuncio) {

        try {
           daoTipoAnuncio.exclui(tipoAnuncio.getCodigo()); 
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return lista();
    }
	
    @RequestMapping("filtrarTipoAnuncio")    
    public ModelAndView filtrarTipoAnuncio(@ModelAttribute("tipo-anuncio") TipoAnuncio tipoAnuncio, BindingResult result){
        
        ModelAndView modelAndView = new ModelAndView("tipo-anuncio/consultar/");
        
        try {            
            modelAndView.addObject("tipoAnuncio", daoTipoAnuncio.filterTipoAnuncio(tipoAnuncio));
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return modelAndView;
    }
    
    //Retorna os tipoAnuncios em formato json para chamadas ajax
    @RequestMapping("servicoConsultarTipoAnuncio")
    @ResponseBody
    public String servicoConsultarTipoAnuncio() {
        
        ObjectMapper mapper = new ObjectMapper();
        List<TipoAnuncio> lstCli = null;
        String jsonValue = null;
        
        try {            
            lstCli = daoTipoAnuncio.getTipoAnuncio();
            jsonValue = mapper.writeValueAsString(lstCli);
        } catch (SQLException | JsonProcessingException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return jsonValue;
    }    
}