package br.com.coolcute.controller;

import br.com.coolcute.bean.Produto;
import br.com.coolcute.model.dao.ProdutoDao;
import br.com.coolcute.util.ObterId;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.sql.SQLException;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProdutoController {
    
    @Autowired
    private ProdutoDao daoProduto;
    private boolean retorno;
    private String msg;
    
    @RequestMapping("produto/criar/")
    public String form() {
        return "produto/criar/";
    }
    
    @RequestMapping("produto/consultar/")
    public String consulta(){        
        return "produto/consultar/";
    }
    
    @RequestMapping("adicionarAlterarProduto")
    public ModelAndView adicionarAlterarProduto (@Valid Produto produto, BindingResult result){
        if(produto.getCodigo() != 0){        
            return alterarProduto(produto, result);
        } else {
            return adicionarProduto(produto, result);
        }        
    }	
    
    @RequestMapping("adicionarProduto")
    public ModelAndView adicionarProduto(@Valid Produto produto, BindingResult result){
        ModelAndView modelAndView = new ModelAndView("produto/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {
            produto.setCodigo(ObterId.obterId("produto"));
            daoProduto.adicionarProduto(produto);
            retorno = true;
            msg = "Cadastrado com sucesso";
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao cadastrar o registro. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao cadastrar os registros. " + e.getMessage();
        } finally {
            try {
                modelAndView.addObject("produto", daoProduto.getProdutoItem(produto.getCodigo()));
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
    
    @RequestMapping("alterarProduto")
    public ModelAndView alterarProduto(@Valid Produto produto, BindingResult result) {
        
        ModelAndView modelAndView = new ModelAndView("produto/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {
            daoProduto.alterarProduto(produto);
            retorno = true;
            msg = "Registro alterado com sucesso";
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao alterar o registro. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao alterar os registros. " + e.getMessage();
        } finally {
            try {
                modelAndView.addObject("produto", daoProduto.getProdutoItem(produto.getCodigo()));
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
    
    @RequestMapping("excluirProduto") 
    public ModelAndView excluirProduto(Produto produto, BindingResult result) {

        try {
           daoProduto.excluirProduto(produto.getCodigo()); 
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return filtrarProduto(new Produto(), result);
    }
    
    @RequestMapping("filtrarProduto")    
    public ModelAndView filtrarProduto(@ModelAttribute("produto") Produto produto, BindingResult result){
        
        ModelAndView modelAndView = new ModelAndView("produto/consultar/");
        
        try {
            modelAndView.addObject("produto", daoProduto.getProduto(produto));
            modelAndView.addObject("produtoFiltro", produto);
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return modelAndView;
    }
    
    @RequestMapping("consultarProdutoItem/{id}")    
    public ModelAndView consultarProdutoItem(@PathVariable("id") int id){
        
        ModelAndView modelAndView = new ModelAndView("produto/criar/");
        
        try {
            modelAndView.addObject("produto", daoProduto.getProdutoItem(id));
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return modelAndView;
    }
    
    @RequestMapping("servicoConsultarProduto")
    @ResponseBody
    public String servicoConsultarProduto() {
        
        ObjectMapper mapper = new ObjectMapper();
        List<Produto> lstPro = null;
        String jsonValue = null;
        
        try {            
            lstPro = daoProduto.getProduto(new Produto());
            jsonValue = mapper.writeValueAsString(lstPro);
        } catch (SQLException | JsonProcessingException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return jsonValue;
    }
}