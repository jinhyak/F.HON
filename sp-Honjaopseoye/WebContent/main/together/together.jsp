<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		alert("hi");
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
		var mem_id = 'test';
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
				alert(data);
				if(data==1){
					alert("모임방을 개설하셨습니다.")
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
		var address = $('#address').val();
		var name = $('#name').val();
		$('#store_address').val(address+', '+name);
		$('#modal_location').modal('hide');
	}
	function cancel(){
		$("#modal_location").modal('hide');
	} 
	function locationInput(){
			store_list()
			$("#modal_location").modal("show");
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	   	 	mapOption = {
	        	center: new daum.maps.LatLng(37.566821, 126.978657), // 지도의 중심좌표
	       		 level: 3 // 지도의 확대 레벨
	   		 };  
			// 지도를 생성합니다    
		 	map = new daum.maps.Map(mapContainer, mapOption);
			$('#addr_btn').click(function(){
			var value = $.trim($('#search_addr').val())
			if(value==""){
				alert('주소를 입력하세요')
				return;
			}
			else{
			alert(value)
			// 장소 검색 객체를 생성합니다
			var ps = new daum.maps.services.Places(); 
			// 키워드로 장소를 검색합니다
			ps.keywordSearch(value, placesSearchCB);
	
			// 키워드 검색 완료 시 호출되는 콜백함수 입니다
			function placesSearchCB (data, status, pagination) {		
	    		if (status === daum.maps.services.Status.OK) {
	
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	    	    // LatLngBounds 객체에 좌표를 추가합니다
	        	var bounds = new daum.maps.LatLngBounds();
	        	for (var i=0; i<data.length; i++) {
	            	bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
	        	}       
	        	// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        	map.setBounds(bounds);
	        	map.setLevel(3);
	        	// 지도를 클릭한 위치에 표출할 마커입니다
	        	var marker = new daum.maps.Marker({
	        	}); 
	        	// 지도에 클릭 이벤트를 등록합니다
	        	// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	        	daum.maps.event.addListener(map, 'click', function(mouseEvent) {
	        	    // 클릭한 위도, 경도 정보를 가져옵니다 
	        	    var latlng = mouseEvent.latLng; 
	        	 	// 지도에 마커를 표시합니다
	        	    marker.setMap(map);
	        	    // 마커 위치를 클릭한 위치로 옮깁니다
	        	    marker.setPosition(latlng);
	        	    var lat = latlng.getLat() //위도
	        	    var lng = latlng.getLng() //경도
	        	    $('#store_latitude').attr('value',lat)
	        	    $('#store_longitude').attr('value',lng)
	        	    var geocoder = new daum.maps.services.Geocoder();
	        	    var coord = new daum.maps.LatLng(lat,lng);
	        	    	var callback = function(result, status) {
	        	        if (status === daum.maps.services.Status.OK) {
	        	           	$('#result_address').attr('value',result[0].address.address_name)
	        	        }
	        	        else{
	        	        	alert("주소번지불러오기 에러")
	        	        }
	        	    };///end of collback
	        	    //콜백함수 실행
        	    	geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
	        		});/////end of addListner
	    		}//end of if
	    		else{
	    			alert('주소를 다시 검색하세요');
	    		}
			}//////// end of placesSearchCB
		}/////////////end of else
		});////////////////////end of click
	}/////////end of locationInput()
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
	function store_list(){
		  $.ajax({
		    	method:"post"
		    	,url:"/sp-Honjaopseoye/group/store_sel.hon"
		    	,success:function(result){
		    	/* var temp = JSON.stringify(result); */
				obj = JSON.parse(result);
					for(var i = 0; i<obj.length;i++){
						SpMap(obj[i].STORE_ADDR,obj[i].STORE_NAME,obj[i].STORE_NO);
					}
		    	}
		        ,error:function(xhrObject){
		        	alert(xhrObject.responseText);
		        }
		    });
	};
	function SpMap(address,name,no){
		// 주소-좌표 변환 객체를 생성합니다
		
		var geocoder = new daum.maps.services.Geocoder();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(address, function(result, status) {
		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {
		        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new daum.maps.Marker({
		            map: map,
		            position: coords,
		            clickable: true
		        });
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new daum.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
		        });
		        infowindow.open(map, marker);
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    	daum.maps.event.addListener(marker,'click', function() {
		    		$("#address").val(address);
		    		$("#name").val(name);
		    		$("#store_no").attr("value",no);
		    		alert(no);
		   		});
		    } 
		});    
		}
</script>

</body>
</html>