<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//핫플레이스 받아내는 코드


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	//지도 전역변수에 선언해 모든 함수에서 사용가능하게 함
	var map = null;
	//var point = null;
	//위치 조정을 위한 points변수 선언
	//var points = new Array;
	var addrs = new Array;
	//가게이름 배열
	var store_names = new Array;
	var store_name = null;
	var storeNod = null;
	//인포띄우는 변수
	var iwContent = null;
	var iwPosition = null;

//화면이 시작했을때 보여줄 지도(초기좌표같은거 설정해 주면 될듯)
function showMap(){
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	
  mapOption = { 
      center: new daum.maps.LatLng(37.566821, 126.978657), // 지도의 중심좌표
      level: 5 // 지도의 확대 레벨
  };
	
	 mapContainer.style.width = "1100px";
	 mapContainer.style.height = "509px"; 

//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
 map = new daum.maps.Map(mapContainer, mapOption); 
}///////////////////////end of showMap

///////////////////////////////////검색 기능 함수
function search(){
	if($.trim($('#searchWord').val())==""){
		alert("검색어를 입력하세요");
		return;
	}
	else{
		
	
		//앞에는 놀,술,먹 셋중 하나 구분 뒤에는 검색어 
		//로직에서 분기 해준다음 검색해야함
		var param = "searchWord="+$.trim($('#searchWord').val())+
					"&gubun="+$('#menuBtns').find(".active").val()+
					"&store_business="+$('#store_business').dropdown('get value')+
					"&store_price="+$('#store_price').dropdown('get value');  //기억해놩
		//alert(param);
		
		$.ajax({
			method:"POST"
		   ,url:"../../store/storeSearch.hon"
		   ,data:param //파라미터로 검색어 + 조건 넘김
		   ,success:function(result){
			   //#hotplaceList에 for문 써서 나온거 뿌려줌
			   $("#hotPlaceList").html(result);
			   $('.ui.sidebar').sidebar({
					context: $('.top.segment')
					 ,dimPage: false //사이드바 열때 화면색 변하는거 막음
					 ,closable : false //pusher눌렀을때 sidebar 들어가는거 막음
				}).sidebar('show');
			   $('.ui.rating').rating('disable');
			   //마커 삭제하기위해 맵 초기화
			   showMap();
			   //var bounds = new daum.maps.LatLngBounds();
	    	   //네임값으로 가게정보 배열만드는거
	    	   
	    	   
	    	   storeNod = document.getElementsByName("storePreview");
	    	   console.log("storeNod길이"+storeNod.length)
	    	   for(var i = 0;i<storeNod.length;i++){
	    		 
	    		   addrs[i] = $(storeNod[i].getElementsByTagName('input').item(0)).val()
	    		   store_names[i] = $(storeNod[i].getElementsByTagName('input').item(1)).val()
	    		   //addrs[i] = $(store_addr).val()
	    		   showMarker(addrs[i],store_names[i])
	    		   //points[i] = point; 
	    		   //bounds.extend(points[i]);
	    		   
	    	   }///end of for
	    		//map.setBounds(bounds);
	    	   console.log("주소 개수"+addrs.length)
	    	   console.log("가게 이름"+store_name)
	    	   //console.log(points)
	    	   //console.log("좌표포인트 배열개수="+points.length)
	    	   
	    	   map.setLevel(10);
	    	
	    	   
	    	 	   
	    	  
		   }
		   ,error:function(xhrObject){
			   alert(xhrObject.responseText);
		   }
		});//end of ajax
	}////////////end of else
}///////////////////end of search
function showMarker(addr,store_name){
	console.log("주소"+addr)
	var marker = new Array;
	var geocoder = new daum.maps.services.Geocoder();
	var callback =  function(result,status){
		if (status === daum.maps.services.Status.OK) {
	       var position = new daum.maps.LatLng(result[0].y, result[0].x);
	       //console.log("마커포지션"+position);
	       /* //범위 재설정 위해서 좌표값 넣음
	       point = position;	 */
	       
	       marker = new daum.maps.Marker({
	       	   position: position
	       	  ,title: store_name
	       });
	       marker.setMap(map);
	       //인포윈도우 만들기
	       iwContent = '<div style="padding:5px;">'+store_name+'</div>' // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    	   iwPosition = new daum.maps.LatLng(result[0].y, result[0].x); //인포윈도우 표시 위치입니다
	    	// 인포윈도우를 생성합니다
	       var infowindow = new daum.maps.InfoWindow({
	           position : iwPosition, 
	           content : iwContent 
	       });
	       infowindow.open(map, marker); 
	    }
	}////end of callback
	geocoder.addressSearch(addr,callback);
	
	//console.log("marker="+marker)
	
}////////////end of showMarker

/////////////////////매뉴 버튼 이벤트 처리 함수
function chooseMenu(){
	$("#menuBtns").find("button").click(function(){
		$("#menuBtns").find("button").attr("class","ui button")
		$(this).attr('class','ui active button')
		//var storeKind = $(this).val()
		//alert(storeKind)
		var url = "./honja_menu/"+$("#menuBtns").find(".active").attr('id')+"Kind.jsp";
		$.ajax({
				method:"POST"
			   ,url:url
			   ,success:function(result){
					$('#d_search').html(result)
					$('.ui.dropdown')
	  				.dropdown();
					
				   }
				   ,error:function(xhrObject){
					   alert(xhrObject.responseText);
				   }
			})
		});
	}/////////////////end of choseMenu
function showDetailStore(no){
	 location.href="../../store/storeDetail.hon?store_no="+no;
	}
	

function showHotplace(){//핫플보기 버튼 누르면 사이드 바 나오면서 핫플 리스트 보임
	
	
		var showHotClass = $('#showHot').attr('class');
		if(showHotClass == 'ui toggle right floated button'){
			$('#showHot').attr('class','ui toggle right floated active button')
			$('#sidebar').sidebar('toggle');
			
		}
		else{
			$(this).attr('class','ui toggle right floated button')
			$('#showHot').attr('class','ui toggle right floated button')
			$('.ui.sidebar').sidebar({
					context: $('.top.segment')
			       ,dimPage: false //사이드바 열때 화면색 변하는거 막음
				,closable : false //pusher눌렀을때 sidebar 들어가는거 막음
					}).sidebar('toggle');
			
			//앞에는 놀,술,먹 셋중 하나 구분 뒤에는 검색어 
			//로직에서 분기 해준다음 검색해야함
			var param = "searchWord="+$.trim($('#searchWord').val())+
						"&gubun="+$('#menuBtns').find(".active").val()+
						"&store_business="+$('#store_business').dropdown('get value')+
						"&store_price="+$('#store_price').dropdown('get value');  //기억해놩
			
			$.ajax({
				method:"POST"
			   ,url:"../../store/storeSearch.hon"
			   ,data: param
		       ,success:function(result){
		    	   $("#hotPlaceList").html(result);
		    	   $('.ui.rating').rating('disable');
		    	  
		       }
			   ,error:function(xhrObject){
				   alert(xhrObject.responseText);
			   }
			})
			
			
		}
}////////////end of showHotplace()


</script>
<title>Insert title here</title>
</head>
<body>

<%@include file="../../include/include/subtop.jsp" %>

<div class="ui basic segment">
<!-- ====================================검색과 글쓰기 버튼 ====================================-->
  <div class="ui basic segment text container one column grid">
	<div class="column"style="padding-bottom: 0px;">
  		<!--===== 밥,술,놀 매뉴 버튼 =======-->
  	   	<div class="three ui fluid buttons" id="menuBtns">
 			<button class="ui active button" id="matjip" value="21">맛집</button>
  			<button class="ui button" id="suljip" value="22">술집</button>
  			<button class="ui button" id="nolgot" value="23">놀곳</button>
		</div>
  	   	<!--===== 밥,술,놀 매뉴 버튼 끝 =====-->
  	</div>
    	<input type="hidden" readonly="readonly" id="storeKind" name="storeKind" value="21">
  	<div class="column" style="padding-top: 0px;padding-bottom: 0px;">
  		<!-- ======== 검색창 ========-->
		<div class="ui fluid action input">	
  			<input type="text" placeholder="키워드를 선택 후 검색해보세요" id="searchWord" name="searchWord">
 			<button class="ui button" id="searchButton" onclick="search()">검색</button>
		</div>
		<!-- ======= 검색창 끝 =======-->
    </div>
    <div class="column" style="padding-top: 4px;">
    <!--===== 상세검색 드롭다운 시작 ======-->
    <div id="d_search">
    	<select class="ui dropdown" id="store_business">
  			<option value="">업종</option>
  			<option value="00">한식</option>
  			<option value="01">중식</option>
  			<option value="02">일식</option>
  			<option value="03">양식</option>
  			<option value="04">분식</option>
  			<option value="05">기타</option>
		</select>
		<select class="ui dropdown" id="store_price">
  			<option value="">가격대</option>
  			<option value="~만원">~만원</option>
  			<option value="만원~2만원">만원~2만원</option>
  			<option value="2만원~3만원">2만원~3만원</option>
  			<option value="3만원~4만원">3만원~4만원</option>
  			<option value="4만원~5만원">4만원~5만원</option>
  			<option value="5만원~">5만원~</option>
		</select>
    </div>
    <!--===== 상세검색 드롭다운 끝 ========-->
    </div>
  </div>
<!-- ===================================검색과 글쓰기 버튼 끝 ===================================-->
<!--=================================== 지도와 핫플레이스 목록================================  -->
<div class="ui basic segment container">
   		
   	
  		<button class="ui toggle right floated active button" id="showHot" onclick="showHotplace()">핫플보기</button>
  		<button class="ui right floated button" id="showAll">전체보기</button>
  		
 		
  <div class="ui top attached segment pushable">
  	<div class="ui right very wide sidebar" id="sidebar" style="padding-top: 5px;">
  		<!-- 핫플레이스 뿌려줄 div grid태그 -->
		<div class="ui two column grid" id="hotPlaceList"style="width: 475px;margin-right: 0px;margin-bottom: 0px;margin-left: 0px;margin-top: 0px;">
		<!-- result.jsp 뿌려질 곳 -->

		</div>
		<!-- 핫플레이스 뿌려줄 div grid끝 -->
  	</div>
  	<!--======= 지도 시작 =======-->
    <div class="pusher" id="pusher">
      		<div id="map" style="width:100%;"></div>
  	</div>
  	<!--======= 지도 끝  =======-->
  </div>
</div>
<!--================================== 지도와 핫플레이스 목록 끝================================  -->
</div>
<script type="text/javascript">
$(document).ready(function(){
	showMap();
	$('.ui.dropdown')
	  .dropdown()
	;
	chooseMenu();
	

	//kind();
})/////////////////////////////////////////////////////////////////end of ready
</script>

<%@include file="../../include/include/bottom.jsp" %>
</body>
</html>