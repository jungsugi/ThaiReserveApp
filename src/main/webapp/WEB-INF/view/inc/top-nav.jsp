<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<div class="offcanvas offcanvas-start bg-light" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel" style="width:70%;">
	
	<div class="offcanvas-header">
		<h5 class="offcanvas-title" id="offcanvasExampleLabel">Menu</h5>
		<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
	</div>




	<div class="offcanvas-body">
		<div class="d-flex flex-column flex-shrink-0 p-1 bg-light">
			<!-- <a href="/"
				class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
				<svg class="bi me-2" width="40" height="32">
					<use xlink:href="#bootstrap" /></svg> <span class="fs-4">Sidebar</span>
			</a>
			 -->
			<hr>
			<ul class="nav nav-pills flex-column mb-auto my-2">
				<li class="nav-item">
					<a href="/index" class="nav-link active" aria-current="page" style="font-size: 0.9rem;">  
						<svg class="bi me-2" width="16" height="16">
							<use xlink:href="#home" />
						</svg> Home
					</a>
				</li>
				
				<li class="nav-item">
					<a href="/admin/home/signupen" class="nav-link link-dark" style="font-size: 0.9rem;"> 
						<svg class="bi me-2" width="16" height="16">
							<use xlink:href="#speedometer2" />
						</svg> 회원가입예시
					</a>
				</li>
				
				<li class="nav-item"> 
					<a href="#" class="nav-link link-dark" style="font-size: 0.9rem;">  
						<svg class="bi me-2" width="16" height="16">
							<use xlink:href="#table" />
						</svg> Orders
					</a>
				</li>
				
				<li class="nav-item">
					<a href="#" class="nav-link link-dark" style="font-size: 0.9rem;"> 
						<svg class="bi me-2" width="16" height="16">
							<use xlink:href="#grid" />
						</svg> Products
					</a>
				</li>
				
				<li class="nav-item">
					<a href="/customer/login/login_main" class="nav-link link-dark" style="font-size: 0.9rem;">
						<svg class="bi me-2" width="16" height="16">
							<use xlink:href="#people-circle" />
						</svg> 로그인
					</a>
				</li>
			</ul>
			<hr>
			<div class="dropdown">
				
				<c:set var="dropdown_flag" value="" />
				<c:set var="dropdown_YN" value="" />
				<sec:authorize access="isAuthenticated()">
					<c:set var="dropdown_flag" value= "dropdownUser2" />
					<c:set var="dropdown_YN" value="dropdown" />
				</sec:authorize>
				
				<a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle" id="${dropdown_flag}" data-bs-toggle="${dropdown_YN}" aria-expanded="false">
					<!-- <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2"> --> 
					
					<sec:authorize access="isAnonymous()">
						<strong>로그인 해주세요.</strong>
					</sec:authorize>
					
					
					<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal" var="user" />
       					<strong> ${user.getUserName()} 님! </strong> <%-- (${user.authorities}) --%>
					</sec:authorize>
					
				</a>
				
				
				<ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2">
				<sec:authorize access="isAuthenticated()">
					<li><a class="dropdown-item" href="#"> 최근사용목록 </a></li>
					<li><a class="dropdown-item" href="/customer/location/mylocation"> 내 위치 </a></li>
					<li><a class="dropdown-item" href="#"> 내 정보 </a></li>
					<li><hr class="dropdown-divider"></li>
					<li><a class="dropdown-item" href="#">로그아웃</a></li>
				</sec:authorize>
				</ul>
				
			</div>
		</div>
	</div>
	
</div>
		