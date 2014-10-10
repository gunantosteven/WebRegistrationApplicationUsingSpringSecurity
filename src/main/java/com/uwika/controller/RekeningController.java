/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uwika.controller;

import com.uwika.bean.Mahasiswa;
import com.uwika.bean.Rekening;
import com.uwika.service.MahasiswaService;
import com.uwika.service.RekeningService;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Steven Gunanto
 */
@Controller
public class RekeningController {
    
    @Autowired
    private RekeningService rekeningService;
    
    @Autowired
    private MahasiswaService mahasiswaService;
    
    private Logger logger = Logger.getLogger(this.getClass());
    
    @RequestMapping(value = "/rekening", method = RequestMethod.GET)
    public String index(@RequestParam String param,ModelMap modelMap) {
        if(mahasiswaService.selectBasedOnUuid(param) != null)
        {
            Mahasiswa mahasiswa = (Mahasiswa) mahasiswaService.selectBasedOnUuid(param);
            System.out.println(mahasiswa.getStatus());
            if(mahasiswa.getStatus().equals("SUDAH BAYAR"))
            {
                modelMap.addAttribute("message","Pembayaran anda sudah lunas");
                return "rekeningMessage";
            }
            else
            {
                modelMap.put("mahasiswa", mahasiswa);
                return "rekening";
            }
        }
        return "index";
    }
    
    @RequestMapping(value = "/rekening/save", method = RequestMethod.POST)
    public String save(ModelMap modelMap, @ModelAttribute Rekening rekening) {
        try {
            Mahasiswa mahasiswa = (Mahasiswa) mahasiswaService.select(rekening.getNoPendaftaran());
            if(rekeningService.select(rekening.getNoPendaftaran()) == null)
            {
                rekening.setNoPendaftaran(null);
                rekening.setMahasiswa(mahasiswa);
            }
            
            mahasiswa.setStatus("PROSES");
            mahasiswa.setRekening(rekening);
            
            mahasiswaService.saveOrUpdate(mahasiswa);
        } catch (Exception e) {
            logger.error(e, e);
        }
        modelMap.addAttribute("message","Silakan menunggu beberapa hari untuk pengecekan");
        return "rekeningMessage";
    }
}
