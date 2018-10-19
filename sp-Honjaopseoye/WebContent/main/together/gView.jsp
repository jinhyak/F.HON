<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%
	String bang_no = request.getParameter("bang_no");
	String store_no = request.getParameter("store_no");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; UTF-8">
<title>그룹 상세정보</title>
<script type="text/javascript">
var bang_no = '<%=bang_no%>'
var store_no = '<%=store_no%>'
var store_img = "";
var store_latitude = "";
var store_longitude = "";
var bang_id = "";
</script>
</head>
<body>
<%@ include file="../../include/include/subtop.jsp" %>
<script type="text/javascript">
$(document).ready(function () {
	var param = "bang_no="+bang_no+"&store_no="+store_no;
	$.ajax({
		method:"post",
		data:param,
		url:"../../group/groupSelect.hon",
		success:function(result) {
		   //groupInfoList에 나온거 뿌려줌
		   console.log(result);
		   
		   //bang_no = result[0].BANG_NO;
		   store_no = result[0].STORE_NO;
		   bang_id = result[0].BANG_ID;
		   $("#bang_jang_id").text(bang_id);
		   
		   if(result[0].STORE_IMG!=null) {
			    store_img = result[0].STORE_IMG;
		   		$("#large_img1").attr('src',"/sp-Honjaopseoye/image/storeImg/"+store_img);
		   }
		   $("#bang_title").text(result[0].BANG_NAME);
		   
		   $("#bang_id").text(result[0].BANG_ID);
		   $("#store_name").text(result[0].STORE_NAME);
		   $("#bang_topic").text(result[0].BANG_TOPIC);
		   $("#store_business").text(result[0].STORE_BUSINESS);
		   $("#bang_age").text(result[0].BANG_AGE);
		   $('.rating').rating({
				initialRating: result[0].STORE_SCORE
			});
		   $('.rating').rating('disable');
		   $("#bang_gender").text(result[0].BANG_GENDER);
		   $("#bang_money").text(result[0].BANG_MONEY);
		   $("#bang_date").text(result[0].BANG_DATE);
		   $("#store_keyword").text(result[0].STORE_KEYWORD);
		   $("#bang_time").text(result[0].BANG_TIME);
		   $("#store_addr").text(result[0].STORE_ADDR);
		   
		   $("#bang_name").text(result[0].BANG_NAME);
		   $("#bang_memo").text(result[0].BANG_MEMO);
		   $("#bang_limit_people").text(result[0].BANG_LIMIT_PEOPLE);
		   $("#bang_cur_people").text(result[0].BANG_CUR_PEOPLE);
		   
		   store_latitude = parseFloat(result[0].STORE_LATITUDE);
		   store_longitude = parseFloat(result[0].STROE_LONGITUDE);
		   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		   mapOption = { 
		       center: new daum.maps.LatLng(store_latitude, store_longitude), // 지도의 중심좌표
		       level: 3 // 지도의 확대 레벨
		   }
		   var map = new daum.maps.Map(mapContainer, mapOption); 
		   // 마커가 표시될 위치입니다 
		   var markerPosition  = new daum.maps.LatLng(store_latitude, store_longitude); 
		   // 마커를 생성합니다
		   var marker = new daum.maps.Marker({
		       position: markerPosition
		   });
		   // 마커가 지도 위에 표시되도록 설정합니다
		   marker.setMap(map);
		   var infowindow = new daum.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">그룹모임 장소</div>'
	        });
           infowindow.open(map, marker);
           
           if(bang_id == mem_id ){
        	   $("#bang_id_ok").show();
        	   $("#bang_id_no").hide();
           } else {
        	   $("#bang_id_ok").hide();
        	   $("#bang_id_no").show();
           }
		},
		error:function(xhrObject){
		   alert(xhrObject.responseText);
	  	}
	});
});
</script>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<div class="ui stackable header" style="margin-left: 150px;margin-right: 700px; margin-top: 100px;margin-bottom: 100px">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ index @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<div class="ui stackable centered segment">
			<h1 id="bang_title" class="ui centered header"></h1>
		<div class="ui stackable one column grid" id="context">
			<div class="ui column">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 말머리 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
				<div class="ui stackable center aligned basic segment">
					<div class="ui shape">
					  <div class="sides">
						<div class="active side">
							<div class="ui large image">
								<img id="large_img1" src="../../image/logo.png" style="width:500px; height:400px;">
							</div>
						</div>
					    <div class="side">
							<div class="ui large image">
								<img id="large_img2" src="../../image/mapimage.png" style="width:500px; height:400px;">
							</div>
						</div>
					    <div class="side">
							<div class="ui large image">
								<img id="large_img3" src="../../image/with.jpg" style="width:500px; height:400px;">
							</div>
						</div>
					  </div>
					</div>
				<div class="ui basic segment">
				  <div class="ui black button" id="next_btn">다음<i class="chevron right icon"></i></div>
			    </div>
				</div>
				<div class="ui stackable basic segment">
					<div class="ui field">
					<div class="ui stackable four column grid">
						<div class="ui row">
							<div class="ui container">
							<h3 class="ui center aligned header">그룹방 정보</h3>
							</div>
						</div>
						<div class="ui divider row">
							<div class="left aligned column">방장이름</div>
							<div class="right aligned column">
								<h4 id="bang_id" style="color:green;"></h4>
							</div>
							<div class="left aligned column">가게이름</div>
							<div class="right aligned column">
								<h4  id="store_name" style="color:green;"></h4>
							</div>
						</div>								
						<div class="ui divider row">
							<div class="left aligned column">대화주제</div>
							<div class="right aligned column">
								<h4 id="bang_topic" style="color:green;"></h4>
							</div>
							<div class="left aligned column">가게업종</div>
							<div class="right aligned column">
								<h4 id="store_business" style="color:green;"></h4>
							</div>
						</div>								
						<div class="ui divider row">
							<div class="left aligned column">방연령대</div>
							<div class="right aligned column">
								<h4 id="bang_age" style="color:green;"></h4>
							</div>
							<div class="left aligned column">가게별점</div>
							<div class="right aligned column">
								<div id="store_score" class="ui massive star rating" data-max-rating="5"></div>
							</div>
						</div>								
						<div class="ui divider row">
							<div class="left aligned column">방성별대</div>
							<div class="right aligned column">
								<h4 id="bang_gender" style="color:green;"></h4>
							</div>
							<div class="left aligned column">가격</div>
							<div class="right aligned column">
								<h4 id="bang_money" style="color:green;"></h4>
							</div>
						</div>								
						<div class="ui divider row">
							<div class="left aligned column">방날짜</div>
							<div class="right aligned column">
								<h4 id="bang_date" style="color:green;"></h4>
							</div>
							<div class="left aligned column">가게키워드</div>
							<div class="right aligned column">
								<h4 id="store_keyword" style="color:green;"></h4>
							</div>
						</div>								
						<div class="ui divider row">
							<div class="left aligned column">방시간</div>
							<div class="right aligned column">
								<h4 id="bang_time" style="color:green;"></h4>
							</div>
							<div class="left aligned two wide column">가게주소</div>
							<div class="left aligned six wide column">
								<h4 id="store_addr" style="color:green;"></h4>
							</div>
						</div>
					</div>
				</div>
				<br><br>
			</div>
			</div>
			<div class="ui stackable basic segment" style="width:100%;">
				지도 들어갈 자리
				<div id="map" style="width:100%;height:600px;"></div>
			</div>
			<div class="ui stackable right rail">
			 <div class="ui sticky">
			<div class="ui segment" style="width: 400px;">
<!--   </div> -->
					<div class="ui basic segment">
						<div class="ui field">
							<div class="ui two column grid">
								<div class="row">
									<div class="five wide column">방제목</div>
									<div class="column">
										<h3 id="bang_name"></h3>
									</div>
								</div>
								<div class="row">
									<div class="five wide column">방소개</div>
									<div class="column">
										<h4 id="bang_memo"></h4>
									</div>
								</div>
								<div class="row">
									<div class="five wide column">방최대인원</div>
									<div class="column">
										<h4 id="bang_limit_people"></h4>
									</div>
								</div>
								<div class="row">
									<div class="five wide column">방현재인원</div>
									<div class="column">
										<h4 id="bang_cur_people"></h4>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="ui basic segment" id="bang_id_no">
						<div class="ui two column grid">
							<div class="column">
								<div class="ui green fluid large button" id="attend_btn">참석</div>
								<div class="ui tiny modal" id="modal_attend">
								  <div class="header">모임참석</div>
								  <div class="content">
								  	<h4 class="ui dividing header">아이디 : <%=mem_id %></h4>
								    <div class="field">
									    <p><label>한줄 자기소개 인사말을 입력해주세요</label></p>
									    <textarea id="ta_memo" style="width:100%;resize:none;" required></textarea>
								    </div>
								  </div>
								  <div class="actions">
								    <div class="ui ok green button" id="attend_modal_button">확인</div>
								    <div class="ui cancel red button">닫기</div>
								  </div>
								</div>
								<div class="ui tiny modal" id="modal_ta_null">
								  <div class="ui red header">알림</div>
								  <div class="content">
								    <h3><p>한줄 자기소개 인사말을 입력하셔야 합니다.</p></h3>
								    <h3><p>재작성 부탁드립니다.</p></h3>
								  </div>
								  <div class="actions">
								    <div class="ui ok green button">확인</div>
								  </div>
								</div>
								<div class="ui basic modal" id="attend_modal">
								  <div class="ui icon header">
								    <i class="users icon"></i>
								   	 <h1>알림</h1>
								  </div>
								  <div class="content">
								    <h2>이 방의 모임에 참석 완료되었습니다.</h2>
								  </div>
								  <div class="actions">
								    <div class="ui green ok inverted button" id="attend_modal_btn">
								      <i class="checkmark icon"></i>
								      	확인
								    </div>
								  </div>
								</div>
								<div class="ui basic modal" id="groupAbsent_modal">
								  <div class="ui icon header">
								    <i class="user times icon"></i>
								   	 <h1>알림</h1>
								  </div>
								  <div class="content">
								    <h2>취소가 완료되었습니다.</h2>
								  </div>
								  <div class="actions">
								    <div class="ui green ok inverted button" id="absent_modal_btn">
								      <i class="checkmark icon"></i>
								      	확인
								    </div>
								  </div>
								</div>
								<div class="ui basic modal" id="already_attend_modal">
								  <div class="ui icon header">
								    <i class="calendar check outline icon"></i>
								   	 <h1>알림</h1>
								  </div>
								  <div class="content">
								    <h2>모임에 이미 참석되어 있습니다.</h2>
								  </div>
								  <div class="actions">
								    <div class="ui green ok inverted button">
								      <i class="checkmark icon"></i>
								      	확인
								    </div>
								  </div>
								</div>
								<div class="ui basic modal" id="already_groupAbsent_modal">
								  <div class="ui icon header">
								    <i class="question circle outline icon"></i>
								   	 <h1>알림</h1>
								  </div>
								  <div class="content">
								    <h2>모임에 참석되어 있지 않습니다.</h2>
								  </div>
								  <div class="actions">
								    <div class="ui green ok inverted button">
								      <i class="checkmark icon"></i>
								      	확인
								    </div>
								  </div>
								</div>
							</div>
							<div class="column">
								<div class="ui red fluid large button" id="cancle_btn">취소</div>
							</div>
						</div>
					</div>
					<div class="ui basic segment" id="bang_id_ok">
						<div class="ui two column grid">
							<div class="column">
								<div class="ui green fluid large button" id="bang_reserv_btn">예약하기</div>
							</div>
							<div class="column">
								<div class="ui red fluid large button" id="bang_delete_btn">방삭제</div>
								<div class="ui basic modal" id="bang_delete_modal">
								  <div class="ui icon header">
								    <i class="trash alternate icon"></i>
								   	 <h1>모임방 삭제</h1>
								  </div>
								  <div class="content">
								    <h2>모임을 정말로 삭제하시겠습니까?</h2>
								  </div>
								  <div class="actions">
								    <div class="ui red ok inverted button" id="bang_delete_modal_btn">
								      <i class="remove icon"></i>
								      	예, 삭제합니다.
								    </div>
								    <div class="ui green cancel inverted button">
										아니오, 유지합니다.
								    </div>
								  </div>
								</div>
								<div class="ui basic modal" id="delete_success_modal">
								  <div class="ui icon header">
								    <i class="trash alternate icon"></i>
								   	 <h1>알림</h1>
								  </div>
								  <div class="content">
								    <h2>방삭제가 완료되었습니다. 같이 페이지로 이동합니다.</h2>
								  </div>
								  <div class="actions">
								    <div class="ui green ok inverted button">
								      <i class="checkmark icon"></i>
								      	확인
								    </div>
								  </div>
								</div>
							</div>
						</div>
					</div>
					<div class="ui segment">
						<div class="ui blue fluid large button" id="g_frilist_btn">
							참석자 명단 보기 <i class="angle double down icon"></i></div>
							<div class="ui item" style="margin-top:30px;">
							    <img class="ui avatar image" src="../../image/male.jpg" style="width:30px;height:30px">
							    <div class="middle aligned content" style="width:70px;">
							    	<div class="ui teal header" id="bang_jang_id"></div>
							    </div>
							    <div class="content" style="padding-left:5px">
							    	<div class="ui header">
							      	   모임의 방장입니다.
							    	</div>
							    </div>
						    </div>
						<div class="ui middle selection list" id="fri_list">
						</div>
					</div>
				</div>
				</div>
			</div>
		</div>
		</div>
	</div>
	<input type="hidden" value="0" id="hidden">
<script>
$("#next_btn").click(function() {
	$('.shape').shape('flip right');
});
$('.ui.sticky').sticky({
	offset       : 50,
	bottomOffset : 50,
	context: '#context',
	setSize: true
});
$("#bang_reserv_btn").click(function () {
	location.href="/sp-Honjaopseoye/store/reservation/sView.jsp?bang_no="+bang_no+"&store_no="+store_no;
});
$("#bang_delete_btn").click(function () {
	$("#bang_delete_modal").modal({
		allowMultiple: true,
		onApprove : function() {
			$.ajax({
	    		method:"post",
	    		data:"bang_no="+bang_no,
	    		url:"../../group/groupDelete.hon",
	    		success:function(result){
	    			alert("넘어온 result :"+result);
	    			if(result==1) {
	    				//alert("삭제성공");
	    				$("#delete_success_modal").modal({
	    					onApprove : function() {
		    					location.href="./together_main.jsp";
	    					}
	    				}).modal('show');
	    			} else {
	    				alert("삭제실패!!");
	    			}
	    		}
   			});
		}
		}).modal('show');
});
$("#attend_btn").click(function (){
	$('#modal_attend').modal({
		allowMultiple: true,
		onApprove : function() {
			var mem_memo = $("#ta_memo").val();
			console.log(mem_memo);
			var param = "bang_no="+bang_no+"&mem_id="+mem_id+"&mem_memo="+mem_memo;
		    if(mem_memo != ""){
				$.ajax({
		    		method:"post",
		    		data:param,
		    		url:"../../group/groupAttend.hon",
		    		success:function(result){
		    			//alert("넘어온 result :"+result);
		    			if(result==1){
		    				$("#attend_modal").modal('setting', 'closable', false).modal('show');
		    				$("#attend_modal_btn").click(function() {
			    				location.reload();
		    				});
		    				//fri_list();
		    			}
		    			else if(result==0) {
		    				//alert("이미참석처리 되었습니다!!!");
		    				$("#already_attend_modal").modal('show');
		    				fri_list();
		    			}
		    			else{
		    				alert("방 최대인원이 꽉 찼습니다.")
		    			}
		    		}
	   			});
		    } else {
		    	//alert("입력해라");
		    	$('#modal_ta_null').modal('show');
		    }
		}
	}).modal('show');
});
$("#cancle_btn").click(function (){
	$.ajax({
		method:"post",
		data:"mem_id="+mem_id,
		url:"../../group/groupAbsent.hon",
		success:function(result){
			//alert("넘어온 result :"+result);
			if(result==1){
				//alert("취소되었습니다.");
				$("#groupAbsent_modal").modal('setting', 'closable', false).modal('show');
				$("#absent_modal_btn").click(function() {
    				location.reload();
				});
				//fri_list();
			}
			else if(result==0){
				//alert("이미 취소처리 되었습니다!!!");
				$("#already_groupAbsent_modal").modal('show');
				fri_list();
			}
		}
	})
});
$("#g_frilist_btn").click(function (){
	fri_list();
}); 
function fri_list(){
	var hid = $("#hidden").val()
	if(hid=='1'){//1이면 친구목록이 뿌려진상태-클릭하면
		$("#fri_list").html('');//리스트 초기화
		$("#hidden").val('0');//다시 히든값 초기화
	}
	else{//0일때 아작스 타서 친구불러옴
		$.ajax({
			method:"post",
			data:"bang_no="+bang_no,
			url:"../../group/friendSelect.hon",
			success:function(result) {
			   console.log(result);
			   $("#fri_list").html(result);
			   $("#hidden").val("1");
			},
			error:function(xhrObject){
			   alert(xhrObject.responseText);
		  	}
		});
	}
};
</script>
<%@ include file="../../include/include/bottom.jsp" %>
</body>
</html>