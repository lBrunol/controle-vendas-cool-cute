package br.com.coolcute.controller;

import br.com.coolcute.bean.Pedido;
import br.com.coolcute.model.dao.PedidoDao;
import java.sql.SQLException;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PedidoController {
    
    @Autowired
    private PedidoDao daoPedido;
    private boolean retorno;
    private String msg;
    
    @RequestMapping("pedido/criar/index")
    public String form() {
        return "pedido/criar/index";
    }
    
    @RequestMapping("adicionaAlteraPedido")
    public ModelAndView adicionaAlteraPedido (Pedido pedido){
        
        if(pedido.getCodigo() != 0){        
            return altera(pedido);
        } else {
            return adiciona(pedido);
        }
        
    }
    
    @RequestMapping("/pedido/consultar/index")
    public String consulta(){        
        return "/pedido/consultar/index";
    }
	
    @RequestMapping("criarPedido")
        public ModelAndView adiciona(@Valid Pedido pedido){
        ModelAndView modelAndView = new ModelAndView("pedido/criar/index");
        
        try {
            daoPedido.adiciona(pedido);
            retorno = true;
            msg = "Cadastrado com sucesso";
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro ao cadastrar o registro. " + e.getMessage();
        }

        
        modelAndView.addObject("retorno", retorno);
        modelAndView.addObject("msg", msg);
        
        return modelAndView;		
    }
    
    @RequestMapping("consultarPedido")
    public ModelAndView lista(){
        
        ModelAndView modelAndView = new ModelAndView("pedido/consultar/index");
        
        try {            
            modelAndView.addObject("pedido", daoPedido.getPedido());
        } catch (SQLException e) {
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        }
        return modelAndView;
    }
    
    @RequestMapping("consultarPedidoItem/{id}")
    public ModelAndView listaItem(@PathVariable("id") Long id){
        
        ModelAndView modelAndView = new ModelAndView("pedido/criar/index");
        
        try {            
            modelAndView.addObject("pedido", daoPedido.getPedidoItem(id));
        } catch (SQLException e) {
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        }
        return modelAndView;
    }
	
    @RequestMapping("/pedido/excluir/{id}") 
    public ModelAndView remove(@PathVariable("id") Long id) {
        PedidoDao dao = new PedidoDao();
        try {
           dao.exclui(id); 
        } catch (SQLException e) {
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return lista();
    }
	
    @RequestMapping("alteraPedido")
    public ModelAndView altera(Pedido pedido) {
        
        ModelAndView modelAndView = new ModelAndView("pedido/criar/index");
        
        try {
            daoPedido.altera(pedido);
            retorno = true;
            msg = "Registro alterado com sucesso";
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro ao alterar o registro. " + e.getMessage();
        }
        
        modelAndView.addObject("retorno", retorno);
        modelAndView.addObject("msg", msg);
        
        return modelAndView;
    }
    
}
