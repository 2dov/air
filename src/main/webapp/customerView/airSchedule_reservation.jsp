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
	function myFunction(id) {
		var x = document.getElementById(id);
		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
			x.previousElementSibling.className = x.previousElementSibling.className
					.replace("w3-black", "w3-red");
		} else {
			x.className = x.className.replace(" w3-show", "");
			x.previousElementSibling.className = x.previousElementSibling.className
					.replace("w3-red", "w3-black");
		}
	}
	$(document).ready(function() {
		$("button#reservation").click(function() {
			if ($("input#check").prop("checked")) {
				$("form#frm").submit();
				return false;
			} else {
				$("div#message").html("<font color='red'>일반 규정 및 요금 규정에 동의해주세요.</font>");
				return false;
			}

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
				<!-- 가는편 -->
				<div class="panel panel-primary" id="departList"
					style="border-color: #f44336">
					<div class="panel-heading" style="background-color: #f44336">
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
									<td>${departList.al_no}</td>
									<td>${departList.ap_no }</td>
									<td>${departList.departtime }</td>
									<td>${departList.lead }</td>
									<td>${departList.ap_no2 }</td>
									<td>${departList.arrivaltime }</td>
									<td>${departList.cost }원</td>
								</tr>

							</table>
						</div>
					</div>

				</div>
				<br>
				<!-- 오는편 -->
				<c:if test="${way=='roundtrip'}">
					<div class="panel panel-primary" id="departList"
						style="border-color: #f44336">
						<div class="panel-heading" style="background-color: #f44336">
							<h3 class="panel-title">오는편 RETURN</h3>
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
										<td>${returnList.al_no}</td>
										<td>${returnList.ap_no }</td>
										<td>${returnList.departtime }</td>
										<td>${returnList.lead }</td>
										<td>${returnList.ap_no2 }</td>
										<td>${returnList.arrivaltime }</td>
										<td>${returnList.cost }원</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</c:if>
				<br> <br>

				<!-- 총 예상요금 정보 -->
				<div class="panel panel-primary" id="departList"
					style="border-color: #8C8C8C">
					<div class="panel-heading" style="background-color: #8C8C8C">
						<h3 class="panel-title">총 예상 요금 COST</h3>
					</div>
					<div class="panel-body">
						<div class="col-md-14">
							<table class="table table-striped custab"
								style="margin-top: 10px; margin-bottom: 10px;">
								<thead>
									<tr style="margin: 5px">
										<th>인원</th>
										<th>항공운임</th>
										<th>유류할증료</th>
										<th>제세공과금</th>
										<th>발권대행수수료</th>
										<th>할인</th>
										<th>합계</th>
									</tr>
								</thead>
								<tr style="margin-top: 3px">
									<c:choose>
										<c:when test="${way=='roundtrip'}">
											<td>${persons}</td>
											<td>${(returnList.cost + departList.cost)*persons-10000-((((returnList.cost + departList.cost)*persons-10000)-(((returnList.cost + departList.cost)*persons-10000)*0.1))*0.05)-(((returnList.cost + departList.cost)*persons-10000)*0.1)}원</td>
											<td>${(((returnList.cost + departList.cost)*persons-10000)-(((returnList.cost + departList.cost)*persons-10000)*0.1))*0.05}원</td>
											<td>${((returnList.cost + departList.cost)*persons-10000)*0.1}원</td>
											<td>10000원</td>
											<td></td>
											<td><font color="red">${(returnList.cost + departList.cost)*persons}</font>원</td>
										</c:when>
										<c:otherwise>
											<td>${persons}</td>
											<td>${(departList.cost)*persons-10000-((((departList.cost)*persons-10000)-(((departList.cost)*persons-10000)*0.1))*0.05)-(((departList.cost)*persons-10000)*0.1)}원</td>
											<td>${(((departList.cost)*persons-10000)-(((departList.cost)*persons-10000)*0.1))*0.05}원</td>
											<td>${((departList.cost)*persons-10000)*0.1}원</td>
											<td>10000원</td>
											<td></td>
											<td><font color="red">${departList.cost*persons}</font>원</td>
										</c:otherwise>
									</c:choose>
								</tr>

							</table>
						</div>
					</div>
				</div>
				<br> <br>
				<!-- 탑승자 정보 -->
				<div class="panel panel-primary" id="departList"
					style="border-color: #8C8C8C">
					<div class="panel-heading" style="background-color: #8C8C8C">
						<h3 class="panel-title">탑승자 정보 입력 PASSENGERS INFO</h3>
					</div>
					<div class="col-md-14" style="margin-left: 10px">
						<br> - 탑승객 영문이름, 생년월일, 성별 기재 시 주의사항<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 탑승자의 영문이름, 생년월일, 성별은 여권과 동일해야 하며,
						예약 후 이름 변경이 불가하며 동일하지 않을 경우 탑승이 거절될 수 있습니다.<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 나중 등록 / 임의 등록 등 오입력으로 여권 정보가 다르거나
						누락된 경우 또는 분실 신고된 여권, 이미 사용된 단수 여권 정보 등 <br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;본인 여권 관련 문제의 경우 항공편 탑승 및
						현지 입국이 거절될 수 있으며 이에 대해서 당사는 책임지지 않습니다.<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 정확한 본인 영문 이름은 민원24(나의 생활정보 & 처리해야할
						생활정보)에서 확인할 수 있습니다.<br>
					</div>
					<div class="panel-body">
						<div class="col-md-14">
							<table class="table table-striped custab"
								style="margin-top: 10px; margin-bottom: 10px;">
								<thead>
									<tr style="margin: 5px">
										<th>NO</th>
										<th>한글 이름</th>
										<th>영문 이름</th>
										<th>영문 성</th>
										<th>생년월일</th>
									</tr>
								</thead>
								<form action="appointInsert.do" id="frm" method="POST">
								<c:forEach varStatus="i" begin="1" end="${persons}" step="1">
									<tr style="margin-top: 3px">
										<td>${i.count}</td>
										<td><input name="hanname${i.count}" type="text"></td>
										<td><input name="firstname${i.count}" type="text"></td>
										<td><input name="lastname${i.count}" type="text"></td>
										<td><input name="birth${i.count}" type="text"></td>
									</tr>
								</c:forEach>
									<input name ="returnSchedule" type="hidden" value="${returnS_no}">
									<input name ="departSchedule" type="hidden" value="${departS_no}">
									<input name ="persons" type="hidden" value="${persons}">
								</form>
							</table>
						</div>
					</div>
				</div>
				<br> <br>
			</div>
			<h4>일반규정 및 요금규정</h4>
			<p>
				<input type="checkbox" id="check"> 모든 항공권 규정을 확인 및 동의합니다. <font
					color="red">[필수]</font>
			</p>

			<button onclick="myFunction('Demo1')"
				class="w3-button w3-block w3-gray w3-left-align"
				style="border-color: black; border: 1px">일반규정</button>
			<div id="Demo1" class="w3-hide w3-container">
				<p>
					<br> - 결제 시한<br> 1) 마이페이지의 결제시한은 항공사 결제시한에 의해 앞당겨 질 수 있으며
					결제시한 이후에는 요금이 인상될 수 있습니다.<br> 2) 여행사의 결제시한은 실제 이용하는 항공사의
					결제시간과는 다를수 있으며, 여행사 결제시한이 우선 적용되므로 이로써 발생되는 문제건에 대해서는 책임지지 않으므로 유의해
					주시기 바랍니다. <br> 3) 예약 후 결제시한이 주말(토/일)인 경우에는 오후 2시 전까지만 발권이
					가능하오니 결제를 서둘러 주시기 바라며 일요일을 제외한 공휴일인 경우에는 발권업무가 없으므로 미리 확인하시어 전날
					17시까지 결제 요청해 주시기 바랍니다.(※ 이중결제로 인해 발생되는 모든 비용은 여행사에서 책임질 수 없음)<br>
					4) 결제요청 후 취소요청 시에는 시간에 상관없이 바로 환불진행으로 반영되오니 업무시간 이내에 꼭 결제요청 및 취소요청
					진행을 해주시기 바랍니다.(이점 유의하셔서 결제요청 부탁드립니다.)<br> 5) 해외발행 카드는 결제가
					불가능합니다. <br> 6) 발권한 전자항공권(e-ticket)은 메일로 전송됩니다.<br> <br>
					- 예약<br> 1) 귀국시 현지에서 해당 항공사로 72시간 전에 재확인하셔야 됩니다. (현지에서 미확인시
					자동으로 예약이 취소될 수 있습니다.) 또한 항공사 사정에 따라 운항일정 변경이나 취소가 발생할 수 있으니 출/귀국전에
					스케쥴을 확인해 주시기 바랍니다. 항공사 사정에 의해 변경된 운항일정을 재확인하지 않아 발생한 문제에 대해서 여행사에서는
					책임 지지 않습니다. <br> 2) NO-SHOW로 인해 발생한 피해는 책임지지 못하므로 사전에 규정 확인하시어
					날짜변경을 해주시기바랍니다. (NO-SHOW란? 출발2일전까지 예약변경이나 취소 없이, 공항에 나가지 않는 것을
					의미합니다. 항공사에 따라 상이할 수 있음)<br>3) 항공사 규정상 이중(중복)예약을 하는 경우(날짜와 도시가
					다르더라도 동일항공사의 예약)에 사전 경고 없이 모든 예약이 취소되므로 주의하여 주시기 바랍니다. 특히, 발권 후에도
					이중(중복)예약이 있는 경우에는 사전 경고없이 모든 예약취소, 탑승수속거부, 추가운임징수 등의 문제가 발생되므로 주의하여
					주시기 바랍니다. <br>4) 모든 경유지의 체류여부는 발권 전에 결정하셔야 하며, 발권 후에는 변경이
					불가능합니다. (체류여부 요청은 빠른항공예약상담을 이용하여 주시기 바랍니다.) <br>5) 오픈예약은 미확보
					좌석으로, 성수기에는 귀국편 예약이 어려우므로 오픈예약을 삼가 주시기 바랍니다. 귀국일 오픈 예약 또는 귀국일을 예약하신
					분이더라도 귀국일 예약/변경시 동일조건 요금의 좌석이 없을경우 동일한 일반석 이더라도 높은요금의 좌석으로 이용하시는 경우
					추가요금 및 재발행 수수료가 부과됩니다. 단, 차액금을 지불하더라도 변경이 불가한 조건의 항공권이 있을수 있습니다. <br>6)
					발권 후에는 출도착 도시, 항공사 및 영문이름 변경이 절대 불가하오니, 발권 전에 확인하시기 바랍니다. <br>7)
					발권된 항공권은 타인에게 양도가 되지 않습니다. <br>8) 발권된 티켓사용은 반드시 첫 번째 여정부터 순서대로
					사용하셔야 하며 순서대로 이용하지 않은 항공권은 취소처리 됩니다. <br>9) 인천출발 전 날짜를 변경할 경우
					차액분은 아래와 같이 징수 됩니다. 구매하신 요금이 규정상 변경가능한 항공권일 경우에만 해당됩니다. (단, 동일 시즌내
					및 유효기간내 좌석이 있을 경우에만 변경 가능) <br>&nbsp;▶ 항공료 차액 인상 변경시점에서 발생되는
					항공 요금 인상 금액+텍스차액징수+항공사 수수료가 발생합니다. <br>&nbsp;▶ 항공료 차액 인하 변경시점에
					항공권의 금액이 구입한 항공권의 금액보다 낮아질경우에는 차액 은 환불 불가합니다. <br>10) 예약변경 및
					환불은 구매한 여행사에서 신청하셔야 하며 고객님께서 직접 해당 항공사에 예약 변경 및 환불하여 발생하는 문제는 여행사에서
					처리 불가합니다. (단, 중국 노선은 게시판이나 전화연결이 어려울 경우 해당 항공사로 연락 하시어 항공권 번호를
					말씀하시고 예약 및 변경부탁드립니다) <br>11) 예약변경 후 관련내용을 담당자들이 메일을 발송하고 있으나
					확인하지 못한 메일 내용으로 발생한 문제는 책임질 수 없습니다. <br>12) 항공권 이용시 출/도착지의
					'썸머타임제' 시행으로 인해 시간대가 1시간씩 앞당겨지거나 늦춰지는 경우가 발생하므 로 해당국의 썸머타임 기간을 사전에
					꼭 확인하시어 고객님의 일정에 문제가 되지 않도록 주의해 주시기 바랍니다. <br>13) 항공사 시스템상 탑승일
					조회는 예약일로부터 330일까지만 조회가 가능합니다. 330일 이후 항공권 조회가 불가하여 임의의 날짜로 예약 후
					구매하시더라도, 귀국일 변경 또는 재발행시 항공사에서 지정한 수수료가 부과되오니 양해바랍니다. <br>14)
					임신부 또는 유아를 동반한 임신부 승객은 임신 기간, 예정일에 따라 항공사별 증빙서류 및 탑승 여부의 규정이 상이할 수
					있으니 예약 후 결제전 톡집사로 문의 바랍니다.
				</p>
			</div>

			<button onclick="myFunction('Demo2')"
				class="w3-button w3-block w3-gray w3-left-align">발권 동의 확인</button>
			<div id="Demo2" class="w3-hide w3-container">
				<p>
					<br>예약정보 확인 내용<br> <br> 1. 예약 일정 중 날짜/경유지/공항을
					확인하셨습니까?<br> 2. 탑승객 영문 이름이 여권과 일치 합니까?<br> 3. 입력하신 탑승객의
					생년월일이 확실 합니까?<br> 4. 탑승객의 여권유효기간이 출국일로부터 6개월 이상 남아 있습니까?<br>
					5. 예약하신 항공요금의 요금 규정은 확인하셨습니까?<br> 6. 경유지나 도착지 비자는 확인하셨습니까? <br>
					- 편도여정으로 항공권을 구입하실 경우에는 상대편 입국 국가의 비자를 반드시 소지하고 계셔야 하며, 비자를 소지하지 않은
					경우에는 해당 국가로의 출국이 거부됩니다.<br> - 경유지라도 비자가 필요한 경우가 있으니 출발 전에
					확인하시기 바랍니다.<br> 7. 입력하신 여권 정보가 정확한지 확인 하셨습니까? <br> - 미입력,
					오입력 등에 따른 문제 발생 시 당사에서 책임지지 않습니다.<br> 8. 신용카드 결제 시 항공료와
					발권대행수수료가 각각 결제되므로 2번의 승인이 진행됩니다.<br> (발권대행수수료는 총 요금에 포함되어
					있습니다.)<br> <br> 발권 동의 확인 내용<br> <br> * 결제 시
					발권대행수수료가 부과됩니다. (탑승객별 부과)<br> - 발권대행수수료란 항공권 예약, 상담, 발권 대행 업무로
					받는 취급수수료 입니다. (발권대행수수료는 환불되지 않습니다.)<br> - 항공권 결제 후 발권대행수수료는
					인터파크로 별도 승인되며 일시불 결제됩니다.<br> - 예약 내용 변경 시 요금이 인상될 수 있으며, 항공사
					사정이나 환율에 의해서도 사전공지 없이 변경될 수 있습니다.<br> - 항공권은 타인에게 양도할 수 없으며,
					탑승객의 이름 변경이 불가능한 경우도 있습니다.<br> - 예약 시 다른 항공사로 2-3개의 예약은 하실 수
					있으나 동일한 항공사로 중복 예약하시면 항공사에서 예약을<br> 임의로 취소할 수 있습니다.<br> -
					항공권 환불이나 항공권 재발행 시 여행사 수수료(요금규정확인)가 부과됩니다.<br> (단, 영문 이름 변경으로
					인한 재발행 시 여행사 수수료 징수대상에서 제외)<br> - 결제 요청 및 완료 후에는 결제 수단 및 할부 개월
					변경이 불가능합니다.<br> - 본인은 항공 예약 규정 및 예약의 변경/취소/환불/재발행 관련 위약금 등 요금
					규정을 숙지하였으며, 이를 수용하는 조건으로 예약을 진행할 것임을 확인합니다.
				</p>
			</div>
			<br> <br> <br>
			<div id="message"></div>
			<br>
			<button class="w3-button w3-block w3-red" id="reservation">예약하기</button>
			<br> <br>
		</div>
	</div>
	</div>
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>