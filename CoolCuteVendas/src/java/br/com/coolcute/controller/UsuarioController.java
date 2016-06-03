package br.com.coolcute.controller;

import br.com.coolcute.bean.Usuario;
import br.com.coolcute.model.dao.UsuarioDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;
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
public class UsuarioController {
    
    @Autowired
    private UsuarioDao daoUsuario;
    private boolean retorno;
    private String msg;
    
    @RequestMapping("usuario/criar/")
    public String form() {
        return "usuario/criar/";
    }
    
    @RequestMapping("usuario/consultar/")
    public String consulta(){        
        return "usuario/consultar/";
    }
    
    @RequestMapping("adicionarAlterarUsuario")
    public ModelAndView adicionarAlterarUsuario (@Valid Usuario usuario, BindingResult result){
        if(usuario.getCodigo() != 0){        
            return alterarUsuario(usuario, result);
        } else {
            return adicionarUsuario(usuario, result);
        }        
    }	
    
    @RequestMapping("adicionarUsuario")
    public ModelAndView adicionarUsuario(@Valid Usuario usuario, BindingResult result){
        ModelAndView modelAndView = new ModelAndView("usuario/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {
            daoUsuario.adicionarUsuario(usuario);
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
    
    @RequestMapping("alterarUsuario")
    public ModelAndView alterarUsuario(@Valid Usuario usuario, BindingResult result) {
        
        ModelAndView modelAndView = new ModelAndView("usuario/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {
            daoUsuario.alterarUsuario(usuario);
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
    
    @RequestMapping("excluirUsuario") 
    public ModelAndView excluirUsuario(Usuario usuario, BindingResult result) {

        try {
           daoUsuario.excluirUsuario(usuario.getCodigo()); 
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return filtrarUsuario(new Usuario(), result);
    }
    
    @RequestMapping("filtrarUsuario")    
    public ModelAndView filtrarUsuario(@ModelAttribute("usuario") Usuario usuario, BindingResult result){
        
        ModelAndView modelAndView = new ModelAndView("usuario/consultar/");
        
        try {            
            modelAndView.addObject("usuario", daoUsuario.getUsuario(usuario));
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return modelAndView;
    }
    
    @RequestMapping("consultarUsuarioItem/{id}")    
    public ModelAndView consultarUsuarioItem(@PathVariable("id") int id){
        
        ModelAndView modelAndView = new ModelAndView("usuario/criar/");
        
        try {
            modelAndView.addObject("usuario", daoUsuario.getUsuarioItem(id));
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return modelAndView;
    }
    
    @RequestMapping("servicoConsultaLoginUsuario/{usuario}")
    @ResponseBody
    public String servicoConsultaLoginUsuario(@PathVariable("usuario") String usuario){
        ObjectMapper mapper = new ObjectMapper();
        boolean usuarioExiste = false;
        String jsonValue = null;
        
        try {            
            usuarioExiste = daoUsuario.getUsuarioLogin(usuario);
            jsonValue = mapper.writeValueAsString(usuarioExiste);
        } catch (SQLException | JsonProcessingException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return jsonValue;
    }    
}