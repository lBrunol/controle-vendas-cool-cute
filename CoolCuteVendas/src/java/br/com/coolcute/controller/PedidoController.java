package br.com.coolcute.controller;

import br.com.coolcute.bean.ItensPedido;
import br.com.coolcute.bean.Pedido;
import br.com.coolcute.bean.StatusPedido;
import br.com.coolcute.bean.TipoAvaliacao;
import br.com.coolcute.model.dao.AnuncioDao;
import br.com.coolcute.model.dao.ClienteDao;
import br.com.coolcute.model.dao.PedidoDao;
import br.com.coolcute.model.dao.StatusPedidoDao;
import br.com.coolcute.model.dao.TipoAvaliacaoDao;
import br.com.coolcute.util.ObterId;
import java.sql.SQLException;
import java.util.List;
import javax.validation.Valid;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Collection;
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
    @Autowired
    private ClienteDao daoCliente;
    @Autowired
    private AnuncioDao daoAnuncio;
    private boolean retorno;
    private String msg;
    
    @RequestMapping("pedido/criar/")
    public ModelAndView form() {
        
        ModelAndView modelAndView = new ModelAndView("pedido/criar/");
        
        try {
            modelAndView.addObject("statusPedido", daoStatusPedido.getStatusPedido(new StatusPedido()));
            modelAndView.addObject("tipoAvaliacao", daoTipoAvaliacao.getTipoAvaliacao(new TipoAvaliacao()));
            modelAndView.addObject("proximoId", ObterId.obterId("pedido"));
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return modelAndView;
    }
    
    @RequestMapping("pedido/consultar/")
    public ModelAndView consulta(){        
        ModelAndView modelAndView = new ModelAndView("pedido/consultar/");
        
        try {
            modelAndView.addObject("statusPedido", daoStatusPedido.getStatusPedido(new StatusPedido()));
            modelAndView.addObject("tipoAvaliacao", daoTipoAvaliacao.getTipoAvaliacao(new TipoAvaliacao()));
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return modelAndView;
    }
    
    @RequestMapping("adicionarAlterarPedido")
    public ModelAndView adicionarAlterarPedido (@RequestParam("itens") String itens, @Valid Pedido pedido, BindingResult result){
        if(pedido.getCodigo() != 0){        
            return alterarPedido(itens, pedido, result);
        } else {
            return adicionarPedido(itens, pedido, result);
        }        
    }	
    
    @RequestMapping("adicionarPedido")
    public ModelAndView adicionarPedido(@RequestParam("itens") String itens, @Valid Pedido pedido, BindingResult result) {
        ModelAndView modelAndView = new ModelAndView("pedido/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }        
        
        try {
            pedido.setCodigo(ObterId.obterId("pedido"));
            
            ObjectMapper mapper = new ObjectMapper();
            Collection<ItensPedido> lstItens;
            
            lstItens = mapper.readValue(itens, new TypeReference<Collection<ItensPedido>>() {});
            
            pedido.setItensPedido((List<ItensPedido>) lstItens);
            
            daoPedido.adicionarPedido(pedido);
            retorno = true;
            msg = "Cadastrado com sucesso";
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao cadastrar o registro. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao cadastrar os registros. " + e.getMessage();
        } finally {
            try {
                modelAndView.addObject("statusPedido", daoStatusPedido.getStatusPedido(new StatusPedido()));
                modelAndView.addObject("tipoAvaliacao", daoTipoAvaliacao.getTipoAvaliacao(new TipoAvaliacao()));
                modelAndView.addObject("proximoId", ObterId.obterId("pedido"));
                modelAndView.addObject("pedido", daoPedido.getPedidoItem(pedido.getCodigo()));
                modelAndView.addObject("itensPedido", daoPedido.getItensPedido(pedido.getCodigo()));
            } catch (SQLException ex) {
                retorno = false;
                msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + ex.getMessage();
            } catch (Exception ex){
                retorno = false;
                msg = "Ocorreu um erro ao listar os registros. " + ex.getMessage();
            }            
        }        
        
        modelAndView.addObject("retorno", retorno);
        modelAndView.addObject("msg", msg);
        
        return modelAndView;		
    }
    
    @RequestMapping("alterarPedido")
    public ModelAndView alterarPedido(@RequestParam("itens") String itens, @Valid Pedido pedido, BindingResult result) {
        
        ModelAndView modelAndView = new ModelAndView("pedido/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {            
            ObjectMapper mapper = new ObjectMapper();
            Collection<ItensPedido> lstItens;
            
            lstItens = mapper.readValue(itens, new TypeReference<Collection<ItensPedido>>() {});
            
            pedido.setItensPedido((List<ItensPedido>) lstItens);
            
            daoPedido.excluirItensPedido(pedido.getCodigo());
            daoPedido.alterarPedido(pedido);
            retorno = true;
            msg = "Alterado com sucesso";
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao alterar o registro. " + e.getMessage();
        } catch (Exception e){
            retorno = false;
            msg = "Ocorreu um erro ao alterar os registros. " + e.getMessage();
        } finally {
            try {
                modelAndView.addObject("statusPedido", daoStatusPedido.getStatusPedido(new StatusPedido()));
                modelAndView.addObject("tipoAvaliacao", daoTipoAvaliacao.getTipoAvaliacao(new TipoAvaliacao()));
                modelAndView.addObject("proximoId", ObterId.obterId("pedido"));
                modelAndView.addObject("pedido", daoPedido.getPedidoItem(pedido.getCodigo()));
                modelAndView.addObject("itensPedido", daoPedido.getItensPedido(pedido.getCodigo()));
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
    
    @RequestMapping("excluirPedido") 
    public ModelAndView excluirPedido(Pedido pedido, BindingResult result) {

        try {
            daoPedido.excluirItensPedido(pedido.getCodigo());
            daoPedido.excluirPedido(pedido.getCodigo()); 
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return filtrarPedido(new Pedido(), result);
    }
    
    @RequestMapping("filtrarPedido")    
    public ModelAndView filtrarPedido(@ModelAttribute("pedido") Pedido pedido, BindingResult result){
        
        ModelAndView modelAndView = new ModelAndView("pedido/consultar/");
        try {            
            modelAndView.addObject("pedido", daoPedido.getPedido(pedido));
            modelAndView.addObject("pedidoFiltro", pedido);
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        } finally {
            try {
                modelAndView.addObject("statusPedido", daoStatusPedido.getStatusPedido(new StatusPedido()));
                modelAndView.addObject("tipoAvaliacao", daoTipoAvaliacao.getTipoAvaliacao(new TipoAvaliacao()));
            } catch (SQLException ex) {
                retorno = false;
                msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + ex.getMessage();
            } catch (Exception ex){
                msg = "Ocorreu um erro ao listar os registros. " + ex.getMessage();
            }
        }
        return modelAndView;
    }
    
    @RequestMapping("consultarPedidoItem/{id}")    
    public ModelAndView consultarPedidoItem(@PathVariable("id") int id){
        
        ModelAndView modelAndView = new ModelAndView("pedido/criar/");
        
        try {
            modelAndView.addObject("pedido", daoPedido.getPedidoItem(id));
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        } finally {
            try {
                modelAndView.addObject("statusPedido", daoStatusPedido.getStatusPedido(new StatusPedido()));
                modelAndView.addObject("tipoAvaliacao", daoTipoAvaliacao.getTipoAvaliacao(new TipoAvaliacao()));
                modelAndView.addObject("itensPedido", daoPedido.getItensPedido(id));
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