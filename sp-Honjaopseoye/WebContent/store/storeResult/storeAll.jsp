<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혼자놀자!</title>
<style type="text/css">
#map {
 z-index: 1;
}
</style>
</head>
<body style="min-width: 1025px;">
<script type="text/javascript">
 function showMap(){
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	
	  mapOption = { 
	      center: new daum.maps.LatLng(37.566821, 126.978657), // 지도의 중심좌표
	      level: 5 // 지도의 확대 레벨
	  };
		
		 mapContainer.style.width = "450px";
		 mapContainer.style.height = "550px"; 

	//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	 map = new daum.maps.Map(mapContainer, mapOption); 
	 
}///////end of showMap 
function showDetailStore(no){
	location.href="/sp-Honjaopseoye/store/storeDetail.hon?store_no="+no;
	
	}
	
</script>
<%@include file="../../include/include/subtop.jsp"%>
<%
	List<Map<String,Object>> list
		= (List<Map<String,Object>>)request.getAttribute("list");
	String searchWord = (String)request.getAttribute("searchWord");
	System.out.println(list.size());
	String name = null;
	String score = null;
	String img = null;
	String price = null;
	String no = null;
	String addr = null;
	String hit = null;
	String littleAddr = null;
	String business = null;
	if(list.size()>0){
	%>
	 <div class="ui three column grid" style="margin-top: 50px;">
		<div class="one wide column">
		</div>
		<div class="eleven wide column">
			<div class="ui text container">
				<h2><%=searchWord %>에 대한 검색결과</h2><br>
				<div class="ui two column grid">
				<%
					for(int i=0;i<list.size();i++){
						name = list.get(i).get("STORE_NAME").toString();
						score = list.get(i).get("STORE_SCORE").toString(); //nvl해준거는 대문자 안되는듯
						img = list.get(i).get("STORE_IMG").toString();
						price = list.get(i).get("STORE_IMG").toString();
						no = list.get(i).get("STORE_NO").toString();
						addr = list.get(i).get("STORE_ADDR").toString();
						hit = list.get(i).get("STORE_HIT").toString();
						littleAddr = list.get(i).get("STORE_LITTLEADDR").toString(); 
						business = list.get(i).get("STORE_BUSINESS").toString();
%>
					<div class="column">
						<div class="ui link card" onclick="showDetailStore(<%=no%>)" style="width: 335px;height: 335px;">
  							<div class="image">
    							<img src="/sp-Honjaopseoye/image/storeImg/<%=img%>" style="width: 336px; height: 220px;">
  							</div>
  							<div class="content">
    							<a class="header"><%=name %></a>
    							<div class="meta">
    								<%=business %> - <%=littleAddr %><br>
      								<span class="date"><i class="eye icon">&nbsp;<%=hit %></i>
      								</span>
      									<br>
      								<div class="ui star rating" data-rating="<%=score%>" data-max-rating="5"></div>
    							</div>
  							</div>
						</div>
					</div>
					<%
						}/// end of for
	
  					%>
				</div>
				<!-- two column grid 끝 -->	
				<div id="pagenation">여기 페이지 네이션 추가</div>
			</div>
			<!-- text container 끝 -->
		</div>
		<div class="four wide column"style="padding-left: 0px;">
			<div id="map"></div>
		</div>
	</div>
 
<%  
		}///end of if
	else{
		%>
<div class="ui basic segment container" style="margin-top: 100px; margin-bottom: 300px;">
	<h3><%=searchWord %> 에 대한 검색 결과가 없습니다</h3>
	<img src="/sp-Honjaopseoye/image/storeImg/noSearch.png" style="height:500px;height: 300px;">
</div>
<%
	}//end of else 
%>
<script type="text/javascript">
$(document).ready(function(){
	 $('.ui.rating').rating('disable');
	showMap();
});///////////end of ready
</script>
<%@include file="../../include/include/bottom.jsp" %>
</body>
</html>