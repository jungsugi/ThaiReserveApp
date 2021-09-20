package com.thai.reserveapp.controller.customer.signin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thai.reserveapp.service.customer.signin.SignInService;


@Controller
@RequestMapping("/customer/signin/")
public class SignInController {
	
	@Autowired
	private SignInService signservice;
	
	@RequestMapping("idconfirm")
	@ResponseBody
	public String getIdConfimReuslt(@RequestParam(name="sendid" , defaultValue="null") String id) throws Exception{		
		String answer="";
		
		if(id.equals("null") || id == null) {
			return "null";
		}
		
		try {
			boolean result = signservice.ConfirmId(id);
			//System.out.println(result);
			
			if(result) {
				answer = "true";
			}
			else {
				answer = "false";
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}		
		return answer;
	}
	
	
	@RequestMapping("Jumin_confirm")
	@ResponseBody
	public String ConfirmJumin(@RequestParam(name="jumin_val" , defaultValue="null") String jumin_val) throws Exception{		
		String answer="";
		
		if(jumin_val.equals("null") || jumin_val == null) {
			return "null";
		}
		
		try {
			boolean result = signservice.ConfirmJumin(jumin_val);

			if(result) {
				answer = "true";
			}
			else {
				answer = "false";
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}		
		return answer;
	}
	

	@PostMapping("SignIn")
	public String SignInUser(@RequestParam(name="Name" , defaultValue="null") String name,
							  @RequestParam(name="jumin1" , defaultValue="null") String jumin1,
							  @RequestParam(name="jumin2" , defaultValue="null") String jumin2,	
							  @RequestParam(name="Email" , defaultValue="null") String email,	
							  @RequestParam(name="id" , defaultValue="null") String id,
							  @RequestParam(name="password" , defaultValue="null") String password,
							  @RequestParam(name="roadFullAddr" , defaultValue="null") String roadFullAddr,
							  @RequestParam(name="addrDetail" , defaultValue="null") String addrDetail,
							  @RequestParam(name="sex" , defaultValue="null") String sex
							 ) throws Exception{
		
		String jumin = jumin1.concat(jumin2);			
		
		String auth="MEMBER";	//회원가입은 무조건 MEMBER
		
		boolean result = signservice.SignInConfirm(name,jumin,email,id,password,roadFullAddr, addrDetail, sex, auth);
		
		return "customer.login.signin_complete";
	}
	
	@RequestMapping("test")
	public String test() throws Exception{
		
		return "customer.login.signup";
		
	}
	
	
}
