package com.thai.reserveapp.config.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Description;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.thai.reserveapp.service.customer.login.LoginService;

import lombok.AllArgsConstructor;


@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	
	@Autowired
	UserAuthenticationProvider authenticationProvider;	

	
	@Autowired
	CustomAuthenticationFailureHandler customAuthenticationFailureHandler;

	
	/*DB에 password를 암호화해서 적재하기 위해 다른곳에서 사용하기 위해 Bean으로 등록 해 준다.*/
//	@Bean
//	public PasswordEncoder passwordEncoder() {
//		return new BCryptPasswordEncoder();
//	}
	
	/*
	 * 인증을 무시하기 위한 설정 
	 * WebSecurity는 FilterChainProxy를 생성하는 필터로서 ignore()을 사용하여 Spring Security가 무시할 수 있도록 설정할 수 있다.
	 * 파일의 기준경로는 resources/static
	 * */
	@Override
	public void configure(WebSecurity web) throws Exception{
		//web.ignoring().antMatchers("/**");	//이거 설정하는 순간 모든 경로에서 패킷을 Intercept를 안하므로 아래서 설정한 정보는 전부 망가진다..
	}
	
	/**
	 * 규칙 설정
	 * @param http
	 * @throws Exception
	 * 이 메소드는 HttpSecurity 객체를 이용해 각 요청을 먼저 intercept하여 URL별 인증 여부, login 처리, logout아웃 처리등 다양한 처리를 할 수 있다.
	 * authorizeRequests(), formLogin(), logout(), exceptionHandling() 등 메소드를 이용해서 로그인에 대한 설정을 해준다.
	 */
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		System.out.println("spring security 초기화 ! ");
		try {
    	    http.authorizeRequests()
    	    		.antMatchers("/static/**","/customer/**","/home/**").permitAll()	//누구나 허용가능
    	    		.antMatchers("/**").permitAll() //.hasRole("MEMBER") // USER, ADMIN만 접근 가능
    	    		.antMatchers("/admin/**").permitAll() //.hasRole("ADMIN")	//ADMIN만 접근 가능
    	    		.anyRequest().authenticated(); // 나머지 요청들은 권한의 종류에 상관 없이 권한이 있어야 접근 가능

    	    /* 로그인 성공 시 */
    	    http.formLogin()
    	    		.loginPage("/customer/login/login_main")	//커스텀 로그인페이지를 사용
    	    		.loginProcessingUrl("/authenticate")
    	    		//.failureUrl("/loginForm?error")	// default : /login?error
    	    		.failureHandler(customAuthenticationFailureHandler)
    	    		.defaultSuccessUrl("/customer/login/login_success")		//로그인 성공시 리다이렉트로 이동할 페이지
    	    		.usernameParameter("input_id")  //form 태그안에 id로 받을 태그의 name
    	    		.passwordParameter("input_password")			//form 태그안에 password로 받을 태그의 name
    	    		.permitAll();
    	    
    	    
    	    /* 로그아웃 성공 시 */
    	    http.logout()
    	    		.logoutRequestMatcher(new AntPathRequestMatcher("/customer/login/logout"))
    	    		.logoutSuccessUrl("/customer/login/logout_complete")
    	    		.invalidateHttpSession(true)	//세션초기화
    	    		.permitAll();
    	    
    	    http.authenticationProvider(authenticationProvider);	//로그인 처리가 진행될 provider
    	                                
    	    http.csrf().disable();
    	    
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
    	    
    	    System.out.println("spring security 초기화 완료!!! ");
    	    //.exceptionHandling();
	}

//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//    	    http.authorizeRequests()
//    	    		.antMatchers("/**").permitAll()	//누구나 허용가능
//    	    		.antMatchers("/**").permitAll() // 모두 접근가능
//    	    		.anyRequest().authenticated(); // 나머지 요청들은 권한의 종류에 상관 없이 권한이 있어야 접근 가능
//    	    	
//    	    http.formLogin().permitAll();
//    	    
//    	    http.logout().permitAll();
//	}
	
	/**
	 * 로그인 인증 처리 메소드 (로그인 처리를 위한 AuthenticationManagerBuilder 를 설정)
	 * @param auth
	 * @throws Exception
	 * @Description : AuthenticationManagerBuilder 는 Spring Security의 모든 인증을 관리하는 AuthenticationManager를 생성하는 클래스로 UserDetailService 를 통해서
	 * 유저의 정보를 loginservice 에 찾아준다. 
	 * 그리고 패스워드는 앞으로 Bean 으로 등록한 passwordEncoder() 를 사용하겠다고 선언한다.
	 */
	@Override
	public void configure(AuthenticationManagerBuilder auth) throws Exception {
		//auth.userDetailsService(loginservice).passwordEncoder(new BCryptPasswordEncoder());
		
		auth.authenticationProvider(authenticationProvider);
		
	}
	
	
	/* 테스트 로그인 시도 시 권한을 줄 유저를 메모리에 저장 
	 * http://localhost:8090/login  에 들어가보면 테스트 할 수 있다.
	 * */
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception{
//		auth.inMemoryAuthentication().withUser("admin").password("014025").roles("ADMIN");
//		.withUser("super_user").password(passwordEncoder().encode("014025")).roles("MEMBER")
//		.and()
		
	}
	
}
