package br.com.coolcute.controller;

import br.com.coolcute.bean.Anuncio;
import br.com.coolcute.bean.Produto;
import br.com.coolcute.bean.ProdutoAnuncio;
import br.com.coolcute.bean.StatusAnuncio;
import br.com.coolcute.bean.TipoAnuncio;
import br.com.coolcute.model.dao.AnuncioDao;
import br.com.coolcute.model.dao.ProdutoDao;
import br.com.coolcute.model.dao.StatusAnuncioDao;
import br.com.coolcute.model.dao.TipoAnuncioDao;
import br.com.coolcute.util.ObterId;
import java.sql.SQLException;
import java.util.List;
import javax.validation.Valid;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AnuncioController {
    
    @Autowired
    private AnuncioDao daoAnuncio;
    @Autowired
    private StatusAnuncioDao daoStatusAnuncio;
    @Autowired
    private TipoAnuncioDao daoTipoAnuncio;
    @Autowired
    private ProdutoDao daoProduto;
    private boolean retorno;
    private String msg;
    
    @RequestMapping("anuncio/criar/")
    public ModelAndView form() {
        
        ModelAndView modelAndView = new ModelAndView("anuncio/criar/");
        
        try {
            modelAndView.addObject("statusAnuncio", daoStatusAnuncio.getStatusAnuncio(new StatusAnuncio()));
            modelAndView.addObject("tipoAnuncio", daoTipoAnuncio.getTipoAnuncio(new TipoAnuncio()));
            modelAndView.addObject("proximoId", ObterId.obterId("anuncio"));
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return modelAndView;
    }
    
    @RequestMapping("anuncio/consultar/")
    public ModelAndView consulta(){        
        ModelAndView modelAndView = new ModelAndView("anuncio/consultar/");
        
        try {
            modelAndView.addObject("statusAnuncio", daoStatusAnuncio.getStatusAnuncio(new StatusAnuncio()));
            modelAndView.addObject("tipoAnuncio", daoTipoAnuncio.getTipoAnuncio(new TipoAnuncio()));
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return modelAndView;
    }
    
    @RequestMapping("adicionarAlterarAnuncio")
    public ModelAndView adicionarAlterarAnuncio (@RequestParam("itensAnuncio") String itens, @Valid Anuncio anuncio, BindingResult result){
        if(anuncio.getCodigo() != 0){        
            return alterarAnuncio(itens, anuncio, result);
        } else {
            return adicionarAnuncio(itens, anuncio, result);
        }        
    }	
    
    @RequestMapping("adicionarAnuncio")
    public ModelAndView adicionarAnuncio(@RequestParam("itensAnuncio") String itens, @Valid Anuncio anuncio, BindingResult result) {
        ModelAndView modelAndView = new ModelAndView("anuncio/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {            
            ObjectMapper mapper = new ObjectMapper();
            Collection<ProdutoAnuncio> lstItens;
            
            lstItens = mapper.readValue(itens, new TypeReference<Collection<ProdutoAnuncio>>() {});
            
            anuncio.setProdutoAnuncio((List<ProdutoAnuncio>) lstItens);
            
            daoAnuncio.adicionarAnuncio(anuncio);
            retorno = true;
            msg = "Cadastrado com sucesso";
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao cadastrar o registro. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao cadastrar os registros. " + e.getMessage();
        } finally {
            try {
                modelAndView.addObject("statusAnuncio", daoStatusAnuncio.getStatusAnuncio(new StatusAnuncio()));
                modelAndView.addObject("tipoAnuncio", daoTipoAnuncio.getTipoAnuncio(new TipoAnuncio()));
                modelAndView.addObject("proximoId", ObterId.obterId("anuncio"));
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
    
    @RequestMapping("alterarAnuncio")
    public ModelAndView alterarAnuncio(@RequestParam("itensAnuncio") String itens, @Valid Anuncio anuncio, BindingResult result) {
        
        ModelAndView modelAndView = new ModelAndView("anuncio/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {            
            ObjectMapper mapper = new ObjectMapper();
            Collection<ProdutoAnuncio> lstItens;
            
            lstItens = mapper.readValue(itens, new TypeReference<Collection<ProdutoAnuncio>>() {});
            
            anuncio.setProdutoAnuncio((List<ProdutoAnuncio>) lstItens);
            
            daoAnuncio.excluirProdutoAnuncio(anuncio.getCodigo());            
            daoAnuncio.alterarAnuncio(anuncio);
            retorno = true;
            msg = "Cadastrado com sucesso";
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao alterar o registro. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao alterar os registros. " + e.getMessage();
        } finally {
            try {
                modelAndView.addObject("statusAnuncio", daoStatusAnuncio.getStatusAnuncio(new StatusAnuncio()));
                modelAndView.addObject("tipoAnuncio", daoTipoAnuncio.getTipoAnuncio(new TipoAnuncio()));
                modelAndView.addObject("proximoId", ObterId.obterId("anuncio"));
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
    
    @RequestMapping("excluirAnuncio") 
    public ModelAndView excluirAnuncio(Anuncio anuncio, BindingResult result) {

        try {
           daoAnuncio.excluirAnuncio(anuncio.getCodigo()); 
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return filtrarAnuncio(new Anuncio(), result);
    }
    
    @RequestMapping("filtrarAnuncio")    
    public ModelAndView filtrarAnuncio(@ModelAttribute("anuncio") Anuncio anuncio, BindingResult result){
        
        ModelAndView modelAndView = new ModelAndView("anuncio/consultar/");
        
        try {            
            modelAndView.addObject("anuncio", daoAnuncio.getAnuncio(anuncio));
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        } finally {
            try {
                modelAndView.addObject("statusAnuncio", daoStatusAnuncio.getStatusAnuncio(new StatusAnuncio()));
                modelAndView.addObject("tipoAnuncio", daoTipoAnuncio.getTipoAnuncio(new TipoAnuncio()));
            } catch (SQLException ex) {
                retorno = false;
                msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + ex.getMessage();
            } catch (Exception ex){
                msg = "Ocorreu um erro ao listar os registros. " + ex.getMessage();
            }
        }
        return modelAndView;
    }
    
    @RequestMapping("consultarAnuncioItem/{id}")    
    public ModelAndView consultarAnuncioItem(@PathVariable("id") int id){
        
        ModelAndView modelAndView = new ModelAndView("anuncio/criar/");
        
        try {
            modelAndView.addObject("anuncio", daoAnuncio.getAnuncioItem(id));
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        } finally {
            try {
                modelAndView.addObject("statusAnuncio", daoStatusAnuncio.getStatusAnuncio(new StatusAnuncio()));
                modelAndView.addObject("tipoAnuncio", daoTipoAnuncio.getTipoAnuncio(new TipoAnuncio()));
                modelAndView.addObject("produtoAnuncio", daoAnuncio.getAnuncioProduto(id));
            } catch (SQLException ex) {
                retorno = false;
                msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + ex.getMessage();
            } catch (Exception ex){
                msg = "Ocorreu um erro ao listar os registros. " + ex.getMessage();
            }
        }
        return modelAndView;
    }
    
    //Retorna os clientes em formato json para chamadas ajax
    @RequestMapping("servicoConsultarAnuncio")
    @ResponseBody
    public String servicoConsultarAnuncio() {
        
        ObjectMapper mapper = new ObjectMapper();
        List<Anuncio> lstAnu = null;
        String jsonValue = null;
        
        try {            
            lstAnu = daoAnuncio.getAnuncio(new Anuncio(0, new StatusAnuncio(0, null), new TipoAnuncio (0, null, 0), null, 0));
            jsonValue = mapper.writeValueAsString(lstAnu);
        } catch (SQLException | JsonProcessingException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return jsonValue;
    }
    
    @RequestMapping("servicoConsultaAnuncioProduto/{codigo}")
    @ResponseBody
    public String servicoConsultaAnuncioProduto(@PathVariable int codigo){
        ObjectMapper mapper = new ObjectMapper();
        List<ProdutoAnuncio> lstAnu = null;
        String jsonValue = null;
        
        try {            
            lstAnu = daoAnuncio.getAnuncioProduto(codigo);
            jsonValue = mapper.writeValueAsString(lstAnu);
        } catch (SQLException | JsonProcessingException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return jsonValue;
    }
}