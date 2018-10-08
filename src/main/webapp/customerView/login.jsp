<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>WHERE ARE U GOING? - LOGIN</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", Arial, Helvetica, sans-serif
}

.myLink {
	display: none
}
</style>
<script>
	$(document).ready(function() {
		if(unescape(location.href).split("message=")[1]=="login"){
			alert('로그인이 필요한 서비스입니다.');
		}
		$("button#login").click(function() {
			if ($("input#id").val().length == 0	|| $("input#password").val().length == 0) {
				$("input#id").val('');
				$("input#password").val('');
				$("input#id").focus();
				$("div#message").html("<font color='red'>아이디 또는 비밀번호를 확인해주세요.</font>");
			} else {
				$("form").submit();
				$("div#message").html("");
			}
		});
		
		$("button#signUp").click(function(){
			location.href="signUp.jsp";
		});
	});
</script>
<body class="w3-light-grey">

	<!-- Navigation Bar -->
	<div class="w3-bar w3-white w3-border-bottom w3-xlarge">
		<a href="main.jsp"
			class="w3-bar-item w3-button w3-text-red w3-hover-red"><b><i
				class="fa fa-map-marker w3-margin-right"></i>어디가</b></a>
	</div>
</body>
<body>
	<header class="w3-display-container w3-content w3-hide-small"
		style="max-width: 600px">
		<br> <br> <img class="w3-image" src="../img/travel.png"
			alt="air" width="600">
		<div class="w3-display-bottom" style="width: 100%">
			<div class="w3-bar w3-white">
				<div class="w3-content" style="max-width: 700px;">
					<br>
					<div class="w3-row-padding">
						<form action="loginCheck.do">
							<div class="w3-col">
								<label><i class="fa fa-map-marker w3-margin-right"></i>아이디</label>
								<input class="w3-input w3-border" type="text" placeholder="ID"
									id="id" name="id"> <br>
							</div>
							<div class="w3-col">
								<label><i class="fa fa-map-marker w3-margin-right"></i>비밀번호</label>
								<input class="w3-input w3-border" type="password"
									placeholder="PASSWORD" id="password" name="password">
							</div>
						</form>
						<div class="w3-col">
							<br>
							<div id="message"></div>
							<br>
							<button class="w3-button w3-block w3-light-grey" id="login">로그인</button>
							<br>
						</div>
					</div>
					<div class="w3-row-padding" align="center">
						<div class="w3-col">
							<button class="w3-button w3-block w3-white" id="signUp">회원가입</button>
						</div>
						<div class="w3-col">
							<button class="w3-button w3-block w3-white">아이디 찾기</button>
						</div>
						<div class="w3-col">
							<button class="w3-button w3-block w3-white">비밀번호 찾기</button>
							<br>
						</div>
					</div>
				</div>
			</div>

		</div>
	</header>
</body>
</html>