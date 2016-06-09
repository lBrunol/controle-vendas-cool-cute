package br.com.coolcute.controller;

import br.com.coolcute.bean.TipoAnuncio;
import br.com.coolcute.model.dao.TipoAnuncioDao;
import br.com.coolcute.util.ObterId;
import java.sql.SQLException;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TipoAnuncioController {
    
    @Autowired
    private TipoAnuncioDao daoTipoAnuncio;
    private boolean retorno;
    private String msg;
    
    @RequestMapping("tipo-anuncio/criar/")
    public String form() {
        return "tipo-anuncio/criar/";
    }
    
    @RequestMapping("tipo-anuncio/consultar/")
    public String consulta(){        
        return "tipo-anuncio/consultar/";
    }
    
    @RequestMapping("adicionarAlterarTipoAnuncio")
    public ModelAndView adicionarAlterarTipoAnuncio (@Valid TipoAnuncio tipoAnuncio, BindingResult result){
        if(tipoAnuncio.getCodigo() != 0){        
            return alterarTipoAnuncio(tipoAnuncio, result);
        } else {
            return adicionarTipoAnuncio(tipoAnuncio, result);
        }        
    }	
    
    @RequestMapping("adicionarTipoAnuncio")
    public ModelAndView adicionarTipoAnuncio(@Valid TipoAnuncio tipoAnuncio, BindingResult result){
        ModelAndView modelAndView = new ModelAndView("tipo-anuncio/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {
            tipoAnuncio.setCodigo(ObterId.obterId("tipoAnuncio"));
            if(tipoAnuncio.getPercentual() > 1)
                tipoAnuncio.setPercentual(tipoAnuncio.getPercentual() / 100);
            daoTipoAnuncio.adicionarTipoAnuncio(tipoAnuncio);
            retorno = true;
            msg = "Cadastrado com sucesso";
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao cadastrar o registro. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao cadastrar os registros. " + e.getMessage();
        } finally {
            try {
                modelAndView.addObject("tipoAnuncio", daoTipoAnuncio.getTipoAnuncioItem(tipoAnuncio.getCodigo()));
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
    
    @RequestMapping("alterarTipoAnuncio")
    public ModelAndView alterarTipoAnuncio(@Valid TipoAnuncio tipoAnuncio, BindingResult result) {
        
        ModelAndView modelAndView = new ModelAndView("tipo-anuncio/criar/");
        
        if(result.hasErrors()){
            retorno = false;
            modelAndView.addObject("retorno", retorno);
            return modelAndView;
        }
        
        try {
            if(tipoAnuncio.getPercentual() > 1)
                tipoAnuncio.setPercentual(tipoAnuncio.getPercentual() / 100);
            daoTipoAnuncio.alterarTipoAnuncio(tipoAnuncio);
            retorno = true;
            msg = "Registro alterado com sucesso";
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro com o banco de dados ao alterar o registro. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao alterar os registros. " + e.getMessage();
        } finally {
            try {
                modelAndView.addObject("tipoAnuncio", daoTipoAnuncio.getTipoAnuncioItem(tipoAnuncio.getCodigo()));
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
    
    @RequestMapping("excluirTipoAnuncio") 
    public ModelAndView excluirTipoAnuncio(TipoAnuncio tipoAnuncio, BindingResult result) {

        try {
           daoTipoAnuncio.excluirTipoAnuncio(tipoAnuncio.getCodigo()); 
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        
        return filtrarTipoAnuncio(new TipoAnuncio(), result);
    }
    
    @RequestMapping("filtrarTipoAnuncio")    
    public ModelAndView filtrarTipoAnuncio(@ModelAttribute("tipoAnuncio") TipoAnuncio tipoAnuncio, BindingResult result){
        
        ModelAndView modelAndView = new ModelAndView("tipo-anuncio/consultar/");
        
        try {            
            modelAndView.addObject("tipoAnuncio", daoTipoAnuncio.getTipoAnuncio(tipoAnuncio));
            modelAndView.addObject("tipoAnuncioFiltro", tipoAnuncio);
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return modelAndView;
    }
    
    @RequestMapping("consultarTipoAnuncioItem/{id}")    
    public ModelAndView consultarTipoAnuncioItem(@PathVariable("id") int id){
        
        ModelAndView modelAndView = new ModelAndView("tipo-anuncio/criar/");
        
        try {
            modelAndView.addObject("tipoAnuncio", daoTipoAnuncio.getTipoAnuncioItem(id));
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao listar os registros. " + e.getMessage();
            modelAndView.addObject("msg", msg);
        } catch (Exception e){
            msg = "Ocorreu um erro ao listar os registros. " + e.getMessage();
        }
        return modelAndView;
    }
}