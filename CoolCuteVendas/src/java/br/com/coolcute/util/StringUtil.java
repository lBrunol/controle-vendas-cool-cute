/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.coolcute.util;

/**
 *
 * @author Casa
 */
public class StringUtil {
    
    private static boolean isNull(String str) {
        return str == null ? true : false;
    }

    public static boolean isNullOrEmpty(String param) {
        if (isNull(param) || param.trim().length() == 0) {
            return true;
        }
        return false;
    }
    
}
