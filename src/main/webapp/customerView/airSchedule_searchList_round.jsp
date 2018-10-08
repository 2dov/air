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
			$("form#"+$(this).attr('title')).submit();
		});
	});
</script>
</head>
<body class="w3-light-grey">

	<jsp:include page="../template/head.jsp"></jsp:include>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
			<div class="panel panel-primary" id="departList">
					<div class="panel-heading">
						<h3 class="panel-title">가는편 DEPART</h3>
					</div>
					<div class="panel-body">
						<div class="col-md-14">
							<table class="table table-striped custab"
								style="margin-top: 10px; margin-bottom: 10px;">
								<thead>
									<tr style="margin: 5px">
										<th>항공사명</th>
										<th>출발공항</th>
										<th>출발시간</th>
										<th>소요시간</th>
										<th>도착공항</th>
										<th>도착시간</th>
										<th>가격</th>
									</tr>
								</thead>
									<tr style="margin-top: 3px">
										<td>${departList.al_no} </td>
										<td>${departList.ap_no }</td>
										<td>${departList.departtime }</td>
										<td>${departList.lead }</td>
										<td>${departList.ap_no2 }</td>
										<td>${departList.arrivaltime }</td>
										<td>${departList.cost } 원	</td>
									</tr>
								
							</table>
						</div>
					</div>


				</div>
				<br>
				<br>
				<div class="panel panel-primary" id="departList">
					<div class="panel-heading">
						<h3 class="panel-title">오는편 RETURN</h3>
						<div align="right">
							<a href="airScheduleSearchReturn.do?page=${currentPage>1?currentPage-1:currentPage }" style="text-decoration: none">이전</a>&nbsp;&nbsp;&nbsp;
							${currentPage }page / ${totalPage } pages &nbsp;&nbsp;&nbsp;<a
								href="airScheduleSearchReturn.do?page=${currentPage<totalPage?currentPage+1:currentPage}" style="text-decoration: none">다음</a>
						</div>

					</div>
					<div class="panel-body">
						<div class="col-md-14">
							<table class="table table-striped custab"
								style="margin-top: 10px; margin-bottom: 10px;">
								<thead>
									<tr style="margin: 5px">
										<th>항공사명</th>
										<th>출발공항</th>
										<th>출발시간</th>
										<th>소요시간</th>
										<th>도착공항</th>
										<th>도착시간</th>
										<th>가격</th>
									</tr>
								</thead>
								<c:forEach var="s" items="${list }">
									<tr id="selected" style="margin-top: 3px">
										<tr id="selected" title="${s.s_no }" style="margin-top: 3px">
										<td>${s.al_no }</td>
										<td>${s.ap_no }</td>
										<td>${s.departtime }</td>
										<td>${s.lead }</td>
										<td>${s.ap_no2 }</td>
										<td>${s.arrivaltime }</td>
										<td>${s.cost } 원
											<form action="reservationPage.do" id="${s.s_no }" method="post">
												<input type="hidden" value="${s.s_no}" name="s_no">
												<input type="hidden" value="${s.al_no}" name="al_no"> 
												<input type="hidden" value="${s.ap_no}" name="ap_no"> 
												<input type="hidden" value="${s.departtime}" name="departtime"> 
												<input type="hidden" value="${s.lead}" name="lead"> 
												<input type="hidden" value="${s.ap_no2}" name="ap_no2"> 
												<input type="hidden" value="${s.arrivaltime}" name="arrivaltime"> 
												<input type="hidden" value="${s.cost}" name="cost">
											</form>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>


				</div>

			</div>
		</div>
	</div>
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>