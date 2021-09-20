package com.thai.reserveapp.controller.api.address;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/api/address/")
public class AddressController {

	@RequestMapping("popup_page")
	public String PopupPage() {
		
		System.out.println("popup_page ȣ�� ! ");
		
		return "api/address/address_form";		//Tiles �ƴ�.
	}
	
	
	@RequestMapping("jusoPopup")
	public String jusoPopup(HttpServletRequest request) {
		
		System.out.println("jusoPopup ȣ�� ! ");
		
		return "api/address/jusoPopup";		//Tiles �ƴ�.
	}
	
	
}
