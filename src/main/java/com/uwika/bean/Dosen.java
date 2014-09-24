package com.uwika.bean;
// Generated Nov 3, 2013 3:58:13 AM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Dosen generated by hbm2java
 */
public class Dosen implements java.io.Serializable {


     private String nik;
     private String nama;
     private String alamat;
     private Set kuliahs = new HashSet(0);

    public Dosen() {
    }

	
    public Dosen(String nik) {
        this.nik = nik;
    }
    public Dosen(String nik, String nama, String alamat, Set kuliahs) {
       this.nik = nik;
       this.nama = nama;
       this.alamat = alamat;
       this.kuliahs = kuliahs;
    }
   
    public String getNik() {
        return this.nik;
    }
    
    public void setNik(String nik) {
        this.nik = nik;
    }
    public String getNama() {
        return this.nama;
    }
    
    public void setNama(String nama) {
        this.nama = nama;
    }
    public String getAlamat() {
        return this.alamat;
    }
    
    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }
    public Set getKuliahs() {
        return this.kuliahs;
    }
    
    public void setKuliahs(Set kuliahs) {
        this.kuliahs = kuliahs;
    }




}


