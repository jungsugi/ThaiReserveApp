package com.thai.reserveapp.controller.home;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//import com.homethai.web.service.home.HomeService;


@Controller
@RequestMapping("/")
public class HomeController{

	@GetMapping("test")
	public String test(Model model) {
		System.out.print("test success!!12312313");
		
		model.addAttribute("test", "dev tools123121");
		
		return "test";	//view Resolver에 의해 /WEB-INF/view/test.jsp 요청의 효과가 있다.
	}
	
	@RequestMapping("index")
	public String home(Model model) {
		//System.out.print("index");
		
		/*
		 * List<User> lists = homeservice.getUserList();
		 * 
		 * for(int i=0 ; i<lists.size(); i++) { System.out.println(lists.get(i)); }
		 */
		
		//home/mainlist/list 			//ResourceViewResolver
		return "home.mainlist.list";	//Tiles ViewResolver
	}
	
	
	/*
	 * @Override public ModelAndView handleRequest(HttpServletRequest request,
	 * HttpServletResponse response) throws Exception {
	 * 
	 * ModelAndView mv = new ModelAndView();
	 * //mv.addObject("data","Hello Spring MVC !! HAHA!!");
	 * mv.setViewName("root.index"); //mv.setViewName("/WEB-INF/view/index.jsp");
	 * 
	 * try {
	 * 
	 * List<Object> list = homeservice.getUserList(); mv.addObject("list", list); }
	 * catch(Exception e){ e.printStackTrace(); }
	 * 
	 * 
	 * return mv; }
	 */


	
}
