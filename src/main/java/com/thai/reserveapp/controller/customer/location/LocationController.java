package com.thai.reserveapp.controller.customer.location;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thai.reserveapp.entity.login.User;


@Controller
@RequestMapping("/customer/location/")
public class LocationController {

	@RequestMapping("mylocation")
	public String test() {
		System.out.println("location test");
		
		return "customer.location.mylocation";	//이렇게 되면 Json 형태
	}
	
	
	/* 내 위치변경 취소 */
	@RequestMapping("cancle_mylocation")
	public String cancle() {
		System.out.println("cancle_mylocation 호출");
		
		return "redirect:/customer/login/login_main";
	}
	
}
