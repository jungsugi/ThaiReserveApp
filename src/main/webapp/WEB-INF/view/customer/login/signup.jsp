<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="py-5 text-center">
	<h2>회원가입</h2>
	<p class="lead">아래 정보를 작성해주세요.</p>
</div>

<div class="row">

	<div class="col-12">
		<form class="needs-validation" novalidate="" id="UserInfo" name="UserInfo" action="/customer/signin/SignIn" method="POST">
			<h4 class="mb-3">성함</h4>
			<div class="row g-3">
				<div class="col-sm-6">
					<label for="firstName" class="form-label">이름 (Name)</label>
					<input type="text" class="form-control" id="Name" name="Name" placeholder="" value="" required="">
					<div class="invalid-feedback">필수 입력란 입니다.</div>
				</div>
				<!-- 
				<div class="col-sm-6">
					<label for="lastName" class="form-label">성 (Last name)</label> 
					<input type="text" class="form-control" id="lastName" placeholder="" value="" required="">
					<div class="invalid-feedback">필수 입력란 입니다.</div>
				</div>
				-->
				<div class="col-12">
					<label for="email" class="form-label">Email 
						<span class="text-muted"></span>
					</label> 
					<input type="email" class="form-control" name="Email" id="Email" placeholder="you@example.com">
					<div class="invalid-feedback">필수 입력란 입니다.</div>
				</div>

				<div class="col-12">
					<label for="ssn" class="form-label">주민등록번호 
						<span class="text-muted" id="SSNconfimResult"></span>
					</label>
					<div style="position: relative; display: flex; flex-warp: wrap; width: 100%;">
						<input type="text" name="jumin1" id="jumin1" class="form-control me-1" id="ssn" maxlength="6" size="10" placeholder=""> 
						- 
						<input type="password" name="jumin2" id=jumin2 class="form-control ms-1" id="ssn" maxlength="7" size="10" placeholder="">
					</div>

					<div class="invalid-feedback">필수 입력란 입니다.</div>
				</div>

				<div class="col-12">
					<label for="ID" class="form-label">ID 
						<span id="IDconfimResult" class="text-muted" style="font-size: 0.5rem;">(ID 중복확인 필수입니다.)</span>
					</label>
					<div class="input-group">
						<input type="id" class="form-control" id="id" name="id" placeholder="id" required="true">
						<button id="IDsendButton" class="btn btn-primary" type="button">중복확인</button>
						<!-- onclick="goIDconfirm()" -->
					</div>
					<div class="invalid-feedback">필수 입력란 입니다.</div>
				</div>

				<div class="col-12">
					<label for="PASSWORD" class="form-label">Password 
						<span class="text-muted"></span>
					</label> 
					<input type="password" class="form-control" name="password" id="password" placeholder="password" required="true" style="width: 60%">
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
						<input type="text" class="form-control" name="roadFullAddr" id="roadFullAddr" placeholder="1234 Main St" required="" readonly>
						<input type="hidden" id="confmKey" name="confmKey" value="TESTJUSOGOKR" readonly>
						<div class="invalid-feedback">필수 입력란 입니다.</div>
					</div>

					<div class="col-12">
						<label for="address2" class="form-label">상세주소 
							<span class="text-muted">(Optional)</span>
						</label>
						<input type="text" class="form-control" id="addrDetail" name="addrDetail" placeholder="Apartment or suite" readonly>
						<!-- <input type="text" class="form-control" id="roadAddrPart2" placeholder="Apartment or suite"> -->
					</div>
				</form>
				
				<div style="visibility: hidden;">
					<input type="hidden" class="form-control" id="sex" name="sex" placeholder="" readonly>
				</div>
				
				<hr class="my-4">

				<button class="w-100 btn btn-primary btn-lg" type="button" onclick="submit_check()" >회원가입</button>
					
				<hr class="my-4">
		</form>
	</div>

</div>


<script>
	var ID_CONFRIM = false;		//id 중복체크
	var PASSWORD_CONFRIM = false;	//password 일치 체크
	var SSN_CONFIRM = false;	//주민등록번호 유효성 체크
	
	function submit_check() {
		var name = $('#Name').val();
		
		if(name == ''|| name.length < 2){
			alert('이름을 입력 해주세요.');
			return;
		}
		
		if(!ID_CONFRIM){
			alert('ID중복체크를 해주세요.');
			return;
		}
		if(!PASSWORD_CONFRIM){
			alert('password를 확인해주세요.');
			return;
		}
		if(!SSN_CONFIRM){
			alert('주민등록번호 입력을 확인해주세요.');
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

	/* ID 중복확인 */
	$(function() {
		$('#IDsendButton').click(
				//document id
				function() {
					$.ajax(
							{
								type : "POST", //요청타입
								url : "/customer/signin/idconfirm", //요청 url
								data : {
									sendid : $('#id').val()
								},
								success : function(data) {
									var dt = data; //JSON Data일 경우 : JSON.parse(data);									
									//console.log(dt);
									if (data == 'true') {
										$('#IDconfimResult').html(' 사용 가능한 ID입니다.'); //받아온값 셋팅	
										$('#IDconfimResult').css('cssText','color : green !important'); //받아온값 셋팅
										//$(".test").css("background-color", '#FE0037');
										ID_CONFRIM = true;
									} else if (data == 'false') {
										$('#IDconfimResult').html(' 이미 사용중인 ID입니다.'); //받아온값 셋팅
										$('#IDconfimResult').css('cssText','color : red !important'); //받아온값 셋팅
										ID_CONFRIM = false;
									} else {
										$('#IDconfimResult').html(' ID를 입력해주세요.'); //받아온값 셋팅
										$('#IDconfimResult').css('cssText','color : gray !important'); //받아온값 셋팅
										ID_CONFRIM = false;
									}
								}
							}).done(function() {
						console.log('ajax 통신 성공');
					}).fail(function() {
						console.log('ajax 실패!!');
					})
				})
	});

	//주민등록번호입력 첫번째 칸 유효성 검사 (입력시)
	$('#jumin1').on('keypress', function() {
		var text = $('#jumin1').val().replace(/[^0-9]/g, ""); //0~9 숫자가 아니면 ""로 치환 	

		if (text.length >= $(this).attr("maxlength")) {
			$('#jumin2').focus();
			return;
		}

		$(this).val(text);
	});

	//주민등록번호 두번째 칸 입력 유효성 검사 (입력시)
	$('#jumin2').on('keydown', function(e) { // event가 'keypress' 면 backspace를 인식하지 못한다. 'keydown'으로 해야 한다.

		var inVal = ""; //valid한 입력값
		var key = event.keyCode; //event.charCode; //keypress 이벤트에서 반환된 이벤트 인수에만 존재 !

		//alert(key);

		if (key == 8) { //backspace 인식 
			if (confirm("주민번호 뒷자리 전체를 삭제 후 다시 입력하시겠습니까?")) {
				//$("#juminE").val("");
				$("#jumin2").val("");
			}
		} else if (key >= 96 && key <= 105) { /* 옆에 조그만 숫자판*/
			switch (key) {
			case value:
			case 96:
				inVal = 0;
				break;
			case 97:
				inVal = 1;
				break;
			case 98:
				inVal = 2;
				break;
			case 99:
				inVal = 3;
				break;
			case 100:
				inVal = 4;
				break;
			case 101:
				inVal = 5;
				break;
			case 102:
				inVal = 6;
				break;
			case 103:
				inVal = 7;
				break;
			case 104:
				inVal = 8;
				break;
			case 105:
				inVal = 9;
				break;
			default:
				break;
			}
		} else if (key >= 48 && key <= 57) { /* 위에 숫자판 */
			inVal = String.fromCharCode(key); // event key값 -> 원래 기존 입력값으로 치환
		} else {
			e.preventDefault(); //그 이외의 event는 막는다.
			return false;
		}

		var text = $(this).val(); //현재 2번째칸 입력값

		if (text.length >= $(this).attr("maxlength")) {
			return;
		}
	});
	
	
	$('#jumin2').change(
			function() { //focus 떨어질때 주민번호 전체 유효성 검사 실시	
				//var f = document.regiform; // '폼 이름' 변수 선언

				var ssn = $("#jumin1").val() + $("#jumin2").val(); //주민번호 13자리값
				var key = "234567892345"; // 주민번호 생성 key 값
				var sum = 0; // 곱해서 더한 총합
				var yy = ssn.substring(0, 2); //년도에 해당하는 두자리.
				var mm = ssn.substring(2, 4); //달에 해당하는 두자리.
				var dd = ssn.substring(4, 6); //날짜에 해당하는 두자리.
				var sex = ssn.charAt(6); //성별에 해당하는 한자리.
				var sex_nm = "";

				var test_dd = 0; //날자에 해당하는 두자리 체크를 위한 설정 값

				var pre_yy = (sex == "1" || sex == "2") ? "19" : "20"; //성별에 따른 년도 두자리생성
				var totalyy = pre_yy + yy; //실제 년도 완성(윤년에 따른 2월 일(날짜) 범위 체크시 사용)

				if (!ssn)
					return; //OnBlur()를 사용했기때문에 넣어줌.

				//--------------------------------
				// 숫자만 입력했는지 검사
				//---------------------------------
				if (isNaN(ssn)) {
					$('#SSNconfimResult').html("주민등록번호는 숫자만 입력가능합니다.");
					$('#SSNconfimResult').css('cssText',
							'color : red !important'); //받아온값 셋팅

					$("#jumin1").val("");
					$("#jumin2").val("");

					$("#jumin2").focus();
					SSN_CONFIRM = false;
					return;
				}

				//--------------------------------
				// 주민번호가 13자리인지 체킹
				//---------------------------------
				if (ssn.length != 13) {
					$('#SSNconfimResult').html("주민등록번호는 13자리여야 합니다.");
					$('#SSNconfimResult').css('cssText','color : red !important'); //받아온값 셋팅
					SSN_CONFIRM = false;

					return;
				}

				//--------------------------------
				// 월,성별의 입력 범위 유효성 검사
				//---------------------------------
				if ((mm<01||mm>12 || sex > 4)) {
					$('#SSNconfimResult').html("월에 해당하는 두자리가 잘못 입력되었습니다.");
					$('#SSNconfimResult').css('cssText','color : red !important'); //받아온값 셋팅
					//$("#jumin1").val("");
					$("#jumin1").focus();
					SSN_CONFIRM = false;
					return;
				}

				//--------------------------------------------------
				// 월에 따른 날짜의 범위가 적합한지 검사(윤년체크도 포함)
				//--------------------------------------------------
				if (mm == 01 || mm == 03 || mm == 05 || mm == 07 || mm == 08
						|| mm == 10 || mm == 12) {
					test_dd = 31;
				} else if (mm == 04 || mm == 06 || mm == 09 || mm == 11) {
					test_dd = 30;
				} else if (mm == 02) {
					if (((totalyy % 4) == 0) && ((totalyy % 100) != 0)
							|| ((totalyy % 400) == 0)) {
						test_dd = 29;
					} else {
						test_dd = 28;
					}
				}

				if (dd > test_dd) { //ex) 2.31 없음
					$('#SSNconfimResult').html("월에 해당하는 일자가 틀립니다.");
					$('#SSNconfimResult').css('cssText','color : red !important'); //받아온값 셋팅

					//$("#jumin1").val("");
					$("#jumin1").focus();
					SSN_CONFIRM = false;

					return;
				}

				//성별 셋팅
				if ((sex == "1") || (sex == "3")) {
					//f.u_sex.value="남자"	
					sex_nm = "남";
				} else {
					//f.u_sex.value="여자"
					sex_nm = "여";
				}
				$('#sex').val(sex_nm);

				for (i = 0; i < 12; i++) {
					sum += ssn.charAt(i) * key.charAt(i);
				}

				sum = 11 - (sum % 11)
				endNo = sum % 10;

				if (ssn.charAt(12) != endNo) {
					$('#SSNconfimResult').html("유효하지 않는 주민번호입니다. 다시 확인하시고 입력해 주세요.");
					$('#SSNconfimResult').css('cssText','color : red !important'); //받아온값 셋팅			

					$("#jumin1").val("");
					$("#jumin2").val("");
					SSN_CONFIRM = false;
					//f.u_ssn.value = "";
					//f.u_ssn.focus();
					return;
				}

				$.ajax(
						{
							type : "POST",
							url : "/customer/signin/Jumin_confirm",
							data : {
								jumin_val : ssn
							},
							success : function(data) {
								var return_data = data;

								if (return_data == "true") {
									$('#SSNconfimResult').html("입력 완료");
									$('#SSNconfimResult').css('cssText','color : green !important'); //받아온값 셋팅			
									SSN_CONFIRM = true;
								} else {
									$('#SSNconfimResult').html("이미 존재하는 주민등록번호입니다.");
									$('#SSNconfimResult').css('cssText','color : red !important'); //받아온값 셋팅	
									SSN_CONFIRM = false;
								}
							}

						}).done(function() {
					console.log('ajax 통신 성공!');
				}).fail(function() {
					console.log('ajax 통신 실패!');
				})

			});
	
	// id변경시  
	/* var ID_CONFRIM = false;
		var PASSWORD_CONFRIM = false;
		var SSN_CONFIRM = false;
	 */
	$('#id').change(
		function(){
			ID_CONFRIM = false;
			$('#IDconfimResult').html('');
		}
	);
		
	 
	 
		
</script>