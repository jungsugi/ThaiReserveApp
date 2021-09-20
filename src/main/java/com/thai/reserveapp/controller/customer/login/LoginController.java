package com.thai.reserveapp.controller.customer.login;

import java.util.HashMap;
import java.util.List;

import org.apache.tomcat.util.codec.binary.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.thai.reserveapp.config.utils.StringUtil;
import com.thai.reserveapp.entity.login.User;
import com.thai.reserveapp.service.customer.login.LoginService;

@Controller
@RequestMapping("/customer/login/")
public class LoginController{

	@Autowired 
	LoginService loginservice;
	
	//localhost:8090/customer/login/test
	@RequestMapping("test")
	@ResponseBody
	public User test() {
		System.out.println("test");
		List<User> userlist = loginservice.getLoginUser("sooyoung1991", "014025tndud");
		
		User user = userlist.get(0);
		
		return user;	//이렇게 되면 Json 형태
	}
	
	@RequestMapping("login_main")
	public String login_main() {
		
		System.out.println("로그인 메인 호출 ");
		
		return "customer.login.login_main";
	}
	
	
	/*로그인 성공 시*/
	@RequestMapping("login_success")
	public String login_success() {
		
		System.out.println("Login Success");
		
		return "redirect:/customer/login/login_main";
	}
	
	
	@RequestMapping("signin")
	public String signin() {
		System.out.println("회원가입 페이지 호출 ! !");
		
		return "customer.login.signup";
	}
	

	/* 로그인/password 입력 후 '로그인' 시도 */
	@RequestMapping("login_confrim")
	public String login_confrim(@RequestParam(name="input_id", defaultValue = "null" ) String ID,
								@RequestParam(name="input_password" , defaultValue = "null" ) String Password) {	
		System.out.println("로그인 요청 전..");
		
		String id = ID;
		String password = Password;
		
		//User user = loginservice.getLoginConfirm(id, password);
		
		//System.out.println("로그인 요청 ! " + user.toString());
		
		return "customer.login.login_main";
	}
	
	
	/* 내 정보 변경 */
	@RequestMapping("myinfo")
	public ModelAndView myinfo() throws Exception{
		
		try {
			
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
			User user = (User) principal;
			
			System.out.println("userId : " + user.getLoginID());
			
			ModelAndView mv = new ModelAndView("customer.login.myinfo");
			HashMap map = new HashMap();
			
			/* User 엔티티를 이용하지 않고 DB에서 가져와야 변경 후에도 바뀐 User정보를 가져올 수 있다.*/
			user = loginservice.getLoginUserInfo(user.getLoginID());
					
			String jumin_no = StringUtil.nvl(user.getJumin_no());
			String jumin_front = "";
			String jumin_end = "";
			
			if(!jumin_no.equals("") && jumin_no.length() > 6) {
				jumin_front = jumin_no.substring(0,6);
				jumin_end = jumin_no.substring(7);
			}
			map.put("username", StringUtil.nvl(user.getUserName()));
			map.put("address_detail", StringUtil.nvl(user.getAddress_detail()));
			map.put("address_no", StringUtil.nvl(user.getAddress_no()));
			map.put("email", StringUtil.nvl(user.getEmail()));
			map.put("jumin_no_front", jumin_front);
			map.put("jumin_no_end", jumin_end);
			map.put("password", StringUtil.nvl(user.getPassword()));
			map.put("userid", StringUtil.nvl(user.getLoginID()));
			
			mv.addObject("user",map);
			
			return mv;
		}
		catch(Exception E) {
			throw E;
		}
	}
	
	
	
	@RequestMapping("logout_complete")
	public String test2(@RequestParam(name="input_id", defaultValue = "null" ) String ID,
					    @RequestParam(name="input_password" , defaultValue = "null" ) String Password) {

		System.out.println("로그아웃요청 완료 ! ");	
	
		return "redirect:/customer/login/login_main";
	}
	
	/* User 정보 변경 */
	@RequestMapping("change_userinfo")
	public String change_userinfo(@RequestParam(name="Email" , defaultValue="null") String email,	
								  @RequestParam(name="password" , defaultValue="null") String password,
								  @RequestParam(name="roadFullAddr" , defaultValue="null") String roadFullAddr,
								  @RequestParam(name="addrDetail" , defaultValue="null") String addrDetail,
								  @RequestParam(name="id" , defaultValue="null") String id
								 ) throws Exception{
		
		HashMap map = new HashMap();
		map.put("email", email);
		map.put("login_id", id);
		map.put("password", password);
		map.put("roadFullAddr", roadFullAddr);
		map.put("addrDetail", addrDetail);
		
		
		System.out.println("change_userinfo 호출!");
		
		loginservice.updateUserInfo(map);
		
		
		return "redirect:/customer/login/login_main";
	}

	
}
