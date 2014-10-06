/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uwika.service;

import com.uwika.bean.Mahasiswa;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Steven Gunanto
 */
@Service("mahasiswaService")
@Transactional
public class MahasiswaService extends BaseService {
    
    @Override
    public void saveOrUpdate(Object o) throws Exception {
        sessionFactory.getCurrentSession().saveOrUpdate(o);
    }
    
    public void save(Object o) throws Exception {
        sessionFactory.getCurrentSession().save(o);
    }
    
    public String getLastNoPendaftaran(String tahun)
    {
        List<Mahasiswa> listMahasiswa = (ArrayList<Mahasiswa>) sessionFactory.getCurrentSession().createQuery("from Mahasiswa m where SUBSTRING(m.noPendaftaran,1,4) = :tahun order by cast(m.noPendaftaran as int)")
                .setParameter("tahun", tahun).list();
        if (listMahasiswa != null && !listMahasiswa.isEmpty()) {
            return tahun + "" + (Integer.parseInt(listMahasiswa.get(listMahasiswa.size() - 1).
                    getNoPendaftaran().substring(4)) + 1);
        }
        else
        {
           return tahun + "1"; 
        }
    }
    
    public String getDifferentNoPendaftaran(String noPendaftaran)
    {
        boolean check = true;
        int tahun = Integer.parseInt(noPendaftaran.substring(0, 4));
        int noDaftar = Integer.parseInt(noPendaftaran.substring(4));
        do
        {
            Long no = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Mahasiswa m where m.noPendaftaran = :noPendaftaran")
                    .setParameter("noPendaftaran", tahun + "" + noDaftar)
                    .uniqueResult();
            if(no == 0)
            {
                noPendaftaran = tahun + "" + noDaftar;
                check = false;
            }
            else
                noDaftar++;
        }
        while(check);
        
        return noPendaftaran;
    }

    @Override
    public List<String[]> select(int start, int end, String orderby, String search) {
        StringBuilder stringBuilder = new StringBuilder("from Mahasiswa m where m.nama like :search");
        if(!search.equals("%"))
            search = "%"+search+"%";
        
        if(orderby != null)
            stringBuilder.append(" order by noPendaftaran ").append(orderby);
        
        List<Mahasiswa> mahasiswas = sessionFactory.getCurrentSession().createQuery(stringBuilder.toString())
                .setString("search", search)
                .setFirstResult(start)
                .setMaxResults(end)
                .list();
        
        List<String[]> strings = new ArrayList<String[]>();
        for (Mahasiswa mahasiswa : mahasiswas) {
            String[] ses = new String[4];
            ses[0] = mahasiswa.getNoPendaftaran();
            ses[1] = mahasiswa.getJurusan();
            ses[2] = mahasiswa.getNama();
            
            strings.add(ses);
        }
        return strings;
    }

    public List<Mahasiswa> get(String id)
    {
        return (List<Mahasiswa>) sessionFactory.getCurrentSession()
                .createQuery("from Mahasiswa m where m.noPendaftaran = :noPendaftaran")
                .setParameter("noPendaftaran", id).list();
    }
    
    public List<Mahasiswa> getList()
    {
        return (List<Mahasiswa>) sessionFactory.getCurrentSession()
                .createQuery("from Mahasiswa").list();
    }
    
    @Override
    public Object select(String id) {
        return (Mahasiswa) sessionFactory.getCurrentSession()
                .createQuery("from Mahasiswa where noPendaftaran = :noPendaftaran")
                .setString("noPendaftaran", id)
                .uniqueResult();
    }

    @Override
    public void delete(Object o) throws Exception {
        sessionFactory.getCurrentSession()
                .createQuery("DELETE FROM Mahasiswa where noPendaftaran = :noPendaftaran")
                .setString("noPendaftaran", o.toString())
                .executeUpdate();
    }

    @Override
    public long getSize(String search) {
        StringBuilder stringBuilder = new StringBuilder("SELECT COUNT(m) FROM Mahasiswa m where m.nama like :search");
        if(!search.equals("%"))
            search = "%"+search+"%";
        return (Long) sessionFactory.getCurrentSession().createQuery(stringBuilder.toString())
                .setString("search", search)
                .uniqueResult();
    }
    
    
}
