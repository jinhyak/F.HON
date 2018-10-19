<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String mem_id = request.getParameter("mem_id");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var map;
</script>
</head>
<body>
 <%@ include file="../../include/include/commonUI.jsp" %>
<script>
 $(document).ready(function(){
	$('.ui.dropdown').dropdown();
})
	function addr_confirm(){
		var addr = $('#result_address').val()+" "+$('#detail_address').val()
		$('#store_addr').attr('value',addr);
		$('.modal')
		.modal('hide');
	}
	function cancel(){
		$('.modal')
		.modal('hide');
	}
	/* -------------------------------------------------지도 script코드 시작-------------------------------------*/
</script>
<!--   -------------------------------------------------지도 script코드 끝-------------------------------------*/ -->
<div class="ui segment">
		<!--=================================방 이름 등록=========================  -->
		<div class="ui aligend center large header"> 모임 만들기 창 </div>
		<div class="ui divider"></div>
		<div class="ui labeled input" style="width:100%;">
  			<div class="ui label">
   				<h2>모임 이름</h2>
  			</div>
  			<input type="text" id="bang_name" name="bang_name" placeholder="ex)산악회">
		</div>
		<div class="ui divider"></div>
		<!--=================================방 분류 등록=========================  -->
		<div class="ui label">
			<h2>분류</h2>
		</div>
		<div class="ui dropdown" id="bang_gubun" name="bang_gubun">
 			<input type="hidden" id="bang_gubun">
  				<i class="dropdown icon"></i>
  				<div class="default text">업종</div>
  			<div class="menu">
    			<div class="item" data-value="1">술집</div>
    			<div class="item" data-value="2">놀곳</div>
    			<div class="item" data-value="3">먹을곳</div>
  			</div>
		</div>
		<div class="ui divider"></div>
		<!-- ===========================가격대 등록===================================== -->
		<div class="ui label">
			<h2>1인당 금액대</h2>
		</div>
		<div class="ui dropdown">
 			<input type="hidden" name="bang_money" id="bang_money">
  				<i class="dropdown icon"></i>
  				<div class="default text">1인당 금액대</div>
  			<div class="menu">
    			<div class="item" data-value="10000">~1만원</div>
    			<div class="item" data-value="20000">1만원~2만원</div>
    			<div class="item" data-value="30000">2만원~3만원</div>
    			<div class="item" data-value="500000">3만원~5만원</div>
    			<div class="item" data-value="100000">5만원~10만원</div>
    			<div class="item" data-value="200000">10만원~20만원</div>
    			<div class="item" data-value="400000">30만원~50만원</div>
  			</div>
		</div>
		<div class="ui divider"></div>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 나이대 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
		<div class="ui label">
			<h2>나이대</h2>
		</div>
		<div class="ui dropdown">
 			<input type="hidden" name="bang_age" id="bang_age">
  				<i class="dropdown icon"></i>
  				<div class="default text">나이대</div>
  			<div class="menu">
    			<div class="item" data-value="3100">10대</div>
    			<div class="item" data-value="3101">20대</div>
    			<div class="item" data-value="3102">30대</div>
    			<div class="item" data-value="3103">40대</div>
    			<div class="item" data-value="3104">50대</div>
    			<div class="item" data-value="3105">60대이상</div>
  			</div>
		</div>
		<div class="ui divider"></div>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  성별    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
		<div class="ui label">
			<h2>성별</h2>
		</div>
		<div class="ui dropdown" id="gender">
 			<input type="hidden" name="bang_gender" id="bang_gender">
  				<i class="dropdown icon"></i>
  				<div class="default text">성별</div>
  			<div class="menu">
    			<div class="item" data-value="1300">남성만</div>
    			<div class="item" data-value="1301">여성만</div>
    			<div class="item" data-value="1302">혼성</div>
  			</div>
		</div>
		<div class="ui divider"></div>
		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 관심사 등록 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<div class="ui label">
			<h2>관심사</h2>
		</div>
		<div class="ui dropdown" >
 			<input type="hidden" name="bang_topic"id="bang_topic">
  				<i class="dropdown icon"></i>
  				<div class="default text">관심사</div>
  			<div class="menu">
    			<div class="item" data-value="3200">운동</div>
    			<div class="item" data-value="3201">영화</div>
    			<div class="item" data-value="3202">음악</div>
    			<div class="item" data-value="3203">춤</div>
    			<div class="item" data-value="3204">독서</div>
    			<div class="item" data-value="3205">조립|제작</div>
    			<div class="item" data-value="3206">여행</div>
    			<div class="item" data-value="3207">레저</div>
    			<div class="item" data-value="3208">미술</div>
    			<div class="item" data-value="3209">친목</div>
    			<div class="item" data-value="3210">맛집</div>
    			<div class="item" data-value="3211">연애</div>
    			<div class="item" data-value="3212">미디어</div>
    			<div class="item" data-value="3213">취업|창업</div>
    			<div class="item" data-value="3214">게임</div>
  			</div>
		</div>
		<div class="ui divider"></div>
		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 시간 등록 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<div class="ui label">
			<h2> 모임 시간</h2>
		</div>
		<div class="ui dropdown" >
 			<input type="hidden" name="bang_time"id="bang_time">
  				<i class="dropdown icon"></i>
  				<div class="default text">시간</div>
  			<div class="menu">
    			<div class="item" data-value="3300">오전 00:00</div>
    			<div class="item" data-value="3301">오전 01:00</div>
    			<div class="item" data-value="3302">오전 02:00</div>
    			<div class="item" data-value="3303">오전 03:00</div>
    			<div class="item" data-value="3304">오전 04:00</div>
    			<div class="item" data-value="3305">오전 05:00</div>
    			<div class="item" data-value="3306">오전 06:00</div>
    			<div class="item" data-value="3307">오전 07:00</div>
    			<div class="item" data-value="3308">오전 08:00</div>
    			<div class="item" data-value="3309">오전 09:00</div>
    			<div class="item" data-value="3310">오전 10:00</div>
    			<div class="item" data-value="3311">오전 11:00</div>
    			<div class="item" data-value="3312">오전 12:00</div>
    			<div class="item" data-value="3313">오후 01:00</div>
    			<div class="item" data-value="3314">오후 02:00</div>
    			<div class="item" data-value="3315">오후 03:00</div>
    			<div class="item" data-value="3316">오후 04:00</div>
    			<div class="item" data-value="3317">오후 05:00</div>
    			<div class="item" data-value="3318">오후 06:00</div>
    			<div class="item" data-value="3319">오후 07:00</div>
    			<div class="item" data-value="3320">오후 08:00</div>
    			<div class="item" data-value="3321">오후 09:00</div>
    			<div class="item" data-value="3322">오후 10:00</div>
    			<div class="item" data-value="3323">오후 11:00</div>
    			<div class="item" data-value="3324">오후 12:00</div>
  			</div>
		</div>
		<div class="ui divider"></div>
		<!-- =========================== 만남장소(가게등록)등록 시작 ============================ -->
		<div class="ui labeled icon input" style="width:100%;">
  			<div class="ui label">
   				<h2>모임 장소 등록</h2>
  			</div>
  			<input type="text" id="store_address" readonly="readonly"
				  placeholder="모임 장소가 입력되지 않았습니다">
				 <div class="ui icon button" onclick="locationInput()" style="padding-top: 20px; width:100px;">
				  	<i class="plus icon"></i>
				 </div>
		</div>
		<div class="ui divider"></div>
		<!--=============================== 모임소개 등록  ======================== -->
		<div class="ui labeled input" style="width:100%;">
  			<div class="ui label">
   				<h2>모임 한줄 소개</h2>
  			</div>
  			<input type="text" placeholder="ex)모임 소개를 입력해주세요" id="bang_memo" name="bang_memo">
		</div>
		<div class="ui divider"></div>
		<!-- ============================= 모임 날짜 등록 ========================= -->
			<div class="ui two column internally celled padded grid">
							<div class="ui row">
								<div class="ui three wide column">
									<h4> 모임 날짜 </h4>
								</div>
								<div class="ui column">
								<div class="field">
									<input type="text" id="datepicker" name="bang_date" placeholder="날짜를 선택하세요.">
								</div>
								</div>
							</div>
							<div class="ui row">
								<div class="ui three wide column">
									<h4> 최대 인원 </h4>
								</div>
								<div class="ui column">
								<div class="field">
									<div class="ui selection dropdown" tabindex="0">
										<input type="hidden" id="bang_limit_people" name="bang_limit_people">
									  	<i class="dropdown icon" tabindex="0"><div class="menu" tabindex="-1"></div></i>
									  		<div class="default text">인원을 선택하세요</div>
									  	<div class="menu transition hidden" tabindex="-1">
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
							</div>		
		<div class="ui divider"></div>
		<div class="ui basic center aligned segment">
			<button class="ui primary button" id="sendbutton" onclick="gogogo()">
  			등록
  			</button>
			<button class="ui button" onclick="win_close();">
  			취소
			</button>
		</div>
</div>
<!-- =========================================지도 모달 시작==================================== -->
<div class="ui modal" id="modal_location">
	<i class="close icon"></i>
	<div class="header">
			<h3>모임 장소 찾기~</h3>
	</div>
	<div class="content">
		<div class="body">
			<div class="ui basic segment container"
			style="padding-top: 0px;padding-bottom: 0px;">
			<!--========주소 검색 버튼========  -->
			<div class="ui action input">
 				<input type="text" placeholder="모임 장소 검색" id="search_addr">
  				<button class="ui button" id="addr_btn">검색</button>
			</div>
			<!--========주소 검색 버튼 끝========-->
			<div class="ui basic right floated segment"
			style="margin-top: 0px;padding-right: 0px;margin-right:
			0px;padding-top: 0px;margin-bottom: 0px;">
				<div class="ui pointing below big label">
      				매장찾기!!!~~~
    			</div>
    		</div>
			<div class="ui divider"></div>
			<!-- ==========지도 세그먼트 =========-->
  			<div class="ui top attached segment pushable"style="height: 400px;">
	  		<!--======= 지도 시작 =======-->
		      	<div id="map" style="width:100%;height:400px;"></div>
  			<!--======= 지도 끝  =======-->
  			</div>
  			<!-- ==========지도 세그먼트 끝=========-->
  			<div class="ui divider"></div>
			<!-- ==========버튼과 인풋 =========--> 
  			<div class="ui labeled input" style="width:100%;">
  				<div class="ui label">
    			주소  
    			</div>
    			<input type="text" placeholder="모임 장소 주소"readonly="readonly" id="address">
			</div>
			<div class="ui labeled input" style="width:100%;padding-top: 5px;">
  			<div class="ui label">
   				가게 이름
  			</div>
  			<input type="text" placeholder="가게 이름" readonly="readonly" id="name">
	  			<div class="ui primary button" onclick="confirm()" style="margin-left: 3px;">
  				확인
  				</div>
  				<div class="ui primary button" onclick="cancel()"style="margin-right: 0px;">
  				취소	
				<input type="hidden" id="store_no">
  				</div>
			</div>
			<!-- ==========버튼과 인풋 끝=========-->
			</div>
		</div>
	</div>
</div>
<script>
	function gogogo(){
		console.log("인설트 성공");
		var bang_li = $('#bang_limit_people').val();
		var bang_address = $('#store_address').val();
		var bang_time = $("#bang_time").val();
		var bang_date = $('#datepicker').val();
		var bang_memo = $('#bang_memo').val();
		var bang_name = $('#bang_name').val();
		var bang_gubun = $('#bang_gubun').val();
		var bang_money = $("#bang_money").val();
		var bang_age = $("#bang_age").val();
		var bang_gender = $("#bang_gender").val();
		var bang_topic = $("#bang_topic").val();
		var store_no = $("#store_no").val();
		var mem_id = '<%=mem_id%>';
		alert(store_no)
		var param = "bang_limit_people="+bang_li+"&bang_address="+bang_address+"&bang_time="+bang_time+
				    "&bang_date="+bang_date+"&bang_memo="+bang_memo+"&bang_name="+bang_name+
				    "&bang_gubun="+bang_gubun+"&bang_money="+bang_money+"&bang_age="+bang_age+
				    "&bang_gender="+bang_gender+"&bang_topic="+bang_topic+"&store_no="+store_no+"&mem_id="+mem_id;
		$.ajax({
			data:param,
			url:"../../group/groupInsert.hon",
			method:"get",
			success:function(data){
				if(data==1){
					alert("모임방을 개설하셨습니다.")
					window.opener.location.reload();
					window.close();
				}
				else{
					alert("방 만들기 실패");
				}
			}
		})
	}
	function win_close(){
		self.close();
	}
	function confirm(){
	}
	function cancel(){
		$("#modal_location").modal('hide');
	} 
	function locationInput(){
		cmm_window_popup("./maps.jsp", 600, 600, "모임 장소 등록");
	}
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
	$('.dropdown').dropdown();
	$('.blue.button').click(function () {
		var time = $(this).val();
		$("#bang_time").attr('value', time);
	});
</script>

</body>
</html>