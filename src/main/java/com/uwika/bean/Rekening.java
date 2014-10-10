/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uwika.bean;

/**
 *
 * @author Steven Gunanto
 */
public class Rekening implements java.io.Serializable {
    private String noPendaftaran,noRekening, namaRekening;
    private Integer nominal;
    private Mahasiswa mahasiswa;

    public Rekening() {
    }

    public Rekening(String noPendaftaran, String noRekening, String namaRekening, Integer nominal, Mahasiswa mahasiswa) {
        this.noPendaftaran = noPendaftaran;
        this.noRekening = noRekening;
        this.namaRekening = namaRekening;
        this.nominal = nominal;
        this.mahasiswa = mahasiswa;
    }
    
    public String getNoPendaftaran() {
        return noPendaftaran;
    }

    public void setNoPendaftaran(String noPendaftaran) {
        this.noPendaftaran = noPendaftaran;
    }

    public Integer getNominal() {
        return nominal;
    }

    public void setNominal(Integer nominal) {
        this.nominal = nominal;
    }
    
    public Mahasiswa getMahasiswa() {
        return mahasiswa;
    }

    public void setMahasiswa(Mahasiswa mahasiswa) {
        this.mahasiswa = mahasiswa;
    }

    public String getNamaRekening() {
        return namaRekening;
    }

    public void setNamaRekening(String namaRekening) {
        this.namaRekening = namaRekening;
    }

    public String getNoRekening() {
        return noRekening;
    }

    public void setNoRekening(String noRekening) {
        this.noRekening = noRekening;
    }   

    @Override
    public String toString() {
        return noPendaftaran + " " + noRekening + " " + namaRekening + " " + nominal;
    }
    
    
}
