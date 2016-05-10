package br.com.coolcute.controller;

import br.com.coolcute.bean.Cliente;
import br.com.coolcute.model.dao.ClienteDao;
import java.sql.SQLException;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ClienteController {
    
    @Autowired
    private ClienteDao daoCliente;
    private boolean retorno;
    private String msg;
    
    @RequestMapping("cliente/criar/index")
    public String form() {
        return "cliente/criar/index";
    }
    
    @RequestMapping("adicionaAlteraCliente")
    public ModelAndView adicionaAltera (Cliente cliente){
        
        if(cliente.getCodigo() != 0){        
            return altera(cliente);
        } else {
            return adiciona(cliente);
        }
        
    }
    
    @RequestMapping("/cliente/consultar/index")
    public String consulta(){        
        return "/cliente/consultar/index";
    }
	
    @RequestMapping("criarCliente")
        public ModelAndView adiciona(@Valid Cliente cliente){
        ModelAndView modelAndView = new ModelAndView("cliente/criar/index");
        
        try {
            daoCliente.adiciona(cliente);
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
    
    @RequestMapping("consultarCliente")
    public ModelAndView lista(){
        
        ModelAndView modelAndView = new ModelAndView("cliente/consultar/index");
        
        try {            
            modelAndView.addObject("cliente", daoCliente.getCliente());
        } catch (SQLException e) {
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        }
        return modelAndView;
    }
    
    @RequestMapping("servicoConsultarCliente")
    public ModelAndView servicoListaCliente(){
        
        ModelAndView modelAndView = new ModelAndView("cliente/consultar/index");
        
        try {            
            modelAndView.addObject("cliente", daoCliente.getCliente());
        } catch (SQLException e) {
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        }
        return modelAndView;
    }
    
    @RequestMapping("consultarClienteItem/{id}")
    public ModelAndView listaItem(@PathVariable("id") Long id){
        
        ModelAndView modelAndView = new ModelAndView("cliente/criar/index");
        
        try {            
            modelAndView.addObject("cliente", daoCliente.getClienteItem(id));
        } catch (SQLException e) {
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        }
        return modelAndView;
    }
	
    @RequestMapping("/cliente/excluir/{id}") 
    public ModelAndView remove(@PathVariable("id") Long id) {
        ClienteDao dao = new ClienteDao();
        try {
           dao.exclui(id); 
        } catch (SQLException e) {
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return lista();
    }
	
    @RequestMapping("alteraCliente")
    public ModelAndView altera(Cliente cliente) {
        
        ModelAndView modelAndView = new ModelAndView("cliente/criar/index");
        
        try {
            daoCliente.altera(cliente);
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
