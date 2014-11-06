/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uwika.service;

import com.uwika.bean.Rekening;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Steven Gunanto
 */
@Service("rekeningService")
@Transactional
public class RekeningService extends BaseService {

    @Override
    public void saveOrUpdate(Object o) throws Exception {
        sessionFactory.getCurrentSession().saveOrUpdate(o);
    }

    @Override
    public List<String[]> select(int start, int end, String orderby, String search) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object select(String id) {
        return (Rekening) sessionFactory.getCurrentSession()
                .createQuery("from Rekening where noPendaftaran = :noPendaftaran")
                .setString("noPendaftaran", id)
                .uniqueResult();
    }

    @Override
    public void delete(Object o) throws Exception {
        sessionFactory.getCurrentSession()
                .createQuery("DELETE FROM Rekening where noPendaftaran = :noPendaftaran")
                .setString("noPendaftaran", o.toString())
                .executeUpdate();
    }

    @Override
    public long getSize(String search) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    public void update(Rekening rekening)
    {
        sessionFactory.getCurrentSession()
                .createQuery("UPDATE Rekening r set r.noRekening = :noRekening AND r.namaRekening = :namaRekening AND r.nominal = :nominal where r.noPendaftaran = :noPendaftaran")
                .setString("noRekening", rekening.getNoRekening())
                .setString("namaRekening", rekening.getNamaRekening())
                .setInteger("nominal", rekening.getNominal())
                .setString("noPendaftaran", rekening.getNoPendaftaran()).executeUpdate();
                
    }
    
}
