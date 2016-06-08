package br.com.coolcute.controller;

import br.com.coolcute.bean.Cliente;
import br.com.coolcute.model.dao.ClienteDao;
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
public class ClienteController {
    
    @Autowired
    private ClienteDao daoCliente;
    private boolean retorno;
    private String msg;
    
    @RequestMapping("cliente/criar/")
    public String form() {
        return "cliente/criar/";
    }
    
    @RequestMapping("cliente/consultar/")
    public String consulta(){        
        return "cliente/consultar/";
    }
    
    @RequestMapping("adicionarAlterarCliente")
    public ModelAndView adicionarAlterarCliente (@Valid Cliente cliente, BindingResult result){
        if(cliente.getCodigo() != 0){        
            return alterarCliente(cliente, result);
        } else {
            return adicionarCliente(cliente, result);
        }        
    }	
    
    @RequestMapping("adicionarCliente")
    public ModelAndView adicionarCliente(@Valid Cliente cliente, BindingResult result){
        ModelAndView modelAndView = new ModelAndView("cliente/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {
            cliente.setCodigo(ObterId.obterId("cliente"));
            daoCliente.adicionarCliente(cliente);
            retorno = true;
            msg = "Cadastrado com sucesso";
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao cadastrar o registro. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao cadastrar os registros. " + e.getMessage();
        } finally {
            try {
                modelAndView.addObject("cliente", daoCliente.getClienteItem(cliente.getCodigo()));
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
    
    @RequestMapping("alterarCliente")
    public ModelAndView alterarCliente(@Valid Cliente cliente, BindingResult result) {
        
        ModelAndView modelAndView = new ModelAndView("cliente/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {
            daoCliente.alterarCliente(cliente);
            retorno = true;
            msg = "Registro alterado com sucesso";
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao alterar o registro. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao alterar os registros. " + e.getMessage();
        } finally {
            try {
                modelAndView.addObject("cliente", daoCliente.getClienteItem(cliente.getCodigo()));
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
    
    @RequestMapping("excluirCliente") 
    public ModelAndView excluirCliente(Cliente cliente, BindingResult result) {

        try {
           daoCliente.excluirCliente(cliente.getCodigo()); 
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return filtrarCliente(new Cliente(), result);
    }
    
    @RequestMapping("filtrarCliente")    
    public ModelAndView filtrarCliente(@ModelAttribute("cliente") Cliente cliente, BindingResult result){
        
        ModelAndView modelAndView = new ModelAndView("cliente/consultar/");
        
        try {            
            modelAndView.addObject("cliente", daoCliente.getCliente(cliente));
            modelAndView.addObject("clienteFiltro", cliente);
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return modelAndView;
    }
    
    @RequestMapping("consultarClienteItem/{id}")    
    public ModelAndView consultarClienteItem(@PathVariable("id") int id){
        
        ModelAndView modelAndView = new ModelAndView("cliente/criar/");
        
        try {
            modelAndView.addObject("cliente", daoCliente.getClienteItem(id));
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return modelAndView;
    }
    
    @RequestMapping("servicoConsultarCliente")
    @ResponseBody
    public String servicoConsultarCliente() {
        
        ObjectMapper mapper = new ObjectMapper();
        List<Cliente> lstCli = null;
        String jsonValue = null;
        
        try {            
            lstCli = daoCliente.getCliente(new Cliente());
            jsonValue = mapper.writeValueAsString(lstCli);
        } catch (SQLException | JsonProcessingException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return jsonValue;
    }
}