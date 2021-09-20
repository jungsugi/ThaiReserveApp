package com.thai.reserveapp.service.customer.signin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.HashMap;

import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thai.reserveapp.dao.customer.signin.SignInDao;

@Service
public class SignInServiceImp implements SignInService {
	  
	@Autowired
	SignInDao signindao;
	 
	/*	Id 중복체크 */
	@Override 
	public boolean ConfirmId(String id) throws Exception{ 
		int cnt = 0;
		try {
			cnt = signindao.ConfirmId(id);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(cnt > 0) {
				return false;
			}
			else {
				return true;
			}
		}
	}
	

	/*주민등록번호 중복 체크*/
	@Override
	public boolean ConfirmJumin(String jumin_num) throws Exception {
		int cnt = 0;
		try {
			cnt = signindao.ConfirmJumin(jumin_num); //동일 주민등록번호 개수
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {

			if(cnt > 0) {
				return false;
			}
			else {
				return true;
			}
		}
	}

	/*회원가입*/
	@Override
	public boolean SignInConfirm(String name, String jumin, String email, String id, String password,
			String roadFullAddr, String addrDetail, String sex, String auth) throws Exception {

		int result = 0;
		
		try {
			StringBuffer sql = new StringBuffer();
			
			HashMap<String, String> datamap = new HashMap();
			
			datamap.put("userName", name);
			datamap.put("jumin_no", jumin);
			datamap.put("email", email);
			datamap.put("LoginId", id);
			datamap.put("password", password);
			datamap.put("address_no", roadFullAddr);
			datamap.put("address_detail", addrDetail);
			datamap.put("sex", sex);
			datamap.put("auth", auth);
			
			result = signindao.SignIn(datamap);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(result > 0) {
				return true;
			}
			else {
				return false;
			}
		}
		
	}
}