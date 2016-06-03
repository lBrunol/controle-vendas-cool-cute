/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.coolcute.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 *
 * @author Casa
 */
public class AutorizadorInterceptor extends HandlerInterceptorAdapter {
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller) throws Exception {
        
        String uri = request.getRequestURI();
            if( uri.contains("fonts") || uri.contains("js") || uri.contains("imagens") || uri.contains("includes") || uri.contains("css") || uri.contains("autenticarUsuario") || uri.contains("login") ){
                return true;
            }

        if(request.getSession().getAttribute("usuarioLogado") != null) {
            return true;
        }
        
        response.sendRedirect("/login/");
        return false;
    }
}
