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
		<a href="main.jsp"
			class="w3-bar-item w3-button w3-text-red w3-hover-red" style="text-decoration: none"><b><i
				class="fa fa-map-marker w3-margin-right"></i>¾îµð°¡</b></a> <a href="#"
			class="w3-bar-item w3-button w3-text-grey w3-hover-red" style="text-decoration: none">Reservation</a>
		<a href="#" class="w3-bar-item w3-button w3-text-grey w3-hover-red" style="text-decoration: none">Review</a>
		<a href="#" class="w3-bar-item w3-button w3-text-grey w3-hover-red" style="text-decoration: none">About</a>

		<c:choose>
			<c:when test="${no!=null}">
				<a href="logout.do"
					class="w3-bar-item w3-button w3-right w3-hover-red w3-text-grey" style="text-decoration: none"><i>LOGOUT</i></a>
				<a href="#"
					class="w3-bar-item w3-button w3-right w3-hover-red w3-text-grey" style="text-decoration: none"><i>MYPAGE</i></a>
			</c:when>
			<c:otherwise>
				<a href="../customerView/login.jsp"
					class="w3-bar-item w3-button w3-right w3-hover-red w3-text-grey" style="text-decoration: none"><i>LOGIN</i></a>
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>