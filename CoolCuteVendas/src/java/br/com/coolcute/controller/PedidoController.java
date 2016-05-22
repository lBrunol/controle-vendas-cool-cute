package br.com.coolcute.controller;

import br.com.coolcute.bean.ItensPedido;
import br.com.coolcute.bean.Pedido;
import br.com.coolcute.model.dao.PedidoDao;
import br.com.coolcute.model.dao.StatusAnuncioDao;
import br.com.coolcute.model.dao.StatusPedidoDao;
import br.com.coolcute.model.dao.TipoAvaliacaoDao;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
    @Autowired
    private StatusPedidoDao daoStatusPedido;
    @Autowired
    private TipoAvaliacaoDao daoTipoAvaliacao;
    private boolean retorno;
    private String msg;
    
    @RequestMapping("pedido/criar/")
    public ModelAndView form() {
        
        ModelAndView modelAndView = new ModelAndView("pedido/criar/");
        
        try {
            modelAndView.addObject("statusPedido", daoStatusPedido.getStatusPedido());
            modelAndView.addObject("tipoAvaliacao", daoTipoAvaliacao.getTipoAvaliacao());
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return modelAndView;
    }
    
    @RequestMapping("adicionaAlteraPedido")
    public ModelAndView adicionaAlteraPedido (Pedido pedido){
        
        if(pedido.getCodigo() != 0){        
            return altera(pedido);
        } else {
            return adiciona(pedido);
        }
        
    }
    
    @RequestMapping("/pedido/teste")
    public String teste(String teste){
        
        ObjectMapper mapper = new ObjectMapper();
        List<ItensPedido> lstItens = new  ArrayList<>();
        
        try {
            ItensPedido ite = mapper.readValue(teste, ItensPedido.class);
        } catch (IOException ex) {
            Logger.getLogger(PedidoController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return null;
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
