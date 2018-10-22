<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../../include/include/commonUI.jsp" %>
</head>
<body>

<i class="close icon"></i>
	<div class="content">
		<div class="body">
			<div class="ui basic segment container"style="padding-top: 0px;padding-bottom: 0px;">
			<div class="ui basic right floated segment"style="margin-top: 0px;padding-right: 0px;margin-right:0px;padding-top: 0px;margin-bottom: 0px;">
				<div class="ui pointing below big label">
      				모임 장소 찾기!!!~~~
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
<script>
	var map = new daum.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
	    center : new daum.maps.LatLng(37.47268617374468, 126.8837183789525), // 지도의 중심좌표 
	    level : 12 // 지도의 확대 레벨 
	});
	
	var clusterer = new daum.maps.MarkerClusterer({
	    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	    gridSize: 100,
	    minLevel: 2, // 클러스터 할 최소 지도 레벨
	    minClusterSize: 2,
	});
 	
 $.get("/sp-Honjaopseoye/store/store_select.hon", function(data) {
	 
     var markers = $(data.positions).map(function(i, position) {
         var marker = new daum.maps.Marker({
             position : new daum.maps.LatLng(position.STORE_LATITUDE, position.STORE_LONGITUDE)
          });
         
         //띄울 인포윈도우 정의
         var iwContent = '<img src="/sp-Honjaopseoye/image/'+position.STORE_IMG+'" style="width:145px;"><div style="padding:5px;word-wrap:break-word;">'
		           +position.STORE_NAME+'<br/>'
		           +position.STORE_INTRODUCE+'<br/></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		            iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

          // 인포윈도우를 생성합니다
          var infowindow = new daum.maps.InfoWindow({
              content : iwContent
          });
		            
          // 마커에 클릭이벤트를 등록합니다
          daum.maps.event.addListener(marker, 'click', function() {
                // 마커 위에 인포윈도우를 표시합니다
                infowindow.open(map, marker);   
	    		$("#address").val(position.STORE_ADDR);
	    		$("#name").val(position.STORE_NAME);
	    		$("#store_no").attr("value",position.STORE_NO);
          }); 
          
         // 마커에 마우스오버 이벤트를 등록합니다
          daum.maps.event.addListener(marker, 'mouseover', function() {
            // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
              infowindow.open(map, marker);
          });
         
          // 마커에 마우스아웃 이벤트를 등록합니다
          daum.maps.event.addListener(marker, 'mouseout', function() {
              // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
              infowindow.close();
          });
         
          //생성된 마커를 반환합니다.
         return marker;
 	 });
	//클러스터에 마커들을 저장합니다.
	clusterer.addMarkers(markers);
});
       function cancel(){
    	   self.close();
       }
       function confirm(){
   		var address = $('#address').val();
   		var name = $('#name').val();
    	opener.document.getElementById("store_address").value=address+','+name;
    	self.close();
       }
</script>

</body>
</html>