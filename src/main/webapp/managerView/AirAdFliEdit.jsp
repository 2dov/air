
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <title>관리자 관리페이지</title>
 <style>
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 70%;
    position: absolute; 
    top:230px;
    left:210px;
    text-align: center;
    border-collapse: 0px;
    border-spacing: 0px;
    
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #60748ba8;
    color: white;
    text-align: center;
    width: 150px;
}

.con_list{
position: absolute;
left:210px;
top: 180px;
width: 100%;

}

.con_list p{

padding-bottom: 5px;
font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
font-weight: bold; 
}

.btns{
position: relative;
left:1025px;
top: -65px;
}

.btns input[type="submit"]{
background-color: black;
border: none;
color: white;
width:70px;
height: 30px;
box-shadow: 50px;
margin-bottom: 10px;
}

 input[type="text"]{
width:100%;
height:30px;
border: none;
text-align: center;
}
</style>
</head> 
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>		<!-- 연관검색어 띄우는 소스 불러오는것/ -->
<script src="../scriptPro/AirAdFliEdit.js" charset="utf-8"></script>		<!-- 각입력란의 제약조건을 AirAdFliEdit.js로 --> 

 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script>
$(function(){
	if($("input#insert").val()=="insert" ){
		//alert("insert okokokokok"); <input type="submit" value="완료" >
		$("p#title").html("운항정보 관리/목록 추가");
		$("input[type=submit]").val("추가완료");
	}else if ($("input#modify").val()=="modify" ){
		//alert("modify okokokokok"); <input type="text"  name="S_NO" id="S_NO"   >
		$("input#S_NO").val("${param.modifysNo}");
		$("input#AL_NO").val("${param.modifyAlNO}");	
		$("input#P_NO").val("${param.modifypNO}");
		$("input#AP_NO").val("${param.modifyApNO}");
		$("input#AP_NO2").val("${param.modifyApNO2}");
		$("input#DEPARTTIME").val("${param.modifyDepartTime}");
		$("input#ARRIVALTIME").val("${param.modifyArrivalTime}");
		$("input#LEAD").val("${param.modifyLead}");
		$("input#COST").val("${param.modifyCost}");
		$("input#SEAT").val("${param.modifySeat}"); 
		
		$("p#title").html("운항정보 관리/목록 수정");
		$("input[type=submit]").val("수정완료");	
		

		
	}// else 
		
		$.ajax({
			url : 'editScheduleLoad.do' ,
			type: 'POST',
			dataType: 'json',
			success : function(v){
				var loadDataALNO = [];
				var loadDataPNO=[];
				var loadDataAPNO=[];
				var loadDataAPNO2=[];
				var loadDataLEAD=[];
				var loadDataCOST=[];
				var loadDataSEAT=[];
				$(v).each(function(index,dom){
					loadDataALNO.push(this.al_no);
					loadDataPNO.push(this.p_no);
					loadDataAPNO.push(this.ap_no);
					loadDataAPNO2.push(this.ap_no2);
					loadDataLEAD.push(this.lead);
					loadDataCOST.push(this.cost);
					loadDataSEAT.push(this.seat);
				});
				
				$("#AL_NO").autocomplete({
					source : loadDataALNO
				});

				$("#P_NO").autocomplete({
					source : loadDataPNO
				});
				
				$("#AP_NO").autocomplete({
					source : loadDataAPNO
				});
				
				$("#AP_NO2").autocomplete({
					source : loadDataAPNO2
				});
				
				$("#LEAD").autocomplete({
					source : loadDataLEAD
				});
				$("#COST").autocomplete({
					source : loadDataCOST
				});
				$("#SEAT").autocomplete({
					source : loadDataSEAT
				});
				
			}, 
			error: function(e){
				alert('error');	
			}
			
		});
		$(function(){
			$("#DEPARTTIME").datepicker({
				dateFormat : 'yy-mm-dd'
			});
			$("#ARRIVALTIME").datepicker({
				dateFormat : 'yy-mm-dd'
			});
			
		});
	
	
	
});

function send() {
	var obj=document.sendForm;
	obj.submit();
}
</script>

<%
String insert=request.getParameter("insert");
String modify=request.getParameter("modify");
String modifysNo=request.getParameter("modifysNo");

/* AirSchedule airSchedule=(AirSchedule)session.getAttribute("infoData"); */

%>
<body class="w3-light-grey">
<jsp:include page="../template/managerHead.jsp"></jsp:include>
<%-- <input type="hidden" id="sno" value="<%=airSchedule.getS_NO()%>">
<input type="hidden" id="pno" value="<%=airSchedule.getP_NO()%>">
<input type="hidden" id="alno" value="<%=airSchedule.getAL_NO()%>">
<input type="hidden" id="apno" value="<%=airSchedule.getAP_NO()%>">
<input type="hidden" id="apno2" value="<%=airSchedule.getAP_NO2()%>">
<input type="hidden" id="departtime" value="<%=airSchedule.getDEPARTTIME()%>">
<input type="hidden" id="arrivaltime" value="<%=airSchedule.getARRIVALTIME()%>">
<input type="hidden" id="lead" value="<%=airSchedule.getLEAD()%>">
<input type="hidden" id="cost" value="<%=airSchedule.getCOST()%>">
<input type="hidden" id="seat" value="<%=airSchedule.getSEAT()%>"> --%>

 	<input type="hidden" name="insert" id="insert" value="${param.insert}">
	<input type="hidden" name="modify" id="modify" value="${param.modify}"> 
	<input type="hidden" name="modify" id="modify" value="${param.modifysNo}"> 
	<div class="w3-content" style="max-width: 1100px; margin-top: 200px; margin-bottom: 200px">
		


<div class="con_list" >
	<p id="title">운항정보 관리/목록 수정</p>
	</div>
<div class="btns">
	<input type="submit" value="완료" onclick="send()" >
</div>
	
 
    
<div class="clear"></div>
	
<%--   <form action="AirAdFli.jsp?insert=<%=insert%>&modify=<%=modify%>&modifysNo=<%=modifysNo %>" name="editForm" method="post"> 		
 --%>
 	<form name="sendForm" id="sendForm" action="insertScheduleList.do" >  



<table id="customers">
 <tr>
 <th>운항번호</th>
 <td><input type="text"  name="S_NO" id="S_NO"   ></td>
</tr> 

<tr>
 <th>항공사코드</th>
 <td>
 <input type="text" class="AL_NO" id="AL_NO" name="AL_NO"  aria-invalid="false" autocomplete="off">
<!--  <input type="text" class="AL_NO" id="AL_NO" name="AL_NO"> -->
 </td>
</tr> 

 <tr>
 <th>비행기코드</th>
 <td>
 <input type="text" class="P_NO" id="P_NO" name="P_NO"  aria-invalid="false" autocomplete="off" ">
<!--  <input type="text" class="P_NO" id="P_NO" name="P_NO"> -->
 </td>
</tr> 

 <tr>
 <th>출발공항코드</th>
 <td>
 <input type="text" class="AP_NO" id="AP_NO" name="AP_NO"  aria-invalid="false" autocomplete="off" ">
<!--  <input type="text" class="AP_NO" id="AP_NO" name="AP_NO"> -->
 </td>
</tr> 

 <tr>
 <th>도착공항코드</th>
 <td>
 <input type="text" class="AP_NO2" id="AP_NO2" name="AP_NO2"  aria-invalid="false" autocomplete="off" ">
<!--  <input type="text" class="AP_NO2" id="AP_NO2" name="AP_NO2"> -->
 </td>
</tr> 

 <tr>
  <th>출발시간</th>
 <td><input type="text" id="DEPARTTIME" name="DEPARTTIME" ></td>
</tr>
 
 <tr>
  <th>도착시간</th>
 <td><input type="text" id="ARRIVALTIME" name="ARRIVALTIME" ></td>
</tr> 

<tr>
<th>소요시간</th>
 <td><input type="text" id="LEAD" name="LEAD" placeholder="hh:mm"></td>
</tr> 

<tr>
<th>가격</th>
 <td><input type="text" id="COST" name="COST"></td>
</tr>

<tr>
<th>좌석수</th>
 <td><input type="text" id="SEAT" name="SEAT"></td>
</tr>

</table>
</form>
</div>
	<div style="margin-top: 500px">
	<jsp:include page="../template/footer.jsp"></jsp:include>
	</div>
</body>
</html>