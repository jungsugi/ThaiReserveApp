<%@ page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
	HashMap user = (HashMap)request.getAttribute("user");	//User정보
%>

<div class="py-5 text-center">
	<h2>내 정보</h2>
<!-- 	<p class="lead">아래 정보를 작성해주세요.</p> -->
</div>

<div class="row">

	<div class="col-12">
		<form class="needs-validation" novalidate="" id="UserInfo" name="UserInfo" action="/customer/login/change_userinfo" method="POST">
			<h4 class="mb-3">성함</h4>
			<div class="row g-3">
				<div class="col-sm-6">
					<label for="firstName" class="form-label">이름 (Name)</label>
					<input type="text" class="form-control" id="Name" name="Name" placeholder="" value="<%=user.get("username")%>" required="" readonly>
					<div class="invalid-feedback">필수 입력란 입니다.</div>
				</div>
				
				<div class="col-12">
					<label for="email" class="form-label">Email 
						<span class="text-muted"></span>
					</label> 
					<input type="email" class="form-control" name="Email" id="Email" placeholder="you@example.com" value="<%=user.get("email")%>" >
					<div class="invalid-feedback">필수 입력란 입니다.</div>
				</div>

				<div class="col-12">
					<label for="ssn" class="form-label">주민등록번호 
						<span class="text-muted" id="SSNconfimResult"></span>
					</label>
					<div style="position: relative; display: flex; flex-warp: wrap; width: 100%;">
						<input type="text" name="jumin1" id="jumin1" class="form-control me-1" id="ssn" value="<%=user.get("jumin_no_front")%>" maxlength="6" size="10" placeholder="" readonly> 
						- 
						<input type="password" name="jumin2" id=jumin2 class="form-control ms-1" id="ssn" value="<%=user.get("jumin_no_end")%>" maxlength="7" size="10" placeholder="" readonly>
					</div>

					<div class="invalid-feedback">필수 입력란 입니다.</div>
				</div>

				<div class="col-12">
					<label for="ID" class="form-label">ID 
						<!-- <span id="IDconfimResult" class="text-muted" style="font-size: 0.5rem;">(ID 중복확인 필수입니다.)</span> -->
					</label>
					<div class="input-group">
						<input type="id" class="form-control" id="id" name="id" placeholder="id" required="true" value="<%=user.get("userid")%>" readonly>
					</div>
					<div class="invalid-feedback">필수 입력란 입니다.</div>
				</div>

				<div class="col-12">
					<label for="PASSWORD" class="form-label">Password 
						<span class="text-muted"></span>
					</label> 
					<input type="password" class="form-control" name="password" id="password" placeholder="password" required="true" style="width: 60%" value="<%=user.get("password")%>" readonly>
					<div class="invalid-feedback">필수 입력란 입니다.</div>
				</div>

				<div class="col-12">
					<label for="PASSWORD" class="form-label">Password 확인 
						<span id="PASSWORDconfimResult" class="text-muted"></span>
					</label> 
					<input type="password" class="form-control" id="password_confirm" placeholder="password" required="true" style="width: 60%" onchange="PasswordConfrim()">
					<div class="invalid-feedback">필수 입력란 입니다.</div>
				</div>

				<!-- 주소입력란 시작-->
				<form name="address_form" id="address_form">
					<div class="col-12">
						<label for="address" class="form-label input-group">주소
							<button class="btn btn-primary position-absolute end-0" style="font-size: 0.5rem; border-radius: .3rem; margin-left: 1rem;" type="button" onclick="goPage('find_address')">주소검색</button>
						</label> 
						<input type="text" class="form-control" name="roadFullAddr" id="roadFullAddr" value="<%=user.get("address_no")%>" placeholder="1234 Main St" required="" readonly>
						<input type="hidden" id="confmKey" name="confmKey" value="TESTJUSOGOKR" readonly>
						<div class="invalid-feedback">필수 입력란 입니다.</div>
					</div>

					<div class="col-12">
						<label for="address2" class="form-label">상세주소 
							<span class="text-muted">(Optional)</span>
						</label>
						<input type="text" class="form-control" id="addrDetail" name="addrDetail" value="<%=user.get("address_detail")%>" placeholder="Apartment or suite" readonly>
						<!-- <input type="text" class="form-control" id="roadAddrPart2" placeholder="Apartment or suite"> -->
					</div>
				</form>
				
				<div style="visibility: hidden;">
					<input type="hidden" class="form-control" id="sex" name="sex" placeholder="" readonly>
				</div>
				
				<hr class="my-4">

				<button class="w-100 btn btn-primary btn-lg" type="button" onclick="submit_check()" >정보변경</button>
				<button class="w-100 btn btn-primary btn-lg" type="button" onclick="cancel()" >취소</button>
				<hr class="my-4">
		</form>
	</div>

</div>


<script>
	var PASSWORD_CONFRIM = false;	//password 일치 체크
	
	function submit_check() {
		
		if(!PASSWORD_CONFRIM){
			alert('password를 확인해주세요.');
			return;
		}
		
		
		
		var fulladdr = document.getElementById('roadFullAddr').value;
		
		if(fulladdr == ''){
			alert('주소를 입력해주세요.');
			return;
		}
		
		var detailaddr = document.getElementById('addrDetail').value;
		
		if(detailaddr == ''){
			alert('상세주소를 입력해주세요.');
			return;
		}
		
		$('#UserInfo').submit();
	}

	/* 취소버튼 */
	function cancel(){
		
		$('#UserInfo').attr("action","/customer/login/login_main");//취소-로그인페이지로
		$('#UserInfo').submit();
	}
	
	function goPage(tag) {
		var loginform = document.Loginform;
		/* 		
		 if(tag == 'find_address'){
		 Address_search.action = '/api/address/popup_page';
		 //document.getElementById('Loginform').setAttribute('action','/login/loginmain');	
		 }
		 Address_search.submit();
		 */
		if (tag == 'find_address') {
			//var pop = window.open("/api/address/popup_page","pop","scrollbars=yes, resizable=yes");
			var pop = window.open("/api/address/jusoPopup", "pop","scrollbars=yes, resizable=yes");
		}

	}

	// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
	//document.domain = "abc.go.kr";
	function goPopup() {

		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/api/address/jusoPopup", "pop","scrollbars=yes, resizable=yes");

	}

	/** API 서비스 제공항목 확대 (2017.02) **/
	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,
			detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn,
			buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {

		//alert('roadFullAddr : ' + roadFullAddr); 
		// 2017년 2월 제공항목이 추가되었습니다. 원하시는 항목을 추가하여 사용하시면 됩니다.

		document.getElementById('roadFullAddr').value = roadFullAddr;
		document.getElementById('addrDetail').value = addrDetail;

		/* document.address_form.roadFullAddr.value = roadFullAddr; */
		//document.address_form.roadAddrPart1.value = roadAddrPart1;
		/* alert('roadAddrPart2 : ' + roadAddrPart2); 
		document.address_form.roadAddrPart2.value = roadAddrPart2; */

		/* 	alert('addrDetail : ' + addrDetail); 
		document.address_form.addrDetail.value = addrDetail; */
		//document.address_form.zipNo.value = zipNo;
		//alert('주소 받아오기 완료 !!');
	}

	//password 변경값 confirm
	function PasswordConfrim() {
		var origin_password = $('#password').val();
		var confim_password = $('#password_confirm').val();

		if (origin_password != confim_password) {
			$('#PASSWORDconfimResult').html('password 불일치');
			$('#PASSWORDconfimResult').css('cssText', 'color : red ! important');
			$('#PASSWORDconfimResult').css('font-size', '0.5rem');

			PASSWORD_CONFRIM = false;
		} else {
			$('#PASSWORDconfimResult').html('password 일치');
			$('#PASSWORDconfimResult').css('cssText','color : green ! important');
			$('#PASSWORDconfimResult').css('font-size', '0.5rem');
			PASSWORD_CONFRIM = true;
		}
	}

		
	 
	 
		
</script>