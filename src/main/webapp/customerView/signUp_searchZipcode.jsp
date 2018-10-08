<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
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
<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
<script>
	function sendAddress(zipcode, addr) {
		opener.sign.zipcode1.value=zipcode.split("-")[0];
		opener.sign.zipcode2.value=zipcode.split("-")[1];
		opener.sign.address1.value=addr;
		self.close();
	};

	$(document).ready(function() {
		$("button#check").click(function() {
			$.ajax({
				url : "selectZipcode.do",
				type : 'POST',
				dataType : 'json',
				data : {
					data : $("input#dong").val()
				},
				success : function(v) {
					var temp="";
 					$(v).each(function(index,dom){
 						var zipcode = this.zipcode;
 						var addr = this.sido+" "+this.gugun+" "+this.dong+" "+this.bunji;
						temp+="<tr><td><a href=\"javascript:sendAddress('"+zipcode+"','"+addr+"')\">";
						temp+=this.zipcode+" "+this.sido+" "+this.gugun+" "+this.dong+" "+this.bunji;
						temp+="</a></td></tr>";
					});
 					console.log(temp);
 					$("table[name='zipCodeTb']").html(temp);
				},
				error : function(e) {
					alert('error');
				}
			});
		});
		
		
	});
</script>
</head>
<body class="w3-light-grey">

	<!-- Navigation Bar -->
	<div class="w3-bar w3-white w3-border-bottom w3">
		<strong><font color='red'>우편번호 검색</font></strong>
	</div>

	<div class="w3-col m2" style="width: 400px; margin-left: 50px;">
		<br> <label><i class="fa fa-map-marker w3-margin-right"></i>찾고자
			하는 읍, 면, 동을 입력하세요.</label> <input class="w3-input w3-border" type="text"
			id="dong" placeholder="예 : 역삼동일 경우 '역삼' 만 입력하세요."> <br>
	</div>

	<div class="w3-col m2" style="width: 400px; margin-left: 50px;">
		<label><i class="fa fa-search"></i> Search</label>
		<button class="w3-button w3-block w3-black" id="check">Search</button>
		<br> <br>
		<div id="message" align="center"></div>
	</div>

	<div class="w3-col m2" style="width: 400px; margin-left: 50px;">
		<table name="zipCodeTb" border="1" class="w3-table-all w3-hoverable">
		</table>
	</div>
</body>
</html>