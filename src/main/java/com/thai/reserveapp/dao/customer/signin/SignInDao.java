package com.thai.reserveapp.dao.customer.signin;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.homethai.web.entity.login.User;

@Mapper
public interface SignInDao {

//	@Select("select count(1) as cnt from User where LoginId = #{ID}")
//	public int ConfirmId(@Param("ID") String id);
//	
//	
//	@Select("select count(1) as cnt from User where jumin_no = #{jumin_no}")
//	public int ConfirmJumin(@Param("jumin_no") String jumin_no);
//
//	
//	@Insert( "INSERT INTO User(userName, LoginId, password, jumin_no, address_no, address_detail, sex, note, email)\n"
//			+"VALUES (#{userName}, #{LoginId}, #{password}, #{jumin_no}, #{address_no}, #{address_detail}, #{sex}, #{note}, #{email})")
//	public int SignIn(HashMap map);
	
	public List<User> getUser(@Param("ID") String id);
	
	public int ConfirmId(@Param("ID") String id);

	public int ConfirmJumin(@Param("jumin_no") String jumin_no);
	
	public int SignIn(HashMap map);
	

}
