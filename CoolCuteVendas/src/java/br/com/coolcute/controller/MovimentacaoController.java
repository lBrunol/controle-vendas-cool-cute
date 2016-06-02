package br.com.coolcute.controller;

import br.com.coolcute.bean.Movimentacao;
import br.com.coolcute.bean.TipoMovimentacao;
import br.com.coolcute.model.dao.MovimentacaoDao;
import br.com.coolcute.model.dao.TipoMovimentacaoDao;
import br.com.coolcute.util.ObterId;
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
public class MovimentacaoController {
    
    @Autowired
    private MovimentacaoDao daoMovimentacao;
    @Autowired
    private TipoMovimentacaoDao daoTipoMovimentacao;
    private boolean retorno;
    private String msg;
    
    @RequestMapping("movimentacao/criar/")
    public ModelAndView form() {
        
        ModelAndView modelAndView = new ModelAndView("movimentacao/criar/");
        
        try {
            modelAndView.addObject("tipoMovimentacao", daoTipoMovimentacao.getTipoMovimentacao(new TipoMovimentacao()));
            modelAndView.addObject("proximoId", ObterId.obterId("movimentacao"));
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return modelAndView;
    }
    
    @RequestMapping("movimentacao/consultar/")
    public ModelAndView consulta(){        
        ModelAndView modelAndView = new ModelAndView("movimentacao/consultar/");
        
        try {
            modelAndView.addObject("tipoMovimentacao", daoTipoMovimentacao.getTipoMovimentacao(new TipoMovimentacao()));
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return modelAndView;
    }
    
    @RequestMapping("adicionarAlterarMovimentacao")
    public ModelAndView adicionarAlterarMovimentacao(@Valid Movimentacao movimentacao, BindingResult result){
        if(movimentacao.getCodigo() != 0){        
            return alterarMovimentacao( movimentacao, result);
        } else {
            return adicionarMovimentacao( movimentacao, result);
        }        
    }	
    
    @RequestMapping("adicionarMovimentacao")
    public ModelAndView adicionarMovimentacao( @Valid Movimentacao movimentacao, BindingResult result) {
        ModelAndView modelAndView = new ModelAndView("movimentacao/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {
            movimentacao.setCodigo(ObterId.obterId("movimentacao"));
                        
            daoMovimentacao.adicionarMovimentacao(movimentacao);
            retorno = true;
            msg = "Cadastrado com sucesso";
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao cadastrar o registro. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao cadastrar os registros. " + e.getMessage();
        } finally {
            try {
                modelAndView.addObject("tipoMovimentacao", daoTipoMovimentacao.getTipoMovimentacao(new TipoMovimentacao()));
                modelAndView.addObject("proximoId", ObterId.obterId("movimentacao"));
                modelAndView.addObject("movimentacao", daoMovimentacao.getMovimentacaoItem(movimentacao.getCodigo()));
            } catch (SQLException ex) {
                retorno = false;
                msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + ex.getMessage();
            } catch (Exception ex){
                msg = "Ocorreu um erro ao listar os registros. " + ex.getMessage();
            }            
        }        
        
        modelAndView.addObject("retorno", retorno);
        modelAndView.addObject("msg", msg);
        
        return modelAndView;		
    }
    
    @RequestMapping("alterarMovimentacao")
    public ModelAndView alterarMovimentacao(@Valid Movimentacao movimentacao, BindingResult result) {
        
        ModelAndView modelAndView = new ModelAndView("movimentacao/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {            
            daoMovimentacao.alterarMovimentacao(movimentacao);
            retorno = true;
            msg = "Alterado com sucesso";
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao alterar o registro. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao alterar os registros. " + e.getMessage();
        } finally {
            try {
                modelAndView.addObject("tipoMovimentacao", daoTipoMovimentacao.getTipoMovimentacao(new TipoMovimentacao()));
                modelAndView.addObject("proximoId", ObterId.obterId("movimentacao"));
                modelAndView.addObject("movimentacao", daoMovimentacao.getMovimentacaoItem(movimentacao.getCodigo()));
            } catch (SQLException ex) {
                retorno = false;
                msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + ex.getMessage();
            } catch (Exception ex){
                msg = "Ocorreu um erro ao listar os registros. " + ex.getMessage();
            }            
        }        
        
        modelAndView.addObject("retorno", retorno);
        modelAndView.addObject("msg", msg);
        
        return modelAndView;
    }
    
    @RequestMapping("excluirMovimentacao") 
    public ModelAndView excluirMovimentacao(Movimentacao movimentacao, BindingResult result) {

        try {
            daoMovimentacao.excluirMovimentacao(movimentacao.getCodigo()); 
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return filtrarMovimentacao(new Movimentacao(), result);
    }
    
    @RequestMapping("filtrarMovimentacao")    
    public ModelAndView filtrarMovimentacao(@ModelAttribute("movimentacao") Movimentacao movimentacao, BindingResult result){
        
        ModelAndView modelAndView = new ModelAndView("movimentacao/consultar/");
        try {            
            modelAndView.addObject("movimentacao", daoMovimentacao.getMovimentacao(movimentacao));
            modelAndView.addObject("movimentacaoFiltro", movimentacao);
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        } finally {
            try {
                modelAndView.addObject("tipoMovimentacao", daoTipoMovimentacao.getTipoMovimentacao(new TipoMovimentacao(0, null,true)));
            } catch (SQLException ex) {
                msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + ex.getMessage();
            } catch (Exception ex){
                msg = "Ocorreu um erro ao listar os registros. " + ex.getMessage();
            }
        }
        return modelAndView;
    }
    
    @RequestMapping("consultarMovimentacaoItem/{id}")    
    public ModelAndView consultarMovimentacaoItem(@PathVariable("id") int id){
        
        ModelAndView modelAndView = new ModelAndView("movimentacao/criar/");
        
        try {
            modelAndView.addObject("movimentacao", daoMovimentacao.getMovimentacaoItem(id));
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        } finally {
            try {
                modelAndView.addObject("tipoMovimentacao", daoTipoMovimentacao.getTipoMovimentacao(new TipoMovimentacao(0, null,true)));
            } catch (SQLException ex) {
                retorno = false;
                msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + ex.getMessage();
            } catch (Exception ex){
                msg = "Ocorreu um erro ao listar os registros. " + ex.getMessage();
            }
        }
        return modelAndView;
    }   
}