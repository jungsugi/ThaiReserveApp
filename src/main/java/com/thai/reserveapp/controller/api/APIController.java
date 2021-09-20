package com.thai.reserveapp.controller.api;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.thai.reserveapp.entity.login.User;
import com.thai.reserveapp.service.home.HomeService;

/*@Controller라 하면, 기본적으로 문서를 반환하는 Class가 된다.
 * 하지만 RestController라 하면, 출력되는 값 자체가 RESTful 형태의 값을 반환하는 Class가 된다.
 * */
 
@RestController("APIController")
@RequestMapping("/api/home/")
public class APIController {

	@Autowired
	private HomeService homeservice;
	
	/*
	 * @RestController를 보고 IOC에 HomeContrller를 담는데, 내부적으로 HomeController class라면,
	 * HomeController homeController = new HomeController(); 로 "homeController" 를
	 * Key 값으로 IOC에 담게 된다. 이를 bean 으로 표시하면,
	 * 
	 * <bean id="homeController" class="~.~.~HomeController"> 로 표현할 수 있다. 하지만 이
	 * homeContror가 겹치는 것! 그래서 @RestController("apiHomeController") 이용해 묵시적으로
	 * servlet의 id를 바꿔준다.
	 */
	@RequestMapping("list") 
	public User list(@RequestParam(name="p", defaultValue="1") String page) {
		
		List<User> list = homeservice.getUserList(); 	
				
		if(page != null) {
			String p = page;
			System.out.println("p : " + p );
			int temp = Integer.parseInt(p); 
			return list.get(temp);
		}
	  
		return list.get(1);
	}
	/*
	 * @RestController 어노테이션 덕분에 반환되는 값이 페이지가 아닌 reponse객체안에 "값" 이 된다. 이를 만약 '객체' 를
	 * 리턴한다면, Spring은 알아서 JSON으로 처리해 Client에게 보여주게 된다. -필수 jackson jar가 pom.xml 에 추가
	 * 되어있어야 한다.
	 */
	
	@RequestMapping("list2") 
	public User list2(String p) {
		List<User> list = homeservice.getUserList(); 

				
		if( p != null) {
			String pp = p;
			System.out.println("p : " + p );
			int temp = Integer.parseInt(p); 
			return list.get(temp);
		}
	  
		return list.get(1);
	}
	

}
