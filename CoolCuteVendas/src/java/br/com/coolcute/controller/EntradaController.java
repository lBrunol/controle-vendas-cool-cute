package br.com.coolcute.controller;

import br.com.coolcute.bean.ItensEntrada;
import br.com.coolcute.bean.Movimentacao;
import br.com.coolcute.bean.Entrada;
import br.com.coolcute.bean.Produto;
import br.com.coolcute.bean.TipoAvaliacao;
import br.com.coolcute.bean.TipoMovimentacao;
import br.com.coolcute.model.dao.MovimentacaoDao;
import br.com.coolcute.model.dao.EntradaDao;
import br.com.coolcute.model.dao.ProdutoDao;
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
import org.joda.time.DateTime;

@Controller
public class EntradaController {
    /*
    @Autowired
    private EntradaDao daoEntrada;
    @Autowired
    private MovimentacaoDao daoMovimentacao;
    @Autowired
    private ProdutoDao daoProduto;
    private boolean retorno;
    private String msg;
    
    @RequestMapping("entrada/criar/")
    public ModelAndView form() {
        
        ModelAndView modelAndView = new ModelAndView("entrada/criar/");
        
        try {
            modelAndView.addObject("statusEntrada", daoStatusEntrada.getStatusEntrada(new StatusEntrada()));
            modelAndView.addObject("tipoAvaliacao", daoTipoAvaliacao.getTipoAvaliacao(new TipoAvaliacao()));
            modelAndView.addObject("proximoId", ObterId.obterId("entrada"));
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return modelAndView;
    }
    
    @RequestMapping("entrada/consultar/")
    public ModelAndView consulta(){        
        ModelAndView modelAndView = new ModelAndView("entrada/consultar/");
        
        try {
            modelAndView.addObject("statusEntrada", daoStatusEntrada.getStatusEntrada(new StatusEntrada()));
            modelAndView.addObject("tipoAvaliacao", daoTipoAvaliacao.getTipoAvaliacao(new TipoAvaliacao()));
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return modelAndView;
    }
    
    @RequestMapping("adicionarAlterarEntrada")
    public ModelAndView adicionarAlterarEntrada (@RequestParam("itens") String itens, @RequestParam("cancelar") String cancelar, @Valid Entrada entrada, BindingResult result){
        if(!"true".equals(cancelar)){
            if(entrada.getCodigo() != 0){        
                return alterarEntrada(itens, entrada, result);
            } else {
                return adicionarEntrada(itens, entrada, result);
            }
        } else {
            return cancelarEntrada(itens, entrada, result);
        }
    }	
    
    @RequestMapping("adicionarEntrada")
    public ModelAndView adicionarEntrada(@RequestParam("itens") String itens, @Valid Entrada entrada, BindingResult result) {
        ModelAndView modelAndView = new ModelAndView("entrada/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {
            entrada.setCodigo(ObterId.obterId("entrada"));
            
            ObjectMapper mapper = new ObjectMapper();
            Collection<ItensEntrada> lstItens;
            
            lstItens = mapper.readValue(itens, new TypeReference<Collection<ItensEntrada>>() {});
            
            entrada.setItensEntrada((List<ItensEntrada>) lstItens);
            
            daoEntrada.adicionarEntrada(entrada);
            daoMovimentacao.adicionarMovimentacao(new Movimentacao(0, new TipoMovimentacao(11,null, true),"PED" + entrada.getCodigo(), entrada.getValorTotal(), new DateTime()));
            
            retorno = true;
            msg = "Cadastrado com sucesso";
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao cadastrar o registro. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao cadastrar os registros. " + e.getMessage();
        } finally {
            try {
                modelAndView.addObject("statusEntrada", daoStatusEntrada.getStatusEntrada(new StatusEntrada()));
                modelAndView.addObject("tipoAvaliacao", daoTipoAvaliacao.getTipoAvaliacao(new TipoAvaliacao()));
                modelAndView.addObject("proximoId", ObterId.obterId("entrada"));
                modelAndView.addObject("entrada", daoEntrada.getEntradaItem(entrada.getCodigo()));
                modelAndView.addObject("itensEntrada", daoEntrada.getItensEntrada(entrada.getCodigo()));
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
    
    @RequestMapping("alterarEntrada")
    public ModelAndView alterarEntrada(@RequestParam("itens") String itens, @Valid Entrada entrada, BindingResult result) {
        
        ModelAndView modelAndView = new ModelAndView("entrada/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {            
            ObjectMapper mapper = new ObjectMapper();
            Collection<ItensEntrada> lstItens;
            
            lstItens = mapper.readValue(itens, new TypeReference<Collection<ItensEntrada>>() {});
            
            entrada.setItensEntrada((List<ItensEntrada>) lstItens);
            
            daoEntrada.excluirItensEntrada(entrada);
            daoMovimentacao.alterarMovimentacaoDescricao(new Movimentacao(0, new TipoMovimentacao(0,null, true),"PED" + entrada.getCodigo(), entrada.getValorTotal(), new DateTime()));
            daoEntrada.alterarEntrada(entrada);
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
                modelAndView.addObject("statusEntrada", daoStatusEntrada.getStatusEntrada(new StatusEntrada()));
                modelAndView.addObject("tipoAvaliacao", daoTipoAvaliacao.getTipoAvaliacao(new TipoAvaliacao()));
                modelAndView.addObject("proximoId", ObterId.obterId("entrada"));
                modelAndView.addObject("entrada", daoEntrada.getEntradaItem(entrada.getCodigo()));
                modelAndView.addObject("itensEntrada", daoEntrada.getItensEntrada(entrada.getCodigo()));
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
    
    @RequestMapping("excluirEntrada") 
    public ModelAndView excluirEntrada(Entrada entrada, BindingResult result) {

        try {
            daoEntrada.excluirItensEntrada(entrada);
            daoEntrada.excluirEntrada(entrada.getCodigo()); 
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return filtrarEntrada(new Entrada(), result);
    }
    
    @RequestMapping("cancelarEntrada")
    public ModelAndView cancelarEntrada(@RequestParam("itens") String itens, @Valid Entrada entrada, BindingResult result) {
        
        ModelAndView modelAndView = new ModelAndView("entrada/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {            
            ObjectMapper mapper = new ObjectMapper();
            Collection<ItensEntrada> lstItens;
            
            lstItens = mapper.readValue(itens, new TypeReference<Collection<ItensEntrada>>() {});
            
            entrada.setItensEntrada((List<ItensEntrada>) lstItens);
            
            daoMovimentacao.excluirMovimentacaoDescricao("PED" + entrada.getCodigo());
            daoEntrada.alterarEntrada(entrada);
            retorno = true;
            msg = "Cancelado com sucesso";
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao cancelar o registro. " + e.getMessage();
        } catch (Exception e){
            retorno = false;
            msg = "Ocorreu um erro ao cancelar os registros. " + e.getMessage();
        } finally {
            try {
                modelAndView.addObject("statusEntrada", daoStatusEntrada.getStatusEntrada(new StatusEntrada()));
                modelAndView.addObject("tipoAvaliacao", daoTipoAvaliacao.getTipoAvaliacao(new TipoAvaliacao()));
                modelAndView.addObject("proximoId", ObterId.obterId("entrada"));
                modelAndView.addObject("entrada", daoEntrada.getEntradaItem(entrada.getCodigo()));
                modelAndView.addObject("itensEntrada", daoEntrada.getItensEntrada(entrada.getCodigo()));
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
    
    @RequestMapping("filtrarEntrada")    
    public ModelAndView filtrarEntrada(@ModelAttribute("entrada") Entrada entrada, BindingResult result){
        
        ModelAndView modelAndView = new ModelAndView("entrada/consultar/");
        try {            
            modelAndView.addObject("entrada", daoEntrada.getEntrada(entrada));
            modelAndView.addObject("entradaFiltro", entrada);
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        } finally {
            try {
                modelAndView.addObject("statusEntrada", daoStatusEntrada.getStatusEntrada(new StatusEntrada()));
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
    
    @RequestMapping("consultarEntradaItem/{id}")    
    public ModelAndView consultarEntradaItem(@PathVariable("id") int id){
        
        ModelAndView modelAndView = new ModelAndView("entrada/criar/");
        
        try {
            modelAndView.addObject("entrada", daoEntrada.getEntradaItem(id));
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        } finally {
            try {
                modelAndView.addObject("statusEntrada", daoStatusEntrada.getStatusEntrada(new StatusEntrada()));
                modelAndView.addObject("tipoAvaliacao", daoTipoAvaliacao.getTipoAvaliacao(new TipoAvaliacao()));
                modelAndView.addObject("itensEntrada", daoEntrada.getItensEntrada(id));
            } catch (SQLException ex) {
                retorno = false;
                msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + ex.getMessage();
            } catch (Exception ex){
                msg = "Ocorreu um erro ao listar os registros. " + ex.getMessage();
            }
        }
        return modelAndView;
    }    */
}