<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

	<!-- 	<c:url value="spring_security_check" var="loginUrl" /> /customer/login/authenticate -->
	<form name="Loginform" method="post" action="" />
	
	
	<!-- 로그인 했을 경우 -->
	<sec:authorize access="isAuthenticated()">
       
       <sec:authentication property="principal" var="user" />
       <div> 로그인하였습니다. </div>
       <div> 반갑습니다.  ${user.getUserName()} 님! </div> <%-- (${user.authorities}) --%>
       
	</sec:authorize>

	<%-- 로그인시에 Spring Security에서 사용하는 csrf 토큰을 생성해서 보내준다. --%>
	<%-- <input type="hidden" th:name="${_csrf.parameterName}" th:value="${_csrf.token}" /> : 타임리프 방식 ! --%>
		
	 	<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
	    <img class="my-4 w-100 h-100" src="/assets/img/company1/thumnail.jpg" alt="">
	    
	    <sec:authorize access="isAnonymous()">
	    
	    <h1 class="h3 mb-3 fw-normal">Login</h1>
	
	    <div class="form-floating mb-2">
	      <input type="text" class="form-control" name="input_id" id="input_id" placeholder="ID">
	      <label for="floatingInput">ID</label>
	    </div>
	    <div class="form-floating mb-2">
	      <input type="password" class="form-control" name="input_password" id="input_password" placeholder="Password">
	      <label for="floatingPassword">Password</label>
	    </div>
		
	    <div class="checkbox mb-3">
	      <label>
	        <input type="checkbox" value="remember-me"> Remember me
	      </label>
	    </div>
	    
	    </sec:authorize>
	    
	    
	    <sec:authorize access="isAnonymous()">
	    
	    <div class="row mb-3">
	        <button class="w-100 btn btn-outline-success" type="submit" onclick="goSignInPage('login')" >로그인</button> <!-- style="background-color: #A2E1B8" -->
	    </div>
		
	    <div class="row mb-3">
	        <button class="w-100 btn btn-outline-success" type="submit" onclick="goSignInPage('signin')">회원가입</button> <!-- style="background-color: #C3EC42" -->
	    </div>
	    
	    </sec:authorize>
	    
	    
	    <sec:authorize access="isAuthenticated()">
	    
	    <div class="row mb-3 justify-content-center">
	        <button class="w-50 btn btn-outline-success" type="submit" onclick="goSignInPage('myinfo')">내 정보</button> <!-- style="background-color: #C3EC42" -->
	    </div>
	    
	    <div class="row mb-3 justify-content-center">
	       	<button class="w-50 btn btn-outline-success" type="submit" onclick="goSignInPage('logout')">로그아웃</button> <!-- style="background-color: #C3EC42" -->
	    </div>
	    
	    <%-- <sec:authentication property="principal" var="user" /> --%>	    
	    </sec:authorize>
	    
	    
	    <%-- 
	    <sec:authorize access="hasRole('ADMIN')">
	    	ADMIN 입니다.
	    </sec:authorize>	    
	   	<sec:authorize access="hasRole('MEMBER')">
	    	MEMBER 입니다. 
	    </sec:authorize>
	     --%>
	     
	    <c:if test="${param.error != null }">
			<p>${error_message}</p>
			<div class="row mb-3">
	        <button class="w-100 btn btn-outline-success" type="submit" onclick="goSignInPage('relogin')">재로그인</button> <!-- style="background-color: #C3EC42" -->
	    	</div>
		</c:if>
		
	    <p class="mt-5 mb-3 text-muted">Since 2021</p>
		
	</form>



<script>
	function goSignInPage(tag){
		var loginform = document.Loginform;
		
		if(tag == 'login'){	//로그인
			loginform.action = '/authenticate';
			//document.getElementById('Loginform').setAttribute('action','/login/loginmain');	
		}
		else if(tag == 'signin'){	//회원가입
			loginform.action = '/customer/login/signin';
			//document.getElementById('Loginform').setAttribute('action','/login/signin');
		}
		else if(tag == 'logout'){	//로그아웃
			loginform.action = '/customer/login/logout';
			//document.getElementById('Loginform').setAttribute('action','/login/signin');
		}
		else if(tag == 'relogin'){	//재로그인
			loginform.action = '/customer/login/login_main';
		}
		else if(tag == 'myinfo'){	//내정보
			loginform.action = '/customer/login/myinfo';
		}
		
		loginform.submit();
	}
	
</script>

