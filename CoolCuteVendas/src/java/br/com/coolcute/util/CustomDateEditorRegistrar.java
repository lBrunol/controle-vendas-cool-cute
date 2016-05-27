/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.coolcute.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import org.joda.time.DateTime;

import org.springframework.beans.PropertyEditorRegistrar;
import org.springframework.beans.PropertyEditorRegistry;
import org.springframework.beans.propertyeditors.CustomDateEditor;

public class CustomDateEditorRegistrar implements PropertyEditorRegistrar {

     @Override
     public void registerCustomEditors(PropertyEditorRegistry registry) {
         registry.registerCustomEditor(DateTime.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), false));
     }
}