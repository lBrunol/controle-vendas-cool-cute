package br.com.coolcute.controller;

import br.com.coolcute.bean.Cliente;
import br.com.coolcute.model.dao.ClienteDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.sql.SQLException;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
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
    
    //Mapeamento dos forms
    @RequestMapping("cliente/criar/")
    public String form() {
        return "cliente/criar/";
    }
    
    @RequestMapping("cliente/consultar/")
    public String consulta(){        
        return "cliente/consultar/";
    }
    
    //No request verifica se é alteração ou criação
    @RequestMapping("adicionarAlterarCliente")
    public ModelAndView adicionarAlterarCliente (@Valid Cliente cliente, BindingResult result){
        if(cliente.getCodigo() != 0){        
            return alterarCliente(cliente);
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
            daoCliente.adiciona(cliente);
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
    
    @RequestMapping("consultarCliente")
    public ModelAndView lista(){
        
        ModelAndView modelAndView = new ModelAndView("cliente/consultar/");
        
        try {            
            modelAndView.addObject("cliente", daoCliente.getCliente());
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return modelAndView;
    }
    
    @RequestMapping("consultarClienteItem/{id}")
    public ModelAndView listaItem(@PathVariable("id") Long id){
        
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
    
    @RequestMapping("alterarCliente")
    public ModelAndView alterarCliente(Cliente cliente) {
        
        ModelAndView modelAndView = new ModelAndView("cliente/criar/");
        
        try {
            daoCliente.altera(cliente);
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
    
    @RequestMapping("excluirCliente") 
    public ModelAndView removerCliente(Cliente cliente) {

        try {
           daoCliente.exclui(cliente.getCodigo()); 
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return lista();
    }
	
    @RequestMapping("filtrarCliente")
    public ModelAndView filtrarCliente(Cliente cliente){
        
        ModelAndView modelAndView = new ModelAndView("cliente/consultar/");
        
        try {            
            modelAndView.addObject("cliente", daoCliente.filterCliente(cliente));
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return modelAndView;
    }
    
    //Retorna os clientes em formato json para chamadas ajax
    @RequestMapping("servicoConsultarCliente")
    @ResponseBody
    public String servicoConsultarCliente() {
        
        ObjectMapper mapper = new ObjectMapper();
        List<Cliente> lstCli = null;
        String jsonValue = null;
        
        try {            
            lstCli = daoCliente.getCliente();
            jsonValue = mapper.writeValueAsString(lstCli);
        } catch (SQLException | JsonProcessingException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return jsonValue;
    }    
}