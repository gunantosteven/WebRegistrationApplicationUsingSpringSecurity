/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uwika.service;

import com.uwika.bean.UserRole;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Steven Gunanto
 */
@Service("myUserDetailsService") 
@Transactional(readOnly=true)
public class MyUserDetailsService extends BaseService implements UserDetailsService {

    @Override
    public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {
        
        com.uwika.bean.User user = (com.uwika.bean.User) select(username);
        List<GrantedAuthority> authorities = buildUserAuthority(user.getUserRole());
        
        return buildUserForAuthentication(user, authorities);
    }
    
    // Converts com.uwika.bean.User user to
    // org.springframework.security.core.userdetails.User
    private User buildUserForAuthentication(com.uwika.bean.User user, 
            List<GrantedAuthority> authorities) {
            return new User(user.getUsername(), 
                    user.getPassword(), user.isEnabled(), 
                    true, true, true, authorities);
    }
    
    private List<GrantedAuthority> buildUserAuthority(Set<UserRole> userRoles) {
 
		Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();
 
		// Build user's authorities
		for (UserRole userRole : userRoles) {
			setAuths.add(new SimpleGrantedAuthority(userRole.getRole()));
		}
 
		List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);
 
		return Result;
    }

    @Override
    public void saveOrUpdate(Object o) throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public List<String[]> select(int start, int end, String orderby, String search) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object select(String id) {
        return (com.uwika.bean.User) sessionFactory.getCurrentSession()
                .createQuery("from User where username = :username")
                .setString("username", id)
                .uniqueResult();
    }

    @Override
    public void delete(Object o) throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public long getSize(String search) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}
