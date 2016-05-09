package br.com.coolcute.controller;

import br.com.coolcute.bean.TipoAnuncio;
import br.com.coolcute.model.dao.TipoAnuncioDao;
import java.sql.SQLException;
import javax.validation.Valid;
//import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TipoAnuncioController {
    
    @Autowired
    private TipoAnuncioDao daoTipoAnuncio;
    private boolean retorno;
    private String msg;
    
    @RequestMapping("criar")
    public String form() {
        return "tipo-anuncio/criar/index";
    }
	
    @RequestMapping("criarTipoAnuncio")
    public ModelAndView adiciona(@Valid TipoAnuncio tipoAnuncio){
        
        try {
            daoTipoAnuncio.adiciona(tipoAnuncio);
            retorno = true;
            msg = "Cadastrado com sucesso";
        } catch (SQLException e) {
            retorno = false;
            msg = "Ocorreu um erro ao cadastrar o registro. " + e.getMessage();
        }

        ModelAndView modelAndView = new ModelAndView("tipo-anuncio/criar/index");
        modelAndView.addObject("retorno", retorno);
        modelAndView.addObject("msg", msg);
        
        return modelAndView;		
    }
	
    @RequestMapping("/tipo-anuncio/consultar")
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
	
    @RequestMapping("/tipoAnuncio/remover") 
    public String remove(TipoAnuncio tarefa) throws SQLException {
            TipoAnuncioDao dao = new TipoAnuncioDao();
            dao.exclui(tarefa);
            return "forward:listaTipoAnuncio";
    }
	
    @RequestMapping("mostraTarefa")
    public String mostra(Long id, Model model) throws SQLException {
            TipoAnuncioDao dao = new TipoAnuncioDao();
            //model.addAttribute("tarefa", dao.getTipoAnuncioId(id));
            return "mostra";
    }
	
    @RequestMapping("alteraTarefa")
    public String altera(TipoAnuncio tarefa) throws SQLException {
            TipoAnuncioDao dao = new TipoAnuncioDao();
            dao.altera(tarefa);
            return "redirect:listaTipoAnuncio";
    }
    
}
