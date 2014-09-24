/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uwika.service;

import com.uwika.bean.Kuliah;
import com.uwika.bean.KuliahId;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Steven Gunanto
 */
@Service("kuliahService")
@Transactional
public class KuliahService extends BaseService {
    
    @Override
    public void saveOrUpdate(Object o) throws Exception {
        sessionFactory.getCurrentSession().saveOrUpdate(o);
    } 

    @Override
    public List<String[]> select(int start, int end, String orderby, String search) {
        StringBuilder stringBuilder = new StringBuilder("from Kuliah k where k.id.namamatakuliah like :search");
        if(!search.equals("%"))
            search = "%"+search+"%";
        
        if(orderby != null)
            stringBuilder.append(" order by id ").append(orderby);
        
        List<Kuliah> kuliahs = sessionFactory.getCurrentSession().createQuery(stringBuilder.toString())
                .setString("search", search)
                .setFirstResult(start)
                .setMaxResults(end)
                .list();
        
        List<String[]> strings = new ArrayList<String[]> ();
        for (Kuliah kuliah : kuliahs) {
            String[] ses = new String[5];
            ses[0] = kuliah.getId().getId() + "";
            ses[1] = kuliah.getId().getNamamatakuliah();
            ses[2] = kuliah.getId().getNik();
            ses[3] = kuliah.getId().getNim();
            strings.add(ses);
        }
        return strings;
    }

    @Override
    public Object select(String id) {
        return (Kuliah) sessionFactory.getCurrentSession()
                .createQuery("from Kuliah where id.id = :id")
                .setString("id", id)
                .uniqueResult();
    }

    @Override
    public void delete(Object o) throws Exception {
        sessionFactory.getCurrentSession()
                .createQuery("DELETE FROM Kuliah where id.id = :id")
                .setString("id", o.toString())
                .executeUpdate();
    }

    @Override
    public long getSize(String search) {
        StringBuilder stringBuilder = new StringBuilder("SELECT COUNT(k.id.id) FROM Kuliah k where k.id.namamatakuliah like :search");
        if(!search.equals("%"))
            search = "%"+search+"%";
        return (Long) sessionFactory.getCurrentSession().createQuery(stringBuilder.toString())
                .setString("search", search)
                .uniqueResult();
    }
}
