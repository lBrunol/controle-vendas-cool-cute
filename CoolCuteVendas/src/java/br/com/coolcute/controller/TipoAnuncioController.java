package br.com.coolcute.controller;

import br.com.coolcute.bean.TipoAnuncio;
import br.com.coolcute.model.dao.TipoAnuncioDao;
import java.sql.SQLException;
import javax.validation.Valid;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TipoAnuncioController {
    
    @Autowired
    private TipoAnuncioDao daoTipoAnuncio;
    private boolean retorno;
    private String msg;
    
    @RequestMapping("tipo-anuncio/criar/index")
    public String form() {
        return "tipo-anuncio/criar/index";
    }
    
    @RequestMapping("adicionaAltera")
    public ModelAndView adicionaAltera (TipoAnuncio tipoAnuncio){
        
        if(tipoAnuncio.getCodigo() != 0){        
            return altera(tipoAnuncio);
        } else {
            return adiciona(tipoAnuncio);
        }
        
    }
    
    @RequestMapping("/tipo-anuncio/consultar/index")
    public String consulta(){        
        return "/tipo-anuncio/consultar/index";
    }
	
    @RequestMapping("criarTipoAnuncio")
        public ModelAndView adiciona(@Valid TipoAnuncio tipoAnuncio){
        ModelAndView modelAndView = new ModelAndView("tipo-anuncio/criar/index");
        
        try {
            daoTipoAnuncio.adiciona(tipoAnuncio);
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
    
    @RequestMapping("consultarTipoAnuncio")
    public ModelAndView lista(){
        
        ModelAndView modelAndView = new ModelAndView("tipo-anuncio/consultar/index");
        
        try {            
            modelAndView.addObject("tipoAnuncio", daoTipoAnuncio.getTipoAnuncio());
        } catch (SQLException e) {
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        }
        return modelAndView;
    }
    
    @RequestMapping("consultarTipoAnuncioItem/{id}")
    public ModelAndView listaItem(@PathVariable("id") Long id){
        
        ModelAndView modelAndView = new ModelAndView("tipo-anuncio/criar/index");
        
        try {            
            modelAndView.addObject("tipoAnuncio", daoTipoAnuncio.getTipoAnuncioItem(id));
        } catch (SQLException e) {
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        }
        return modelAndView;
    }
	
    @RequestMapping("/tipo-anuncio/excluir/{id}") 
    public ModelAndView remove(@PathVariable("id") Long id) {
        TipoAnuncioDao dao = new TipoAnuncioDao();
        try {
           dao.exclui(id); 
        } catch (SQLException e) {
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return lista();
    }
	
    @RequestMapping("alteraTarefa")
    public ModelAndView altera(TipoAnuncio tipoAnuncio) {
        
        ModelAndView modelAndView = new ModelAndView("tipo-anuncio/criar/index");
        
        try {
            daoTipoAnuncio.altera(tipoAnuncio);
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
