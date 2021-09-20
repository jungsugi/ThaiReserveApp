package com.thai.reserveapp.service.customer.login;

import java.util.HashMap;
import java.util.List;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.thai.reserveapp.entity.login.User;


public interface LoginService{

	/* 로그인 시도시 Id와 Password 를 리턴해서 User정보를 가져온다. */
	public List<User> getLoginUser(String ID, String Password);

	/* 로그인한 유저Id로 User정보를 가져온다. */
	public User getLoginUserInfo(String ID);
	
	/* 사용자 정보 변경 */
	public int updateUserInfo(HashMap map);
	
}
