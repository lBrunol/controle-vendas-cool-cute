package br.com.coolcute.controller;

import br.com.coolcute.bean.StatusAnuncio;
import br.com.coolcute.model.dao.StatusAnuncioDao;
import java.sql.SQLException;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StatusAnuncioController {
    
    @Autowired
    private StatusAnuncioDao daoStatusAnuncio;
    private boolean retorno;
    private String msg;
    
    @RequestMapping("status-anuncio/criar/")
    public String form() {
        return "status-anuncio/criar/";
    }
    
    @RequestMapping("status-anuncio/consultar/")
    public String consulta(){        
        return "status-anuncio/consultar/";
    }
    
    @RequestMapping("adicionarAlterarStatusAnuncio")
    public ModelAndView adicionarAlterarStatusAnuncio (@Valid StatusAnuncio statusAnuncio, BindingResult result){
        if(statusAnuncio.getCodigo() != 0){        
            return alterarStatusAnuncio(statusAnuncio, result);
        } else {
            return adicionarStatusAnuncio(statusAnuncio, result);
        }        
    }	
    
    @RequestMapping("adicionarStatusAnuncio")
    public ModelAndView adicionarStatusAnuncio(@Valid StatusAnuncio statusAnuncio, BindingResult result){
        ModelAndView modelAndView = new ModelAndView("status-anuncio/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {
            daoStatusAnuncio.adicionarStatusAnuncio(statusAnuncio);
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
    
    @RequestMapping("alterarStatusAnuncio")
    public ModelAndView alterarStatusAnuncio(@Valid StatusAnuncio statusAnuncio, BindingResult result) {
        
        ModelAndView modelAndView = new ModelAndView("status-anuncio/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {
            daoStatusAnuncio.alterarStatusAnuncio(statusAnuncio);
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
    
    @RequestMapping("excluirStatusAnuncio") 
    public ModelAndView excluirStatusAnuncio(StatusAnuncio statusAnuncio, BindingResult result) {

        try {
           daoStatusAnuncio.excluirStatusAnuncio(statusAnuncio.getCodigo()); 
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return filtrarStatusAnuncio(new StatusAnuncio(), result);
    }
    
    @RequestMapping("filtrarStatusAnuncio")    
    public ModelAndView filtrarStatusAnuncio(@ModelAttribute("statusAnuncio") StatusAnuncio statusAnuncio, BindingResult result){
        
        ModelAndView modelAndView = new ModelAndView("status-anuncio/consultar/");
        
        try {            
            modelAndView.addObject("statusAnuncio", daoStatusAnuncio.getStatusAnuncio(statusAnuncio));
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return modelAndView;
    }
    
    @RequestMapping("consultarStatusAnuncioItem/{id}")    
    public ModelAndView consultarStatusAnuncioItem(@PathVariable("id") int id){
        
        ModelAndView modelAndView = new ModelAndView("status-anuncio/criar/");
        
        try {
            modelAndView.addObject("statusAnuncio", daoStatusAnuncio.getStatusAnuncioItem(id));
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return modelAndView;
    }
}