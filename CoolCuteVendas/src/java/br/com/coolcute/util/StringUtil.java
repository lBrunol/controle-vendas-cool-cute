/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.coolcute.util;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

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
    
    public static String calendarToString(Calendar data) {
        SimpleDateFormat sdfData = new SimpleDateFormat("dd-MM-yyyy");
        Date dataFormatada = new Date(data.getInstance().getTime().getTime());
        String strData = sdfData.format(dataFormatada);
        return strData;
    }
    
    public static String dateToString(java.util.Date data) {
        SimpleDateFormat sdfData = new SimpleDateFormat("dd-MM-yyyy");
        String strData = sdfData.format(data);
        return strData;
    }
    
    public static java.sql.Date dateToDateSql(java.util.Date data) {
        java.sql.Date dataSql = null;
        try {
            SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
            java.util.Date dataConvertida = format.parse(dateToString(data));
            dataSql = new java.sql.Date(dataConvertida.getTime());

        } catch (ParseException ex) {
            ex.printStackTrace();
        }
        return dataSql;
    }
    
    public static java.sql.Date calendarToDateSql(Calendar data) {
        java.sql.Date dataSql = null;
        try {
            SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
            java.util.Date dataConvertida = format.parse(calendarToString(data));
            dataSql = new java.sql.Date(dataConvertida.getTime());

        } catch (ParseException ex) {
            ex.printStackTrace();
        }
        return dataSql;
    }    
}
