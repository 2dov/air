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

<script>
	$(function() {
		$.ajax({
			url : 'airportLoad.do',
			type : 'POST',
			dataType : 'json',
			success : function(v) {
				var availableTags = [];

				$(v).each(function(index, dom) {
					availableTags.push(this.name);
				});

				$("#depart").autocomplete({
					source : availableTags
				});

				$("#return").autocomplete({
					source : availableTags
				});
			},
			error : function(e) {
				alert('error');
			}
		});

	});

	$(function() {
		$("#datepicker1").datepicker({
			dateFormat : 'yy-mm-dd'
		});

		$("#datepicker2").datepicker({
			dateFormat : 'yy-mm-dd'
		});
	});

	$(function() {
		$(".ow-radio").click(function() {
			$("#datepicker2").attr("disabled", true);
		});

		$(".rd-radio").click(function() {
			$("#datepicker2").attr("disabled", false);
		});
	});
	
	$(document).ready(function() {
		$("button#searchList").click(function(){
			
			if($("input#depart").val()==''||$("input#depart").val()==null){
				alert('출발공항을 입력해주세요.');
				return false;
			}
			if($("input#return").val()==''||$("input#return").val()==null){
				alert('도착공항을 입력해주세요.');
				return false;
			}
			if($("input#datepicker1").val()==''||$("input#datepicker1").val()==null){
				alert('출발일을 입력해주세요.');
				return false;
			}
			if($("input[name='way']").val().equals('roundtrip')){
				alert($("input[name='way']").val());
			if($("input#datepicker2").val()==''||$("input#datepicker2").val()==null){
				alert('도착일을 입력해주세요.');
				return false;
			}
			}
			$("form#frmSchedule").submit();
		});
	});
</script>
</head>
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", Arial, Helvetica, sans-serif
}

.myLink {
	display: none
}
</style>

<body class="w3-light-grey">

	<jsp:include page="../template/head.jsp"></jsp:include>

	<header class="w3-display-container w3-content w3-hide-small"
		style="max-width: 1080px">
		<img class="w3-image" src="../img/main.jpg" alt="air" width="1080">
		<div class="w3-display-middle" style="width: 100%">
			<div class="w3-bar w3-white">
				<button class="w3-bar-item w3-button tablink"
					onclick="openLink(event, 'Flight');">
					<i class="fa fa-plane w3-margin-right"></i>Flight
				</button>
				<div class="w3-content" style="max-width: 700px;">
					<br>
					<form action="airScheduleSearch.do" id="frmSchedule" method="post">
					<div class="w3-row-padding">
						<p>
							<input class="rd-radio" type="radio" id="way" name="way"
								value="roundtrip" checked> <label id="rdlabel">ROUND</label>
							<input class="ow-radio" type="radio" id="way" name="way"
								value="oneway" style="margin-left: 20px"> <label
								id="owlabel">ONE-WAY</label>
						</p>
					</div>

					<div class="w3-row-padding">
						<div class="w3-col m6">
							<label><i class="fa fa-map-marker w3-margin-right"></i>FROM</label>
							<input class="w3-input w3-border" type="text" id="depart" name="ap_no"
								placeholder="AIRPORT">
						</div>
						<div class="w3-col m6">
							<label><i class="fa fa-map-marker w3-margin-right"></i>TO</label>
							<input class="w3-input w3-border" type="text" id="return" name="ap_no2"
								placeholder="AIRPORT">
						</div>
					</div>
					<br>
					<div class="w3-row-padding">
						<div class="w3-col m3">
							<label><i class="fa fa-calendar-o"></i> DEPART</label> <input
								class="w3-input w3-border" id="datepicker1" type="text" name="departtime"
								placeholder="YYYY MM DD">
						</div>
						<div class="w3-col m3">
							<label><i class="fa fa-calendar-o"></i> RETURN</label> <input
								class="w3-input w3-border" id="datepicker2" type="text" name="arrivaltime"
								placeholder="YYYY MM DD">
						</div>
						<div class="w3-col m3">
							<label><i class="fa fa-male"></i> Adults</label> <input
								class="w3-input w3-border" type="number" name="seat" placeholder="1" max="3" 
								min="1" value="1">
						</div>
						<div class="w3-col m3">
							<label><i class="fa fa-search"></i> Search</label>
							<button class="w3-button w3-block w3-black" id="searchList">Search</button>
						</div>
					</div>
					<br>
					</form>
				</div>
			</div>

		</div>
	</header>

	<!-- Page content -->

	<div class="w3-content" style="max-width: 1100px;">

		<!-- Good offers -->
		<div class="w3-container w3-margin-top">
			<h3>Favorite</h3>
			<h6>
				가장 인기있는 여행지의 <strong>리뷰 </strong>를 확인해 보세요.
			</h6>
		</div>
		<div class="w3-row-padding w3-text-white w3-large">
			<div class="w3-half w3-margin-bottom">
				<div class="w3-display-container">
					<img src="../img/airplane.jpg" alt="Cinque Terre"
						style="width: 100%"> <span
						class="w3-display-bottomleft w3-padding">인기있는 여행지</span>
				</div>
			</div>
			<div class="w3-half">
				<div class="w3-row-padding" style="margin: 0 -15px">
					<div class="w3-half w3-margin-bottom">
						<div class="w3-display-container">
							<img src="../img/paris.jpg" alt="Paris" style="width: 100%;">
							<span class="w3-display-bottomleft w3-padding">Paris</span>
						</div>
					</div>
					<div class="w3-half w3-margin-bottom">
						<div class="w3-display-container">
							<img src="../img/ny.jpg" alt="ny"
								style="width: 100%"> <span
								class="w3-display-bottomleft w3-padding">New York</span>
						</div>
					</div>
				</div>
				<div class="w3-row-padding" style="margin: 0 -15px">
					<div class="w3-half w3-margin-bottom">
						<div class="w3-display-container">
							<img src="../img/tokyo.jpg" alt="tokyo" style="width: 100%">
							<span class="w3-display-bottomleft w3-padding">Tokyo</span>
						</div>
					</div>
					<div class="w3-half w3-margin-bottom">
						<div class="w3-display-container">
							<img src="../img/seoul.jpg" alt="Paris" style="width: 100%">
							<span class="w3-display-bottomleft w3-padding">Seoul</span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Explore Nature -->
		<div class="w3-container">
			<h3>9월의 추천 여행지</h3>
			<p>여행가기 좋은 가을에 맞춰 떠나보세요.</p>
		</div>
		<div class="w3-row-padding">
			<div class="w3-half w3-margin-bottom">
				<img src="../img/airplane.jpg" alt="Norway" style="width: 100%">
				<div class="w3-container w3-white">
					<h3>West Coast, Norway</h3>
					<p class="w3-opacity">Roundtrip from $79</p>
					<p>Praesent tincidunt sed tellus ut rutrum sed vitae justo.</p>
					<button class="w3-button w3-margin-bottom">Buy Tickets</button>
				</div>
			</div>
			<div class="w3-half w3-margin-bottom">
				<img src="../img/airplane.jpg" alt="Austria" style="width: 100%">
				<div class="w3-container w3-white">
					<h3>Mountains, Austria</h3>
					<p class="w3-opacity">One-way from $39</p>
					<p>Praesent tincidunt sed tellus ut rutrum sed vitae justo.</p>
					<button class="w3-button w3-margin-bottom">Buy Tickets</button>
				</div>
			</div>
		</div>

	</div>

	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>