package br.com.coolcute.controller;

import br.com.coolcute.bean.TipoAvaliacao;
import br.com.coolcute.model.dao.TipoAvaliacaoDao;
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
public class TipoAvaliacaoController {
    
    @Autowired
    private TipoAvaliacaoDao daoTipoAvaliacao;
    private boolean retorno;
    private String msg;
    
    @RequestMapping("tipo-avaliacao/criar/")
    public String form() {
        return "tipo-avaliacao/criar/";
    }
    
    @RequestMapping("tipo-avaliacao/consultar/")
    public String consulta(){        
        return "tipo-avaliacao/consultar/";
    }
    
    @RequestMapping("adicionarAlterarTipoAvaliacao")
    public ModelAndView adicionarAlterarTipoAvaliacao (@Valid TipoAvaliacao tipoAvaliacao, BindingResult result){
        if(tipoAvaliacao.getCodigo() != 0){        
            return alterarTipoAvaliacao(tipoAvaliacao, result);
        } else {
            return adicionarTipoAvaliacao(tipoAvaliacao, result);
        }        
    }	
    
    @RequestMapping("adicionarTipoAvaliacao")
    public ModelAndView adicionarTipoAvaliacao(@Valid TipoAvaliacao tipoAvaliacao, BindingResult result){
        ModelAndView modelAndView = new ModelAndView("tipo-avaliacao/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {
            daoTipoAvaliacao.adicionarTipoAvaliacao(tipoAvaliacao);
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
    
    @RequestMapping("alterarTipoAvaliacao")
    public ModelAndView alterarTipoAvaliacao(@Valid TipoAvaliacao tipoAvaliacao, BindingResult result) {
        
        ModelAndView modelAndView = new ModelAndView("tipo-avaliacao/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {
            daoTipoAvaliacao.alterarTipoAvaliacao(tipoAvaliacao);
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
    
    @RequestMapping("excluirTipoAvaliacao") 
    public ModelAndView excluirTipoAvaliacao(TipoAvaliacao tipoAvaliacao, BindingResult result) {

        try {
           daoTipoAvaliacao.excluirTipoAvaliacao(tipoAvaliacao.getCodigo()); 
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return filtrarTipoAvaliacao(new TipoAvaliacao(), result);
    }
    
    @RequestMapping("filtrarTipoAvaliacao")    
    public ModelAndView filtrarTipoAvaliacao(@ModelAttribute("tipoAvaliacao") TipoAvaliacao tipoAvaliacao, BindingResult result){
        
        ModelAndView modelAndView = new ModelAndView("tipo-avaliacao/consultar/");
        
        try {            
            modelAndView.addObject("tipoAvaliacao", daoTipoAvaliacao.getTipoAvaliacao(tipoAvaliacao));
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return modelAndView;
    }
    
    @RequestMapping("consultarTipoAvaliacaoItem/{id}")    
    public ModelAndView consultarTipoAvaliacaoItem(@PathVariable("id") int id){
        
        ModelAndView modelAndView = new ModelAndView("tipo-avaliacao/criar/");
        
        try {
            modelAndView.addObject("tipoAvaliacao", daoTipoAvaliacao.getTipoAvaliacaoItem(id));
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return modelAndView;
    }
}