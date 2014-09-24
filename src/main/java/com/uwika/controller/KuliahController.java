/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uwika.controller;

import com.uwika.bean.Base;
import com.uwika.bean.Kuliah;
import com.uwika.bean.KuliahId;
import com.uwika.service.KuliahService;
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
public class KuliahController {
    
    private Logger logger = Logger.getLogger(this.getClass());
    
    @Autowired
    private KuliahService kuliahService;
    
    @RequestMapping(value = "/admin/kuliah", method = RequestMethod.GET)
    public String index() {
        return "admin/kuliah";
    }
    
    @RequestMapping(value = "/admin/kuliah/list", method = RequestMethod.POST)
    public @ResponseBody Base list(@RequestParam Integer sEcho,
            @RequestParam Integer iDisplayStart,
            @RequestParam Integer iDisplayLength,
            @RequestParam String sSortDir_0,
            @RequestParam String sSearch) {
        List<String[]> strings = kuliahService.select(iDisplayStart, iDisplayLength, sSortDir_0, sSearch);

        Base base = new Base();
        base.setsEcho(sEcho);

        Long size = kuliahService.getSize(sSearch);
        base.setiTotalDisplayRecords(size);
        base.setiTotalRecords(size);
        base.setsEcho(sEcho);
        base.setAaData(strings);

        return base;
    }
    
    @RequestMapping(value ="/admin/kuliah/detail/{id}", method = RequestMethod.GET)
    public String view(ModelMap modelMap, @PathVariable String id) {
        modelMap.put("kuliah", kuliahService.select(id));
        return "admin/kuliahEdit";
    }
    
    @RequestMapping(value ="/admin/kuliah/delete/{id}", method = RequestMethod.GET)
    public String delete(ModelMap modelMap, @PathVariable String id) {
        try {
            kuliahService.delete(id);
        } catch (Exception e) {
            logger.error(e,e);
        }
        return "redirect:/admin/kuliah";
    }
    
    @RequestMapping(value ="/admin/kuliah/new", method = RequestMethod.GET)
    public String add() {
        return "admin/kuliahEdit";
    }
    
    @RequestMapping(value ="/admin/kuliah/save", method = RequestMethod.POST)
    public String save(ModelMap modelMap, @ModelAttribute KuliahId kuliahId) {
        try {
            kuliahService.saveOrUpdate(new Kuliah(kuliahId));
        } catch (Exception e) {
            logger.error(e, e);
        }
        return "redirect:/admin/kuliah";
    }
}
