
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자 관리페이지</title>
</head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
	/* function infoShow() {
		location.href = 'AirAdFliInfo.jsp';
	} */

	function addInsert() {
		location.href = 'AirAdFliEdit.jsp?insert=insert';
	}
	
	function searchPro() {

		var obj = document.searchForm;
		if (obj.searchOption.value == "empty") {
			alert("검색 방법을 선택해주세요.");
			obj.searchText.value = '';

		} else {
			obj.submit();
		}
	}
	
 	$(function() {
		$("input#allCheck").click(function(){
			if($(this).prop("checked")){
				$("input#seletcCheck").prop("checked",true);
				$("input#seletcCheck").each(function(){
					//alert($("input#seletcCheck").prop("checked"));
				});
				
			}else{
				$("input#seletcCheck").prop("checked",false);
			}
					
		});// 체크박스 전체 선택시 
		
		$("input#seletcCheck").click(function(){			
				$(this).attr("name",$(this).prop("value"));		
		});			
	// 체크박스 개별 선택시
	
	$("input#delete").click(function(){
		var checkBoxValue; 
 		$("input#seletcCheck").each(function(i){
 			checkBoxValue+= $(this).prop("name");
 		});
 		var delValue= checkBoxValue.substr(9);		
 	/* 	alert(delValue); */
 		location.href ="airadfilProcess.jsp?delete=delete&&delValue="+delValue;
	// 삭제 버튼 클릭시  
	}); // delete 버튼
	
 	});// jquery 시작&끝 
		
</script>




<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 80%;
	position: absolute;
	top: 320px;
	left: 150px;
	text-align: center;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #008299;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #60748ba8;
	color: white;
	text-align: center;
}

.con_list {
	position: absolute;
	left: 0px;
	top: 250px;
	width: 100%;
	margin-left: 150px;
}

.con_list p {
	padding-bottom: 5px;
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-weight: bold;
	
}

.btns {
	position: relative;
	left: 990px;
	top: 20px;
	
}

.btns input[type="button"] {
	background-color: black;
	border: none;
	color: white;
	width: 70px;
	box-shadow: 50px;
	margin-bottom: 10px;
}

.search {
	position: absolute;
	top: 288px;
	left: 0px;
	margin-left: 150px;
}

.search input[type="text"] {
	position: relative;
	bottom: 3.5px;
	padding: 0px;
	margin: 0px;
}
</style>
<%-- <%
	request.setCharacterEncoding("EUC-KR");
	List<AirSchedule> list = null;

	//System.out.println("searchOption" + searchOption);
	//System.out.println("searchText" + searchText);

	HashMap<String, Object> map = new HashMap<String, Object>();
	if (searchOption != null && searchText != null) {
		map.put("searchOption", searchOption);
		map.put("searchText", searchText);
	}
	list = AirAdFilDao.selectScheduleFil(map);
	

%> --%>

<body class="w3-light-grey">
<jsp:include page="../template/managerHead.jsp"></jsp:include>

	<div class="w3-content" style="max-width: 1100px; margin-top: 200px; margin-bottom: 200px">
	<div id="w3-half w3-margin-bottom">
		<div class="con_list">
			<p>운항정보 관리/목록</p>
		</div>

		<div class="btns">
			<input type="button" value="조회" onclick="searchPro()"> 
			<input type="button" name="delete" id="delete" value="삭제" >
				 <input type="button" value="추가" onclick="addInsert()">
		</div>

		<div class="clear"></div>
		<form action="AirAdFli.do" name="searchForm" method="post">
			<div class="search">
				<select id="searchOption" name="searchOption">
					<option value="empty">선택하세요</option>
					<option value="s_no">운항번호</option>
					<option value="p_no">비행기코드</option>
					<option value="al_no">항공사코드</option>
					<option value="ap_no">출발공항코드</option>
					<option value="ap_no2">도착공항코드</option>
				</select> 
				<input type="text" id="searchText" name="searchText">
			</div>
		</form>
		
			<table id="customers">

				<tr>
					<th width="5"><input id="allCheck" type="checkbox"></th>
					<th>운항번호</th>
					<th>비행기코드</th>
					<th>항공사코드</th>
					<th>출발공항코드</th>
					<th>도착공항코드</th>
					<th>출발시간</th>
					<th>도착시간</th>
					<th>소요시간</th>
					<th>가격</th>
					<th>좌석수</th>

					<th>Info</th>
				</tr>
					<tbody>
				<c:forEach var="i" items="${adFilList}" varStatus="cnt">
				<tr>
					<td><input id="seletcCheck" type="checkbox"  value="/"></td>
					<td>${i.s_no}</td>
					<td>${i.p_no}</td>
					<td>${i.al_no}</td>
					<td>${i.ap_no}</t>
					<td>${i.ap_no2}</td>
					<td>${i.departtime}</td>
					<td>${i.arrivaltime}</td>
					<td>${i.lead}</td>
					<td>${i.cost}</td>
					<td>${i.seat}</td>
					<td><a href="AirAdFliInfo.do?S_NO=${i.s_no}">
							<input type="button" value="상세보기" style="border: none; background-color: #B1B1B1; color: white; width: 100%; height: 20px;"></a>							
					</td>
				</tr>
				</c:forEach>
			</tbody>
			</table>
	</div>
			</div>
			<div style="margin-top: 500px">
			<jsp:include page="../template/footer.jsp"></jsp:include>
			</div>
			
</body>
</html>