package com.thai.reserveapp.config.auth;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;

import com.thai.reserveapp.entity.login.User;
import com.thai.reserveapp.service.customer.login.LoginService;

@Component
public class UserAuthenticationProvider implements AuthenticationProvider {
 
    @Autowired
    LoginService loginService;
    
    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException{
    	System.out.println("인증시작!!");                                        
    	
        String id 		= (String) authentication.getName();
        String password = (String) authentication.getCredentials();
 
        List<User> userlist = loginService.getLoginUser(id, password);
        User user = null;
        String auth = null;
        
        if(!userlist.isEmpty()) {
        	user = userlist.get(0);
        	auth = user.getAuth();
        }
        
        if (user == null) {
        	System.out.println( id + "인증 실패 ! ");
            throw new BadCredentialsException("Login Error !!");
        }
       //user.setPassword(null);	//굳이 password를 메모리에 가지고 있을 필요가 없다고 ... 주석처리를 주로 한다고 함.
 
        ArrayList<SimpleGrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(auth));
        
        return new UsernamePasswordAuthenticationToken(user, password, authorities);
    }
    
    
    @Override
    public boolean supports(Class authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }

}