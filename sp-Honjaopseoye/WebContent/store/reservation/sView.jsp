<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String bang_no = request.getParameter("bang_no");
	String store_no = request.getParameter("store_no");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; UTF-8">
<title>예약하기</title>
</head>
<body>
<%@ include file="../../include/include/subtop.jsp" %>
<script type="text/javascript">
$(document).ready(function () {
	if(<%=bang_no%>==null) {
		//alert("모임방 선택후 예약하기로 접근하셔야 합니다.");
		$("#reserv_bang_x").modal({
			onApprove : function() {
				location.href = "../../main/together/together_main.jsp";
			}
		}).modal('setting', 'closable', false).modal('show');
	} else {
		var param = "bang_no="+<%=bang_no %>;
		$.ajax({
			method:"post",
			data:param,
			url:"../../reservation/sel_bang_store.hon",
			success:function(result) {
				console.log(result);
				
				if(result[0].STORE_IMG!=null) {
					var store_img = result[0].STORE_IMG;
					$("#large_img").attr('src',"/sp-Honjaopseoye/image/storeImg/"+store_img);
				} 
				
				$("#store_name").text(result[0].STORE_NAME);
				$("#store_business").text(result[0].STORE_BUSINESS2);
				$("#store_introduce").text(result[0].STORE_INTRODUCE);
				$("#store_price").text(result[0].STORE_PRICE);
				$("#store_hit").text(result[0].STORE_HIT);
			  	$('.rating').rating({
					initialRating: result[0].STORE_SCORE
				});
				$("#store_keyword").text(result[0].STORE_KEYWORD);
				$("#store_addr").text(result[0].STORE_ADDR);
				$("#store_addr2").text(result[0].STORE_ADDR2);
				$("#store_tel").text(result[0].STORE_TEL);
			}
		});
	}
});
</script>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<div class="ui header" style="margin-left: 150px;margin-right: 150px; margin-top: 100px;margin-bottom: 100px">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ index @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<div class="ui field">
			<div class="ui blue three item inverted top attached tabular menu">
			  <a id="m_reservation" class="item active">
			  	예약하기
			  </a>
			  <a id="m_reserv_list" class="item">
			  	예약조회
			  </a>
			  <a id="m_reserv_history" class="item">
			  	예약내역
			  </a>
			</div>
			<div id="reservation" class="ui blue bottom attached segment">
				<div class="ui stackable two column grid">
					<div class="ui column">
						<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 말머리 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						<div class="ui center aligned basic segment">
						<div class="ui header"><h2 id="store_name">가게이름</h2></div>
							<div class="ui large image">
								<img id="large_img" src="../../image/logo.png" style="width:500px; height:400px;">
							</div>
							<p/>
						</div>
					<div class="ui segment">
						<div class="ui two column grid">
						<div class="row">
								<div class="center aligned column"><h4>업종</h4></div>
								<div class="column"><h4 id="store_business" style="color:green;"></h4></div>
							</div>
						</div>
						<div class="ui divider"></div>
						<div class="row">
						<div class="ui two column grid">
								<div class="center aligned column"><h4>가게소개</h4></div>
								<div class="column"><h4 id="store_introduce" style="color:green;"></h4></div>
							</div>
						</div>
						<div class="ui divider"></div>
						<div class="row">
							<div class="ui two column grid">
								<div class="center aligned column"><h4>가격대</h4></div>
								<div class="column"><h4 id="store_price" style="color:green;"></h4></div>
							</div>
						</div>
						<div class="ui divider"></div>
						<div class="row">
							<div class="ui two column grid">
								<div class="center aligned column"><h4>키워드</h4></div>
								<div class="column"><h4 id="store_keyword" style="color:green;"></h4></div>
							</div>
						</div>
						<div class="ui divider"></div>
						<div class="row">
							<div class="ui two column grid">
								<div class="center aligned column"><h4>히트수</h4></div>
								<div class="column"><h4 id="store_hit" style="color:green;"></h4></div>
							</div>
						</div>
						<div class="ui divider"></div>
						<div class="row">
							<div class="ui two column grid">
								<div class="center aligned column"><h4>별점</h4></div>
								<div class="column">
									<div id="store_score" class="ui massive star rating" data-max-rating="5"></div>
								</div>
							</div>
						</div>
						<div class="ui divider"></div>
						<div class="row">
							<div class="ui two column grid">
								<div class="center aligned column"><h4>지번 주소</h4></div>
								<div class="column"><h4 id="store_addr" style="color:green;"></h4></div>
							</div>
						</div>
						<div class="ui divider"></div>
						<div class="row">
							<div class="ui two column grid">
								<div class="center aligned column"><h4>도로명 주소</h4></div>
								<div class="column"><h4 id="store_addr2" style="color:green;"></h4></div>
							</div>
						</div>
					</div>
				</div>
				<div class="ui column">
					<div class="ui segment">
						<!-- <div class="ui form" id="f_reserv" name="f_reserv"> -->
						<!-- <form id="f_reserv2"> -->
							<%-- <input type="hidden" id="bang_no" name="bang_no" value=<%=bang_no %>>
							<input type="hidden" id="store_no" name="store_no" value=<%=store_no %>> --%>
						<div class="ui two column internally celled padded grid">
							<div class="ui row">
								<div class="ui three wide column">
									<h4>날짜</h4>
								</div>
								<div class="ui column">
								<div class="field">
									<input type="text" id="datepicker" name="reserv_date" placeholder="날짜를 선택하세요.">
								</div>
								</div>
							</div>
							<div class="ui row">
								<div class="ui three wide column">
									<h4>시간</h4>
								</div>
								<div class="ui column">
								<div class="field">
									<div class="ui input">
										<input type="text" id="reserv_time" name="reserv_time" placeholder="시간을 선택하세요." readonly>
									</div>
								</div>
								</div>
							</div>
							<div class="ui row">
								<div class="ui three wide column">
									<h4>선택</h4>
								</div>
								<div class="ui column">
									<button class="ui blue button" value="08:00">08:00</button>
									<button class="ui blue button" value="10:00">10:00</button>
									<button class="ui blue button" value="12:00">12:00</button>
									<button class="ui blue button" value="14:00">14:00</button>
									<div class="ui divider"></div>
									<button class="ui blue button" value="16:00">16:00</button>
									<button class="ui blue button" value="18:00">18:00</button>
									<button class="ui blue button" value="20:00">20:00</button>
									<button class="ui blue button" value="22:00">22:00</button>
								</div>
							</div>
							<div class="ui row">
								<div class="ui three wide column">
									<h4>인원</h4>
								</div>
								<div class="ui column">
								<div class="field">
									<div class="ui selection dropdown">
										<input type="hidden" id="reserv_people" name="reserv_people">
									  	<i class="dropdown icon"></i>
									  		<div class="default text">인원을 선택하세요</div>
									  	<div class="menu">
									    	<div class="item" data-value="1">1명</div>
									    	<div class="item" data-value="2">2명</div>
									    	<div class="item" data-value="3">3명</div>
									    	<div class="item" data-value="4">4명</div>
									    	<div class="item" data-value="5">5명</div>
									    	<div class="item" data-value="6">6명</div>
									    	<div class="item" data-value="7">7명</div>
									    	<div class="item" data-value="8">8명</div>
									    	<div class="item" data-value="9">9명</div>
									    	<div class="item" data-value="10">10명</div>
									  	</div>
									</div>
								</div>
								</div>
							</div>
							<div class="ui row">
								<button class="ui green fluid submit button" id="btn_reserv">예약하기</button>
							</div>
							</div>
						<!-- </form> -->
						<!-- </div> -->
						<div class="ui mini modal">
						  <div class="header">예약하기</div>
						  <div class="content">
						    <p>예약이 완료되었습니다.</p>
						    <p>예약 조회페이지로 이동하시겠습니까?</p>
						  </div>
						  <div class="actions">
						    <div class="ui ok red button">확인</div>
						    <div class="ui cancel green button">닫기</div>
						  </div>
						</div>
					</div>					
					<div class="ui row">
						<div class="ui segment">
							<h3 style="color:red">* 중요사항 : 온라인상으로 룸 좌석 확정이 어려우며, 매장상으로 유선상 확인이 필요합니다.</h3>
							<h4>자세한 내용은 업체로 문의주세요.</h4>
							<div class="ui two column grid">
							<div class="row">
								<div class="four wide column">업체 문의 전화번호 :</div>
								<div class="left aligned column">
									<div id="store_tel" style="color:green;"></div>
								</div>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="ui basic modal" id="reserv_bang_x">
  <div class="ui icon header">
    <i class="question circle outline icon"></i>
   	 <h1>알림</h1>
  </div>
  <div class="content">
    <h2>모임방을 먼저 선택 후 예약하기로 접근하셔야 합니다.</h2>
    <h2>모임방으로 이동합니다.</h2>
  </div>
  <div class="actions">
    <div class="ui green ok inverted button">
      <i class="checkmark icon"></i>
      	확인
    </div>
  </div>
</div>
<script type="text/javascript">
$(function() {
	$("#datepicker").datepicker({
	  dateFormat: 'yy-mm-dd',
	  prevText: '이전 달',
	  nextText: '다음 달',
	  monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	  dayNames: ['일','월','화','수','목','금','토'],
	  dayNamesShort: ['일','월','화','수','목','금','토'],
	  dayNamesMin: ['일','월','화','수','목','금','토'],
	  showMonthAfterYear: true,
	  changeMonth: true,
	  changeYear: true,
	  yearSuffix: '년',
	  minDate: +1,
	  maxDate: "+2Y"
	});
});
$('.dropdown').dropdown();
$('.blue.button').click(function () {
	var time = $(this).val();
	$("#reserv_time").attr('value', time);
});
$(".tiny.image").click(function () {
	var value = $(this).attr('src');
	$("#large_img").attr('src',value);
});
$("#btn_reserv").click(function () {
	if($("#datepicker").val()=='') {
		alert("날짜를 입력하세요");
	} else if($("#reserv_time").val()=='') {
		alert("시간을 입력하세요");
	} else if($("#reserv_people").val()=='') {
		alert("인원을 입력하세요");
	} else {
		//var bang_no = $("#bang_no").val();
		//var store_no = $("#store_no").val();
		var reserv_date = $("#datepicker").val();
		var reserv_time = $("#reserv_time").val();
		var reserv_people = $("#reserv_people").val();
		var param = "bang_no="+<%=bang_no%>+"&store_no="+<%=store_no%>+
					"&reserv_date="+reserv_date+"&reserv_time="+reserv_time+"&reserv_people="+reserv_people;
		//alert(param);
		$.ajax({
			method:"GET",
			url: "../../reservation/insert.hon",
			data: param,
			success: function(data){
				//alert(data);
				//alert("예약성공 조회페이지로 이동합니다.");
				$('.mini.modal').modal({
		    	    onApprove : function() {
		    	    	location.href="./reserv.jsp";
		    	    }
		    	  }).modal('show');
			},
			error:function(xhrObject){
				alert("예약실패!!모임방 방장만 예약가능합니다.");
				alert(xhrObject.responseText);
		  	}
		});
	}
});
$(".menu").find('a').click(function() {
	$(".menu").find('a').attr('class','item');//active 초기화
	$(this).attr('class','item active');//누른메뉴 active로 변경
	if($(this).attr('id')=='m_reservation'){
		$("#reservation").show();
	}
	else if($(this).attr('id')=='m_reserv_list'){
		location.href="./reserv.jsp";
	}
	else if($(this).attr('id')=='m_reserv_history'){
		location.href="./reserv_history.jsp";
	}
});
</script>
<style>
.ui-datepicker{ font-size: 20px; width: 350px; }
.ui-datepicker select.ui-datepicker-month{ width:40%; font-size: 20px; }
.ui-datepicker select.ui-datepicker-year{ width:50%; font-size: 20px; }
</style>
<%@ include file="../../include/include/bottom.jsp" %>
</body>
</html>