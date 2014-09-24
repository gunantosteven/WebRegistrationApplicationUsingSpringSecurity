/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uwika.controller;

import com.uwika.bean.Mahasiswa;
import com.uwika.service.MahasiswaService;
import java.beans.PropertyEditorSupport;
import java.sql.BatchUpdateException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.apache.log4j.Logger;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Steven Gunanto
 */
@Controller
public class RegistrasiController {
    
    private Logger logger = Logger.getLogger(this.getClass());
    private SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy");
    
    @Autowired
    private MahasiswaService mahasiswaService;
    
    @RequestMapping(value = "/registrasi", method = RequestMethod.GET )
    public String index(ModelMap modelMap)
    {
        modelMap.put("noPendaftaran",
                mahasiswaService.getLastNoPendaftaran(simpleDateFormat.format(new Date())));
        return "registrasi";
    }
    
    @RequestMapping(value="/registrasi/save", method = RequestMethod.POST )
    public String save(ModelMap modelMap, @ModelAttribute Mahasiswa mahasiswa)
    {
        int count = 0;
        modelMap.put("noPendaftaran",
                mahasiswaService.getLastNoPendaftaran(simpleDateFormat.format(new Date())));
        do
        {
            count++;
            try {
                   mahasiswaService.save(mahasiswa);
                   modelMap.put("validasi", "success");
                   return "registrasi";
            } 
            catch (Exception e) {
                if(e.getMessage().startsWith("Could not execute JDBC batch update;"))
                {
                    mahasiswa.setNoPendaftaran(mahasiswaService.
                            getDifferentNoPendaftaran(mahasiswa.getNoPendaftaran()));
                }
                logger.error(e, e);
            }
        }while(10 >= count);
        
        modelMap.put("validasi", "Server lagi sibuk,silakan coba beberapa saat lagi...");
        return "registrasi";
    }
    
    @InitBinder
    public void binder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
            public void setAsText(String value) {
                try {
                    setValue(new SimpleDateFormat("yyyy-MM-dd").parse(value));
                } catch (ParseException e) {
                    setValue(null);
                }
            }
        });
    }
    
}
