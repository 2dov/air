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
	<div class="w3-content"
		style="max-width: 1100px; margin-top: 200px; margin-bottom: 200px">
		<h1>Appointment Management Page</h1>
		<div class="w3-row-padding w3-text-white w3-large">
			<table>
				<c:forEach var="i" items="${list }">
					<tr>
						<td>${i}</td>
					</tr>
				</c:forEach>
			</table>

		</div>
	</div>

	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>