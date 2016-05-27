package br.com.coolcute.controller;

import br.com.coolcute.bean.ItensPedido;
import br.com.coolcute.bean.Pedido;
import br.com.coolcute.model.dao.PedidoDao;
import br.com.coolcute.model.dao.StatusPedidoDao;
import br.com.coolcute.model.dao.TipoAvaliacaoDao;
import br.com.coolcute.util.ObterId;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
            modelAndView.addObject("proximoId", ObterId.obterId("pedido"));
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return modelAndView;
    }    
    
    @RequestMapping("/pedido/consultar/")
    public String consulta(){        
        return "/pedido/consultar/";
    }
	
    @RequestMapping("criarPedido")
    public ModelAndView adiciona(@RequestParam("itensPedido") String itens, Pedido pedido, BindingResult result){
        ModelAndView modelAndView = new ModelAndView("pedido/criar/");
       
        try {
            ObjectMapper mapper = new ObjectMapper();
            Collection<ItensPedido> lstItens;
            
            lstItens = mapper.readValue(itens, new TypeReference<Collection<ItensPedido>>() {});
            
            pedido.setItensEntrada((List<ItensPedido>) lstItens);            
            daoPedido.adiciona(pedido);
            
            retorno = true;
            msg = "Cadastrado com sucesso";
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro ao cadastrar o registro. " + e.getMessage();
        } catch (IOException e) {            
            retorno = false;
            msg = "Ocorreu um erro ao converter os dados do pedido. " + e.getMessage();
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
    public ModelAndView altera(Pedido pedido, BindingResult result) {
        
        ModelAndView modelAndView = new ModelAndView("pedido/criar/");
        
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
    
    @RequestMapping("filtrarPedido")    
    public ModelAndView filtrarPedido(@ModelAttribute("pedido") Pedido pedido, BindingResult result){
        
        ModelAndView modelAndView = new ModelAndView("pedido/consultar/");
        
        try {            
            modelAndView.addObject("pedido", daoPedido.filterPedido(pedido));
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return modelAndView;
    }
    
}
