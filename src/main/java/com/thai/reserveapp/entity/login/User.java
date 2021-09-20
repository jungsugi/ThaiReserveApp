package com.thai.reserveapp.entity.login;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AccessLevel;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
 * Spring Security는 사용자 정보를 UserDetails라는 인터페이스 구현체로 사용한다. 즉, UserDetails는 사용자 정보 VO라고 생각하면 된다.
 * */
@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Data
@Table(name="user")
public class User{
	
	@Id
	private String userId;
	
	private String userName; 
	
	private String LoginID;
	
	private String password; 
	
	private String email;
	
	private String jumin_no;
	
	private String address_no;
	
	private String address_detail;
	
	private String sex;
	
	private String note;
	
	private String mod_date;
	
	private String create_date;
	
	private String auth;
	
	public User(String userId, String userName, String loginID, String password, String email, String jumin_no,
				String address_no, String address_detail, String sex, String note, String mod_date, String create_date, String auth) 
	{
		super();
		this.userId = userId;
		this.userName = userName;
		LoginID = loginID;
		this.password = password;
		this.email = email;
		this.jumin_no = jumin_no;
		this.address_no = address_no;
		this.address_detail = address_detail;
		this.sex = sex;
		this.note = note;
		this.mod_date = mod_date;
		this.create_date = create_date;
		this.auth = auth;
	}

}
