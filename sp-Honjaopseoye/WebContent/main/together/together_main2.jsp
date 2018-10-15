<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../../include/include/subtop.jsp" %>
<script type="text/javascript">
var x =[];
var y =[];
</script>
</head>
<body>
<div class="ui basic segment" style="margin-top:30px;"><!-- big segment -->
	<div class="ui basic segment grid">
			<div class="ui multiple selection dropdown">
				<input type="hidden" value="0" id="bang_gubun" name="bang_gubun"> <i class="dropdown icon"></i>
			<div class="text" id="gubun">분류</div>
				<div class="menu">
					<div class="item" data-value="1">놀놀</div>
					<div class="item" data-value="2">밥밥</div>
					<div class="item" data-value="3">술술</div>
				</div>
			</div>
			<div class="ui multiple selection dropdown">
				<input type="hidden" value="0" id="bang_age"name="bang_age"> <i class="dropdown icon"></i>
			<div class="text" id="age">나이대</div>
				<div class="menu">
					<div class="item" data-value="3100">10대</div>
					<div class="item" data-value="3101">20대</div>
					<div class="item" data-value="3102">30대</div>
					<div class="item" data-value="3103">40대</div>
					<div class="item" data-value="3104">50대</div>
					<div class="item" data-value="3105">60대이상</div>
				</div>
			</div>
			<div class="ui multiple selection dropdown">
				<input type="hidden" value="0" id="bang_gender" name="bang_gender"> <i class="dropdown icon"></i>
			<div class="text" id="age">성별</div>
				<div class="menu">
					<div class="item" data-value="1300">남성만</div>
					<div class="item" data-value="1301">여성만</div>
					<div class="item" data-value="1302">혼성</div>
				</div>
			</div>
			<div class="ui multiple selection dropdown">
				<input type="hidden" value="0" id="bang_money" name="bang_money"> <i class="dropdown icon"></i>
			<div class="text" id="money">금액대</div>
				<div class="menu">
					<div class="item" data-value="1">~3만원</div>
					<div class="item" data-value="3">3만원~5만원</div>
					<div class="item" data-value="5">5만원~10만원</div>
					<div class="item" data-value="10">10만원~15만원</div>
					<div class="item" data-value="15">15만원~20만원</div>
					<div class="item" data-value="20">20만원~30만원</div>
					<div class="item" data-value="40">30만원~50만원</div>
				</div>
			</div>
			<div class="ui multiple selection dropdown">
				<input type="hidden" value="0" name="bang_limit_people" id="bang_limit_people"> <i class="dropdown icon"></i>
			<div class="text">최대 인원</div>
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
			<div class="ui multiple selection dropdown">
				<input type="hidden" value="0" name="bang_topic" id="bang_topic"> <i class="dropdown icon"></i>
			<div class="text">관심사</div>
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
			<div class="ui category search">
			  <div class="ui icon input">
			    <input class="prompt" type="text" placeholder="Search animals...">
			    <i class="search icon"></i>
			  </div>
			  <div class="results"></div>
			</div>
			<div class="ui right floated input">
				<button type="button" class="ui medium active button" style="width:180px" onclick="g_create()"><i class="user icon"></i>모임 만들기</button>
			</div>
			<div id="map" style="width:78%;height:850px;"></div>
			<div style="width:22%">
				<div class="ui segment">
					<div class="ui grid">
						<div class="four wide column">
							ㅗㅑㅗㅑㅗ
						</div>
						<div class="four wide column">
							ㅗㅑㅗㅑㅗ
						</div>
						<div class="four wide column">
							ㅗㅑㅗㅑㅗ
						</div>
						<div class="four wide column">
							ㅗㅑㅗㅑㅗ
						</div>
						<div class="four wide column">
							ㅗㅑㅗㅑㅗ
						</div>
						<div class="four wide column">
							ㅗㅑㅗㅑㅗ
						</div>
						<div class="four wide column">
							ㅗㅑㅗㅑㅗ
						</div>
					</div>
				</div>
			</div>
		<div class="row">
			<div class="ui grid">
				<div class="four wide column">
					<div>dfssfdsdfsdfsfd</div>
				</div>
				<div class="four wide column">
					<div>dfssfdsdfsdfsfd</div>
				</div>
				<div class="four wide column">
					<div>dfssfdsdfsdfsfd</div>
				</div>
				<div class="four wide column">
					<div>dfssfdsdfsdfsfd</div>
				</div>
				<div class="four wide column">
					<div>dfssfdsdfsdfsfd</div>
				</div>
				<div class="four wide column">
					<div>dfssfdsdfsdfsfd</div>
				</div>
				<div class="four wide column">
					<div>dfssfdsdfsdfsfd</div>
				</div>
				<div class="four wide column">
					<div>dfssfdsdfsdfsfd</div>
				</div>
				<div class="four wide column">
					<div>dfssfdsdfsdfsfd</div>
				</div>
				<div class="four wide column">
					<div>dfssfdsdfsdfsfd</div>
				</div>
				<div class="four wide column">
					<div>dfssfdsdfsdfsfd</div>
				</div>
				<div class="four wide column">
					<div>dfssfdsdfsdfsfd</div>
				</div>
				<div class="four wide column">
					<div>dfssfdsdfsdfsfd</div>
				</div>
				<div class="four wide column">
					<div>dfssfdsdfsdfsfd</div>
				</div>
				<div class="four wide column">
					<div>dfssfdsdfsdfsfd</div>
				</div>
				<div class="four wide column">
					<div>dfssfdsdfsdfsfd</div>
				</div>
				<div class="four wide column">
					<div>dfssfdsdfsdfsfd</div>
				</div>
				<div class="four wide column">
					<div>dfssfdsdfsdfsfd</div>
				</div>
				<div class="four wide column">
					<div>dfssfdsdfsdfsfd</div>
				</div>
				<div class="four wide column">
					<div>dfssfdsdfsdfsfd</div>
				</div>
				<div class="four wide column">
					<div>dfssfdsdfsdfsfd</div>
				</div>
				<div class="four wide column">
					<div>dfssfdsdfsdfsfd</div>
				</div>
				<div class="four wide column">
					<div>dfssfdsdfsdfsfd</div>
				</div>
			</div>
		</div>
	</div>
</div><!-- big segment -->
<script type="text/javascript">
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3
	    };
		var map = new daum.maps.Map(mapContainer, mapOption);
		$('.dropdown').dropdown();
		
		function g_create(){
			cmm_window_popup("./together.jsp", 800, 800, "모임방 개설");
		}
</script>
<%@include file="../../include/include/bottom.jsp" %>
</body>
</html>