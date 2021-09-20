package com.thai.reserveapp.dao.customer.login;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.thai.reserveapp.entity.login.User;

@Mapper
public interface LoginDao {

	/*로그인 시에 User entity에 정보를 받아온다.*/
	/*@Select("Select * from User where user_id = #{login_id} and password = #{password}")*/
	List<User> getLoginUser(@Param("login_id") String login_id
							,@Param("password") String password);
	
	
	
	/*로그인 후 LoginId로 User의 내정보를 가져온다.*/
	User getLoginUserInfo(@Param("login_id") String login_id);
	
	/* 사용자 정보 update */
	int updateUserInfo(HashMap map);
}
