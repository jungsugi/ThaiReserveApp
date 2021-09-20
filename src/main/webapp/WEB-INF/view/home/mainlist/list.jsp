<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 해당 엔티티의 n.getUserId() 와 같다. userId 멤버변수가 아니다. EL 표기법이라고 함.
<c:forEach var="n" items="${list}">
	<div>${n.userId}</div> 
	<div>${n.jumin_no}</div>
</c:forEach>
 -->

<div id="app">

	<div class="list-group">
		<div v-for="index in item_cnt"> 
			
			<div class="list-group-item list-group-item-action py-2">
				<div class="py-3">
					<div class="d-flex w-100 justify-content-between">
						<h5 class="mb-1">{{Title}}</h5>
						<small>3 days ago</small>
					</div>
					<p class="mb-1">{{SubTitle}}</p> 
					<small>{{location}}</small>
					
					<div class="card mb-3" style="max-width: 540px;">
					  <div class="row g-0"> <!-- 'g-0' padding을 없댄다 -->
					    <div class="col-md-4">
					      <img src="/assets/img/company1/thumnail.jpg" class="img-thumbnail" alt="test">
					    </div>
					    <div class="col-md-8">
					      <div class="card-body">
					        <h5 class="card-title">Card title</h5>
					        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
					        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
					      </div>
					    </div>
					  </div>
					</div>  <!-- card mb-3 -->
				</div>
				
			</div> <!-- list-group-item list-group-item-action -->
		</div> <!-- index in item_cnt -->
	</div> <!-- list-group -->
	




<script>

	new Vue({
		el : '#app',
		data : {
			name : '리스트',
			Title : '업체 이름',
			SubTitle : '업체 sub Title',
			location : '서울특별시 중랑구 상봉동 86-29',
			item_cnt : 30,
			list : function() {
				var list = [];
				for (var i = 1; i < this.age; i += 2) {
					list.push(i)
				}
				return list
			},
		},
	});
	
	
</script>


