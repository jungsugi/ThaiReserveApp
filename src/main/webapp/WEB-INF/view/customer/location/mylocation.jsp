<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div class="row">
	
	<div id="map" style="width:500px;height:400px;"></div>

	<form id="UserLocation" name="UserLocation" action="" method="POST">
		<div id="clickLatlng"></div>
		<hr class="my-1">
			<button class="w-100 my-1 btn btn-primary btn-lg" type="button" onclick="save_location()" >내 위치 저장</button>
			<button class="w-100 my-1 btn btn-primary btn-lg" type="button" onclick="cancel()" >취소</button>
			<div id="tests"></div>
		<hr class="my-1">
	</form>
	
</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1d2ebd247dcb85e9298ab360a72a49fc&libraries=services,clusterer,drawing,markers"></script>

<!--
    services와 clusterer, drawing 라이브러리 불러오기 KaKao 
	네이티브 앱 키		29c3f22db9eb9c4383168c9ccccc64be
	REST API 키		e971469793c7cf0998c2e2c4ced12178
	JavaScript 키	1d2ebd247dcb85e9298ab360a72a49fc
	Admin 키			b2bba9aaa29483a5aee9dc2f07b23666
	
	git Test
-->

<script>

$(document).ready(function(){
	
	var mapContainer = document.getElementById('map'); // 지도를 표시할 div
	
	var mapOption = {
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표 (일단 카카오로)
	    level: 5 // 지도의 확대 레벨 
	};
	

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
		
		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(function(position) {
			
	    	var lat = position.coords.latitude, // 위도
	        	lon = position.coords.longitude; // 경도
	    
	    	var locPosition = new kakao.maps.LatLng(lat, lon), 	//마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다.
	        	message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
	    
	    	// 마커와 인포윈도우를 표시합니다
	    	displayMarker(locPosition, message, map);
	  });
	}
	else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
		    message = 'geolocation을 사용할수 없어요..'
		    
		displayMarker(locPosition, message , map);
	}
	
	
	/*
		var marker = new kakao.maps.Marker({
		    // 지도 중심좌표에 마커를 생성합니다 
		    position: map.getCenter()
		}); 
	
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			// 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng; 
		    
		    // 마커 위치를 클릭한 위치로 옮깁니다
		    marker.setPosition(latlng);
		    
		    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		    	message += '경도는 ' + latlng.getLng() + ' 입니다';
		    
		    var resultDiv = document.getElementById('clickLatlng'); 
		    resultDiv.innerHTML = message;
		    
		});
	*/
	
});


//지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message, map) {

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    map: map, 	//marker.setMap(map) 과 같음
	    position: locPosition
	}); 
	
	var iwContent = message, // 인포윈도우에 표시할 내용
	    iwRemoveable = true;
	
	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    content : iwContent,
	    removable : iwRemoveable
	});
	// 인포윈도우를 마커위에 표시합니다 
	infowindow.open(map, marker);
	
	// 지도 중심좌표를 접속위치로 변경합니다
	map.setCenter(locPosition);
	
	// 지도에 마커를 표시합니다 
	marker.setMap(map);

}


/* 취소 버튼 */
function cancel(){
	$('#UserLocation').attr("action","/customer/location/cancle_mylocation");//취소-로그인페이지로
	$('#UserLocation').submit();
}



/* 내위치 저장 버튼*/
function save_location(){
			
}


</script>

