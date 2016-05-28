package br.com.coolcute.controller;

import br.com.coolcute.bean.TipoMovimentacao;
import br.com.coolcute.model.dao.TipoMovimentacaoDao;
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
public class TipoMovimentacaoController {
    
    @Autowired
    private TipoMovimentacaoDao daoTipoMovimentacao;
    private boolean retorno;
    private String msg;
    
    @RequestMapping("tipo-movimentacao/criar/")
    public String form() {
        return "tipo-movimentacao/criar/";
    }
    
    @RequestMapping("tipo-movimentacao/consultar/")
    public String consulta(){        
        return "tipo-movimentacao/consultar/";
    }
    
    @RequestMapping("adicionarAlterarTipoMovimentacao")
    public ModelAndView adicionarAlterarTipoMovimentacao (@Valid TipoMovimentacao tipoMovimentacao, BindingResult result){
        if(tipoMovimentacao.getCodigo() != 0){        
            return alterarTipoMovimentacao(tipoMovimentacao, result);
        } else {
            return adicionarTipoMovimentacao(tipoMovimentacao, result);
        }        
    }	
    
    @RequestMapping("adicionarTipoMovimentacao")
    public ModelAndView adicionarTipoMovimentacao(@Valid TipoMovimentacao tipoMovimentacao, BindingResult result){
        ModelAndView modelAndView = new ModelAndView("tipo-movimentacao/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {
            daoTipoMovimentacao.adicionarTipoMovimentacao(tipoMovimentacao);
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
    
    @RequestMapping("alterarTipoMovimentacao")
    public ModelAndView alterarTipoMovimentacao(@Valid TipoMovimentacao tipoMovimentacao, BindingResult result) {
        
        ModelAndView modelAndView = new ModelAndView("tipo-movimentacao/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {
            daoTipoMovimentacao.alterarTipoMovimentacao(tipoMovimentacao);
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
    
    @RequestMapping("excluirTipoMovimentacao") 
    public ModelAndView excluirTipoMovimentacao(TipoMovimentacao tipoMovimentacao, BindingResult result) {

        try {
           daoTipoMovimentacao.excluirTipoMovimentacao(tipoMovimentacao.getCodigo()); 
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return filtrarTipoMovimentacao(new TipoMovimentacao(), result);
    }
    
    @RequestMapping("filtrarTipoMovimentacao")    
    public ModelAndView filtrarTipoMovimentacao(@ModelAttribute("tipoMovimentacao") TipoMovimentacao tipoMovimentacao, BindingResult result){
        
        ModelAndView modelAndView = new ModelAndView("tipo-movimentacao/consultar/");
        
        try {            
            modelAndView.addObject("tipoMovimentacao", daoTipoMovimentacao.getTipoMovimentacao(tipoMovimentacao));
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return modelAndView;
    }
    
    @RequestMapping("consultarTipoMovimentacaoItem/{id}")    
    public ModelAndView consultarTipoMovimentacaoItem(@PathVariable("id") int id){
        
        ModelAndView modelAndView = new ModelAndView("tipo-movimentacao/criar/");
        
        try {
            modelAndView.addObject("tipoMovimentacao", daoTipoMovimentacao.getTipoMovimentacaoItem(id));
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return modelAndView;
    }
}