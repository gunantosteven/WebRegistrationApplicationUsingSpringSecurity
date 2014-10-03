/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uwika.bean;

import java.util.Date;

/**
 *
 * @author Steven Gunanto
 */
public class Mahasiswa implements java.io.Serializable {
   private String noPendaftaran,jurusan,nama,jenisKelamin,agama,alamat,noTelpon,email,tempatLahir;
   private Date tanggalLahir;

    public Mahasiswa() {
    }

    public Mahasiswa(String noPendaftaran, String jurusan, String nama, String jenisKelamin, String agama, String alamat, String noTelpon, String email, Date tanggalLahir) {
        this.noPendaftaran = noPendaftaran;
        this.jurusan = jurusan;
        this.nama = nama;
        this.jenisKelamin = jenisKelamin;
        this.agama = agama;
        this.alamat = alamat;
        this.noTelpon = noTelpon;
        this.email = email;
        this.tanggalLahir = tanggalLahir;
        this.tempatLahir = tempatLahir;
    }

    public String getAgama() {
        
        return agama;
    }

    public void setAgama(String agama) {
        this.agama = agama;
    }

    public String getAlamat() {
        return alamat;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getJenisKelamin() {
        return jenisKelamin;
    }

    public void setJenisKelamin(String jenisKelamin) {
        this.jenisKelamin = jenisKelamin;
    }

    public String getJurusan() {
        return jurusan;
    }

    public void setJurusan(String jurusan) {
        this.jurusan = jurusan;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getNoPendaftaran() {
        return noPendaftaran;
    }

    public void setNoPendaftaran(String noPendaftaran) {
        this.noPendaftaran = noPendaftaran;
    }

    public String getNoTelpon() {
        return noTelpon;
    }

    public void setNoTelpon(String noTelpon) {
        this.noTelpon = noTelpon;
    }

    public Date getTanggalLahir() {
        return tanggalLahir;
    }

    public void setTanggalLahir(Date tanggalLahir) {
        this.tanggalLahir = tanggalLahir;
    }

    public String getTempatLahir() {
        return tempatLahir;
    }

    public void setTempatLahir(String tempatLahir) {
        this.tempatLahir = tempatLahir;
    }
}
