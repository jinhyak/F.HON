<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혼자놀자!</title>

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
/////////////////////매뉴 버튼 이벤트 처리 함수
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
<%@include file="../../include/include/subtop.jsp"%>
<%
	List<Map<String,Object>> list
		= (List<Map<String,Object>>)request.getAttribute("list");
	String searchWord = (String)request.getAttribute("searchWord");
	System.out.println(list.size());
	String name = null;
	double score = 0.0;
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
				<div class="ui one column grid">
					<div class="column" style="padding-bottom: 0px;">
						<div class="ui buttons" id="menuBtns" style="width: 282px;">
  							<button class="ui active button" id="matjip" value="21">맛집</button>
  							<button class="ui button" id="suljip" value="22">술집</button>
  							<button class="ui button" id="nolgot" value="23">놀곳</button>
						</div>
					</div>
					<div class="column" style="padding-top: 0px;">
						<div class="ui input">	
  							<input type="text" placeholder="검색어를 입력하세요" id="searchWord" name="searchWord" style="width: 200px;">
 							<button class="ui button" id="searchButton" onclick="searchAll()"style="width: 82px;">검색</button>
						</div>
					</div>
				</div>
				
				<h2><%=searchWord %>에 대한 검색결과</h2><br>
				<div class="ui two column grid">
				<%
					for(int i=0;i<list.size();i++){
						name = list.get(i).get("STORE_NAME").toString();
						score = Double.parseDouble((list.get(i).get("STORE_SCORE").toString()));
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
    							</div>
      								<span class="date"><i class="eye icon">&nbsp;<%=hit %></i>
      								</span>
      									<br>
      								<div class="ui star rating" data-rating="<%=Math.round(score)%>" data-max-rating="5"></div>
      								<%=score %>
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
	chooseMenu()
});///////////end of ready
</script>
<%@include file="../../include/include/bottom.jsp" %>
</body>
</html>