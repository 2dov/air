<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<title>WHERE ARE U GOING?</title>

<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
</head>
<body class="w3-light-grey">

	<jsp:include page="../template/managerHead.jsp"></jsp:include>
	<div class="w3-content" style="max-width: 1100px; margin-top: 200px; margin-bottom: 200px">
		<h1>Management Page</h1>
		<div class="w3-row-padding w3-text-white w3-large">
			<div class="w3-half w3-margin-bottom">
				<div class="w3-display-container">
					<img src="../img/airplane.jpg" alt="Cinque Terre"
						style="width: 100%"> <span
						class="w3-display-bottomleft w3-padding">Management</span>
				</div>
			</div>
			<div class="w3-half">
				<div class="w3-row-padding" style="margin: 0 -12px">
					<div class="w3-half w3-margin-bottom">
						<div class="w3-display-container">
							<img src="../img/airplane.jpg" alt="New York" style="width: 100%">
							<span class="w3-display-bottomleft w3-padding">고객 관리</span>
						</div>
					</div>
					<div class="w3-half w3-margin-bottom">
						<div class="w3-display-container">
							<img src="../img/airplane.jpg" alt="San Francisco"
								style="width: 100%"> <span
								class="w3-display-bottomleft w3-padding">예약 관리</span>
						</div>
					</div>
				</div>
				<div class="w3-row-padding" style="margin: 0 -12px">
					<div class="w3-half w3-margin-bottom">
						<div class="w3-display-container">
							<a href="AirAdFli.do">
							<img src="../img/airplane.jpg" alt="Pisa" style="width: 100%">
							<span class="w3-display-bottomleft w3-padding">운항 노선 관리</span>
							</a>
						</div>
					</div>
					<div class="w3-half w3-margin-bottom">
						<div class="w3-display-container">
							<img src="../img/airplane.jpg" alt="Paris" style="width: 100%">
							<span class="w3-display-bottomleft w3-padding">게시판 관리</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

		<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>