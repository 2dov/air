<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", Arial, Helvetica, sans-serif
}

.myLink {
	display: none
}
</style>
<body class="w3-light-grey">

	<!-- Navigation Bar -->
	<div class="w3-bar w3-white w3-border-bottom w3-xlarge">
		<a href="#" class="w3-bar-item w3-button w3-text-red w3-hover-red"><b><i
				class="fa fa-map-marker w3-margin-right"></i>어디가</b></a> 
		<a href="#"	class="w3-bar-item w3-button w3-text-grey w3-hover-red">고객 관리</a>
		<a href="#" class="w3-bar-item w3-button w3-text-grey w3-hover-red">예약 관리</a>
		<a href="#" class="w3-bar-item w3-button w3-text-grey w3-hover-red">운항 노선 관리</a>
		<a href="#" class="w3-bar-item w3-button w3-text-grey w3-hover-red">게시판 관리</a>
		<a href="../customerView/logout.do"	class="w3-bar-item w3-button w3-right w3-hover-red w3-text-grey"><i>LOGOUT</i></a>

	</div>

</body>
</html>