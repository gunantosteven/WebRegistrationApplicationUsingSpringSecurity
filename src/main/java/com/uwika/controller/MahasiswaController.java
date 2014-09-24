/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uwika.controller;

import com.uwika.bean.Base;
import com.uwika.bean.Mahasiswa;
import com.uwika.service.MahasiswaService;
import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Steven Gunanto
 */
@Controller
public class MahasiswaController {
    
    private Logger logger = Logger.getLogger(this.getClass());
    
    @Autowired
    private MahasiswaService mahasiswaService;
    
    @RequestMapping(value = "/admin/mahasiswa", method = RequestMethod.GET)
    public String index() {
        return "admin/mahasiswa";
    }
    
    @RequestMapping(value ="/admin/mahasiswa/save", method = RequestMethod.POST)
    public String save(ModelMap modelMap, @ModelAttribute Mahasiswa mahasiswa) {
        try {
            mahasiswaService.saveOrUpdate(mahasiswa);
        } catch (Exception e) {
            logger.error(e, e);
        }
        return "redirect:/admin/mahasiswa";
    }
    
    @RequestMapping(value = "/admin/mahasiswa/list", method = RequestMethod.POST)
    public @ResponseBody Base list(@RequestParam Integer sEcho,
            @RequestParam Integer iDisplayStart,
            @RequestParam Integer iDisplayLength,
            @RequestParam String sSortDir_0,
            @RequestParam String sSearch) {
        List<String[]> strings = mahasiswaService.select(iDisplayStart, iDisplayLength, sSortDir_0, sSearch);

        Base base = new Base();
        base.setsEcho(sEcho);

        Long size = mahasiswaService.getSize(sSearch);
        base.setiTotalDisplayRecords(size);
        base.setiTotalRecords(size);
        base.setsEcho(sEcho);
        base.setAaData(strings);

        return base;
    }
    
    @RequestMapping(value ="/admin/mahasiswa/detail/{id}", method = RequestMethod.GET)
    public String view(ModelMap modelMap, @PathVariable String id) {
        modelMap.put("mahasiswa", mahasiswaService.select(id));
        return "admin/mahasiswaEdit";
    }
    
    @RequestMapping(value ="/admin/mahasiswa/delete/{id}", method = RequestMethod.GET)
    public String delete(ModelMap modelMap, @PathVariable String id) {
        try {
            mahasiswaService.delete(id);
        } catch (Exception e) {
            logger.error(e,e);
        }
        return "redirect:/admin/mahasiswa";
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
