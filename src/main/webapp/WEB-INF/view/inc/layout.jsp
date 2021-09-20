<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
	
	<tiles:insertAttribute name="head"/>
	
	<div class="row d-flex flex-row">
		<tiles:insertAttribute name="top-nav-button"/>	
	</div>
	
	<div class="row"> 
	
		<div class="col-12 me-2">
			<tiles:insertAttribute name="top-nav"/>
		</div>
		
	</div>
	
	<div class="row container-fluid pe-0 my-2">
		<div class="col-12">
			<tiles:insertAttribute name="content"/>
		</div>
	</div>
	
	
</html>