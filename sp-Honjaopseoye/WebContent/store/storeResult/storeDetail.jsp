<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("storeDetail호출성공");
	List<Map<String,Object>> list
		= (List<Map<String,Object>>)request.getAttribute("list");
	
	String tel 			= null;
	String addr 		= null;
	String name 		= null;
	String business		= null;
	String introduce	= null;
	double score		= 0.0;
	int hit				= 0;
	String img			= null;
	String homepage		= null;
	String price		= null;
	String no 			= null;
	
	for(int i=0;i<list.size();i++){
		no  = list.get(i).get("STORE_NO").toString();
		tel = list.get(i).get("STORE_TEL").toString();
		addr = list.get(i).get("STORE_ADDR").toString();
		name = list.get(i).get("STORE_NAME").toString();
		business = list.get(i).get("STORE_BUSINESS").toString();
		introduce = list.get(i).get("STORE_INTRODUCE").toString();
		score = Double.parseDouble((list.get(i).get("STORE_SCORE").toString()));
		hit = Integer.parseInt((list.get(i).get("STORE_HIT").toString()));
		img = list.get(i).get("STORE_IMG").toString();
		homepage = list.get(i).get("STORE_HOMEPAGE").toString();
		price = list.get(i).get("STORE_PRICE").toString();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=name%></title>
<style type="text/css">
	.starText{
		color: black;
	}
	.scoreText{
		font-size: large;
	}
</style>
</head>
<script type="text/javascript">

function setScore(){
		//alert($('.ui.huge.rating').rating("get rating"));
		var score = $('.ui.huge.rating').rating("get rating")
		 $.ajax({
			method:"GET"
		   ,url:"/sp-Honjaopseoye/store/storeSetScore.hon?setStore_score="+
			    score+"&store_no=<%=no%>"

		   ,success:function(result){
			   alert(result)
			   $('.modal')
				.modal('hide');
			   window.location.reload() 
			  
		   }
		 ,error:function(xhrObject){
			   alert(xhrObject.responseText);
		   }
		})////end of ajax 

}/////////////end of setScore
function showMap(){
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	
	
	  mapOption = { 
	      center: new daum.maps.LatLng(37.566821, 126.978657), // 지도의 중심좌표
	      level: 5 // 지도의 확대 레벨
	  };
		
		 mapContainer.style.width = "400px";
		 mapContainer.style.height = "400px"; 

	//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	 map = new daum.maps.Map(mapContainer, mapOption);
	 var store_name = $('#store_name').text(); 
	// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
	 var bounds = new daum.maps.LatLngBounds();  
	 var geocoder = new daum.maps.services.Geocoder();
	 var callback = function(result,status){
			if (status === daum.maps.services.Status.OK) {
				 var position = new daum.maps.LatLng(result[0].y, result[0].x);
				 
			       marker = new daum.maps.Marker({
			       	   position: position
			       	  	,title: store_name
			       });
			       marker.setMap(map);
			       // LatLngBounds 객체에 좌표를 추가합니다
			       bounds.extend(position);
			       map.setBounds(bounds);
			       //인포윈도우 만들기
			       iwContent 
			       		= '<div style="padding:5px;">&nbsp;&nbsp;'+store_name+'</div>'
		    	   iwPosition = new daum.maps.LatLng(result[0].y, result[0].x); //인포윈도우 표시 위치입니다
			    	// 인포윈도우를 생성합니다
			       var infowindow = new daum.maps.InfoWindow({
			           position : iwPosition, 
			           content : iwContent 
			       });
			       infowindow.open(map, marker);
			       
			}
		}///end of callback
		var addr = '<%=addr%>'
		geocoder.addressSearch(addr,callback);
	 
}/////////end of showMap
function chooseMenu(){
	$("#menuBtns").find("button").click(function(){
		$("#menuBtns").find("button").attr("class","ui button")
		$(this).attr('class','ui active button')
		
	});
}/////////////////end of choseMenu
function searchAll(){
	if($.trim($('#searchWord').val())==""){
		alert("검색어를 입력하세요");
		return;
	}///end of if
	else{
	
		location.href = "/sp-Honjaopseoye/store/storeSearchAll.hon?searchWord="+
						$.trim($('#searchWord').val())+
						"&gubun="+$('#menuBtns').find(".active").val();
	
	}/////end of else
}/////end of searchAll

</script>
<body style="min-width: 1000px;">
<%@include file="../../include/include/subtop.jsp"%>
<div class="ui container" style="margin-top: 65px;height:850px">
	<div class="ui one column grid">
		<div class="column" style="padding-bottom: 0px;">
			<div class="ui teal buttons" id="menuBtns" style="width: 282px;">
  				<button class="ui active button" id="matjip" value="21">맛집</button>
  				<button class="ui button" id="suljip" value="22">술집</button>
  				<button class="ui button" id="nolgot" value="23">놀곳</button>
			</div>
		</div>
		<div class="column" style="padding-top: 0px;">
			<div class="ui input">	
  				<input type="text" placeholder="검색어를 입력하세요" id="searchWord" name="searchWord" style="width: 210px;">
 				<button class="ui blue button" id="searchButton" onclick="searchAll()"style="width: 72px;">검색</button>
			</div>
		</div>
	</div>
	<div class="ui two column grid">
		<!-- 가게정보 -->
		<div class="column">
			<h1 class="ui header" id="store_name"><%=name %></h1>
			<br>
			<i class="eye icon">&nbsp;<%=hit %></i><br>
			<div class="ui star rating" data-rating="<%=Math.round(score)%>" data-max-rating="5"></div>
			<span class="scoreText"><%=score %></span>&nbsp;&nbsp;&nbsp;
			<button class="circular ui icon yellow button" onclick="$('.ui.modal').modal('show')">
  				<span class="starText">
  					<i class="star icon"></i>
  					별점주기
  				</span>
			</button>
			
		<div class="ui divider"></div>
		<table class="ui very basic table"style="height: 400px;">
			<tbody>
	  			<tr>
      				<td><h3>주소</h3></td>
      				<td><%=addr %></td>
    			</tr>
	  			<tr>
      				<td><h3>업종</h3></td>
      				<td><%=business %></td>
    			</tr>
	  			<tr>
      				<td><h3>전화번호</h3></td>
      				<td><%=tel %></td>
    			</tr>
	  			<tr>
      				<td><h3>가격대</h3></td>
      				<td><%=price %></td>
    			</tr>
	  			<tr>
      				<td><h3>홈페이지</h3></td>
      				<td><%=homepage %></td>
    			</tr>
	  			<tr>
      				<td><h3>가게 소개</h3></td>
      				<td><%=introduce %></td>
    			</tr>
			</tbody>
		</table>
  		</div>
		<!-- 이미지와 지도 -->
		<div class="column">
			<img class="ui medium rounded image" src="/sp-Honjaopseoye/image/storeImg/<%=img%>" style="width: 400px">
			<br>
			<div id="map"></div>
		</div>
	</div>	
</div>
<script type="text/javascript">
$(document).ready(function(){
	 $('.ui.rating').rating('disable');
		$('.ui.huge.rating')
		  .rating({
		    initialRating: 0
	});
	showMap();
	chooseMenu();
})////////////end of ready
</script>
<!--======================== 별점주기 모달 =================-->
<div class="ui modal">
  <div class="header">별점주기</div>
  <div class="content">
   	<div class="ui huge star rating" data-max-rating="5" id="storeSetScore"></div>
   	<br>
   	<button class="ui primary button" id="ok" onclick="setScore()">
  		확인
	</button>
	<button class="ui button" id="cancel" onclick="$('.modal').modal('hide')">
  		취소
	</button>
  </div>
</div>
<!--======================== 별점주기 끝 ==================-->
<%@include file="../../include/include/bottom.jsp"%>
</body>
</html>