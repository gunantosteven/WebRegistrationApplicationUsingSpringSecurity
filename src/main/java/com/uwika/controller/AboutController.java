/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uwika.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Steven Gunanto
 */
@Controller
public class AboutController {
    
    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String index() {
        return "about";
    }
    
}
