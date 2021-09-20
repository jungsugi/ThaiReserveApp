package com.thai.reserveapp.service.customer.login;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.thai.reserveapp.*;
import com.thai.reserveapp.dao.customer.login.LoginDao;
import com.thai.reserveapp.entity.login.User;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class LoginServiceImp implements LoginService{

	@Autowired
	private LoginDao logindao;
	
	@Override
	public List<User> getLoginUser(String ID, String Password) {
		String login_id = ID;
		String password = Password;
		
		List<User> user = logindao.getLoginUser(login_id,password);
		
		
		return user;
	}

	@Override
	public User getLoginUserInfo(String ID){
		String login_id = ID;
		
		User user = logindao.getLoginUserInfo(login_id);
		
		return user;
	}
	
	
	
	@Override
	public int updateUserInfo(HashMap map) {
		
		int result = logindao.updateUserInfo(map);
				
		return result;
	}
	

	

}
