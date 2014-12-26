/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uwika.controller;

import com.uwika.bean.Mahasiswa;
import com.uwika.bean.Rekening;
import com.uwika.service.MahasiswaService;
import com.uwika.service.RekeningService;
import java.beans.PropertyEditorSupport;
import java.io.ByteArrayOutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.activation.DataSource;
import javax.mail.internet.MimeMessage;
import javax.mail.util.ByteArrayDataSource;
import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
    
    @Autowired
    private RekeningService rekeningService;
    
    @Autowired
    private JavaMailSender  mailSender; 
    
    @RequestMapping(value = "/registrasi", method = RequestMethod.GET )
    public String index(ModelMap modelMap)
    {
        modelMap.put("noPendaftaran",
                mahasiswaService.getLastNoPendaftaran(simpleDateFormat.format(new Date())));
        return "registrasi";
    }
    
    @RequestMapping(value="/registrasi/create", method = RequestMethod.POST )
    public ModelAndView save(ModelAndView modelAndView, @ModelAttribute Mahasiswa mahasiswa, HttpServletRequest request) throws Exception
    {
        int count = 0;
        do
        {
            count++;
            try {
                mahasiswa.setStatus("BELUM BAYAR");
                mahasiswa.setUuid(java.util.UUID.randomUUID().toString());
                mahasiswaService.save(mahasiswa);
                
                // creating report
                List<Mahasiswa> model = mahasiswaService.get(mahasiswa.getNoPendaftaran());
                modelAndView.addObject("format", "pdf");
                modelAndView.addObject("dataSource", model);
                // creating report to be sent to email
                JasperPrint jasperPrint = JasperFillManager.fillReport(request.getServletContext().getResourceAsStream("/WEB-INF/jrxml/calonmahasiswa.jasper") , null, new JRBeanCollectionDataSource(model));
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint, baos);
                DataSource aAttachment =  new ByteArrayDataSource(baos.toByteArray(), "application/pdf");
//                Rekening rekening = new Rekening();
//                rekening.setHargaTransfer(0);
//                rekening.setMahasiswa(mahasiswa);
//                rekening.setNamaRekening("asd");
//                rekening.setNoRekening("asd");
//                
//                rekeningService.saveOrUpdate(rekening);

//                // send message email
//                //creating message
//                SimpleMailMessage message = new SimpleMailMessage();
//                message.setFrom("widyakartikamail@gmail.com");
//                message.setTo(mahasiswa.getEmail());  
//                message.setSubject("Pendaftaran Mahasiswa Uwika");  
//                message.setText("Selamat anda telah bergabung\n" + "No Pendaftaran anda adalah : " + mahasiswa.getNoPendaftaran() + 
//                        "\n<a href=\"" + request.getRequestURL().toString().split("/")[1] + "?param=" + mahasiswa.getUuid()+ 
//                        "\">Klik disini untuk memasukan rekening</a>");  
                
                
                
                //sending message  
                MimeMessage mime = this.mailSender.createMimeMessage();
                MimeMessageHelper helper = new MimeMessageHelper(mime, true);
                helper.setFrom("widyakartikamail@gmail.com");
                helper.setTo(mahasiswa.getEmail());
                helper.setSubject("Pendaftaran Mahasiswa Uwika");
                helper.addAttachment("calonmahasiswa", aAttachment);
                String htmlText = "Selamat anda telah bergabung<br/>" + "No Pendaftaran anda adalah : " + mahasiswa.getNoPendaftaran() + 
                        "<br/>Untuk melihat pembayaran anda telah kami terima bisa lewat link dibawah ini<br/><a href=\"http://" + request.getServerName() + ":8080/rekening?param=" + mahasiswa.getUuid()+ 
                        "\">Klik disini untuk memasukan rekening</a>";
                helper.setText(htmlText,true);
                this.mailSender.send(mime);
                return modelAndView;

            } 
            catch (Exception e) {
                logger.error(e, e);
                if(e.getMessage().startsWith("Could not execute JDBC batch update;"))
                {
                    mahasiswa.setNoPendaftaran(mahasiswaService.
                            getDifferentNoPendaftaran(mahasiswa.getNoPendaftaran()));
                }
                else
                { 
                    throw new Exception(e.getCause());
                }
            }
        }while(10 >= count);
        
        modelAndView.addObject("noPendaftaran",
                mahasiswaService.getLastNoPendaftaran(simpleDateFormat.format(new Date())));
        modelAndView.addObject("validasi", "Server lagi sibuk,silakan coba beberapa saat lagi...");
        modelAndView.setViewName("registrasi");
        return modelAndView;
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
    
    public void sendMimeMessage(String from, String[] to, String subject, String msg) throws Exception{
        
    }
}
