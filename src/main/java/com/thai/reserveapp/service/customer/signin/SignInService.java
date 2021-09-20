package com.thai.reserveapp.service.customer.signin;

import org.springframework.web.bind.annotation.RequestParam;

public interface SignInService {

	public boolean ConfirmId(String id) throws Exception;
	
	public boolean ConfirmJumin(String jumin_num) throws Exception;
	
	public boolean SignInConfirm( String name,
								  String jumin,
								  String email,	
								  String id,
								  String password,
								  String roadFullAddr,
								  String addrDetail,
								  String sex,
								  String auth
								) throws Exception;
	

}
