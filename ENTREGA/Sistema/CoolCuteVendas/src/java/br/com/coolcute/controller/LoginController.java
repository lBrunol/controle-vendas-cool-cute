package br.com.coolcute.controller;

import br.com.coolcute.bean.Usuario;
import br.com.coolcute.model.dao.UsuarioDao;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {
    
    @Autowired
    private UsuarioDao daoUsuario;
    private String msg = null;
    
    @RequestMapping("login/")
    public String form(){
        return "login/";
    }
    
    @RequestMapping("autenticarUsuario")
    public String autenticarUsuario(Usuario usuario, HttpSession session, RedirectAttributes atributosRedirect) {
        
        //ModelAndView modelAndView = new ModelAndView("login/");
        
        try {
            if( daoUsuario.autenticaUsuario(usuario)) {
                session.setAttribute("usuarioLogado", usuario);
                //modelAndView.setViewName("home/");
                return "redirect:home/";
            } else {
                throw new IllegalArgumentException("Usuário ou senha inválido(s)");
            }
        } catch (SQLException e) {
            msg = "Ocorreu um erro com o banco de dados ao consultar o usuário. " + e.getMessage();
        } catch (IllegalArgumentException e) {
            msg = e.getMessage();
        } catch (Exception e){
            msg = "Ocorreu um erro ao consultar o usuário. " + e.getMessage();
        }
        
        //modelAndView.addObject("msg", msg);
        atributosRedirect.addFlashAttribute("msg", msg);
        return "redirect:login/";
    }
    
    @RequestMapping("logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:login/";
    }
}

