<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
<!-- <script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
---- Include the above in your HEAD tag --------
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
---- Include the above in your HEAD tag --------
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script> -->

<title>WHERE ARE U GOING?</title>

<style>
.custab {
	border: 1px solid #ccc;
	padding: 5px;
	margin: 5% 0;
	box-shadow: 3px 3px 2px #ccc;
	transition: 0.5s;
}

.custab:hover {
	box-shadow: 3px 3px 0px transparent;
	transition: 0.5s;
}

tr#selected:hover {
	background-color: #D5D5D5;
}
</style>
<script>
	$(document).ready(function() {
		$("tr#selected").click(function() {
			$("form#" + $(this).attr('title')).submit();
		});
	});
</script>
</head>
<body class="w3-light-grey">

	<jsp:include page="../template/head.jsp"></jsp:include>

	<header class="w3-display-container w3-content w3-hide-small"
		style="max-width: 600px">
		<br> <br> <img class="w3-image" src="../img/booking.png"
			alt="air" width="600">
		<div class="w3-display-bottom" style="width: 100%">
			<div class="w3-bar w3-white">
				<div class="w3-content" style="max-width: 700px;">
					<div class="w3-row-padding" align="center">
						<div class="w3-col">
							<br>
							<p>예약이 완료되었습니다.</p>
							<p>예약까지 완료하고 실제 결제는 마이페이지에서 진행 가능합니다.</p>
							<br>
							<a href="main.jsp" style="text-decoration:none">
							<button class="w3-button w3-block w3-white">
								MAIN
							</button>
							</a>
							<a href="main.jsp" style="text-decoration:none">
							<button class="w3-button w3-block w3-white">
								MY PAGE
							</button>
							</a>
							<br>
						</div>
					</div>
				</div>
			</div>

		</div>
	</header>
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>