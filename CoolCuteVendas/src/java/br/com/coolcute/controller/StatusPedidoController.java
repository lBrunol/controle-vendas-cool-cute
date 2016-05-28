package br.com.coolcute.controller;

import br.com.coolcute.bean.StatusPedido;
import br.com.coolcute.model.dao.StatusPedidoDao;
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
public class StatusPedidoController {
    
    @Autowired
    private StatusPedidoDao daoStatusPedido;
    private boolean retorno;
    private String msg;
    
    @RequestMapping("status-pedido/criar/")
    public String form() {
        return "status-pedido/criar/";
    }
    
    @RequestMapping("status-pedido/consultar/")
    public String consulta(){        
        return "status-pedido/consultar/";
    }
    
    @RequestMapping("adicionarAlterarStatusPedido")
    public ModelAndView adicionarAlterarStatusPedido (@Valid StatusPedido statusPedido, BindingResult result){
        if(statusPedido.getCodigo() != 0){        
            return alterarStatusPedido(statusPedido, result);
        } else {
            return adicionarStatusPedido(statusPedido, result);
        }        
    }	
    
    @RequestMapping("adicionarStatusPedido")
    public ModelAndView adicionarStatusPedido(@Valid StatusPedido statusPedido, BindingResult result){
        ModelAndView modelAndView = new ModelAndView("status-pedido/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {
            daoStatusPedido.adicionarStatusPedido(statusPedido);
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
    
    @RequestMapping("alterarStatusPedido")
    public ModelAndView alterarStatusPedido(@Valid StatusPedido statusPedido, BindingResult result) {
        
        ModelAndView modelAndView = new ModelAndView("status-pedido/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {
            daoStatusPedido.alterarStatusPedido(statusPedido);
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
    
    @RequestMapping("excluirStatusPedido") 
    public ModelAndView excluirStatusPedido(StatusPedido statusPedido, BindingResult result) {

        try {
           daoStatusPedido.excluirStatusPedido(statusPedido.getCodigo()); 
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return filtrarStatusPedido(new StatusPedido(), result);
    }
    
    @RequestMapping("filtrarStatusPedido")    
    public ModelAndView filtrarStatusPedido(@ModelAttribute("statusPedido") StatusPedido statusPedido, BindingResult result){
        
        ModelAndView modelAndView = new ModelAndView("status-pedido/consultar/");
        
        try {            
            modelAndView.addObject("statusPedido", daoStatusPedido.getStatusPedido(statusPedido));
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return modelAndView;
    }
    
    @RequestMapping("consultarStatusPedidoItem/{id}")    
    public ModelAndView consultarStatusPedidoItem(@PathVariable("id") int id){
        
        ModelAndView modelAndView = new ModelAndView("status-pedido/criar/");
        
        try {
            modelAndView.addObject("statusPedido", daoStatusPedido.getStatusPedidoItem(id));
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return modelAndView;
    }
}