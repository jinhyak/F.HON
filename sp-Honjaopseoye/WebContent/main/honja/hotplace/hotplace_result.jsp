<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<!-- #hotplaceList에 뿌려줄 div태그들 포문 돌려서 최대 8개 까지 생성함  -->
<!-- semantic으로 만들어서 뿌려야함-->
<!-- 로직에서 list에 담을때 최대 8개 까지만!! 그이상이면 이상할거 같음 -->
<%
	System.out.println("hotplace_result호출성공");
	List<Map<String,Object>> list
		= (List<Map<String,Object>>)request.getAttribute("list");
	int length = list.size();
	System.out.println(length);
	String name = null;
	String score = null;
	String img = null;
	String price = null;
	String no = null;
	String addr = null;
	
	if(list.size()>0){
		
	for(int i=0;i<list.size();i++){
		name = list.get(i).get("STORE_NAME").toString();
		score = list.get(i).get("store_score").toString(); //nvl해준거는 대문자 안되는듯
		img = list.get(i).get("store_img").toString();
		price = list.get(i).get("store_price").toString();
		no = list.get(i).get("STORE_NO").toString();
		addr = list.get(i).get("STORE_ADDR").toString();
		System.out.println(name+","+score+","+"img"+","+price);
%>
<div class="column" id="<%=no%>" name="storePreview" onclick="showDetailStore(<%=no%>)">
	<input type="hidden" value="<%=addr%>">
	<input type="hidden" value="<%=name%>">
	<div class="ui segment"style="
    padding-bottom: 0px;
    padding-right: 0px;
    padding-left: 0px;
    padding-top: 0px;">
		<img class="ui fluid image" src="../../store/storeImg/<%=img%>"
		style="width:207px;height:155px;">
		<div class="ui basic segment">
		<%=name%>	
		<div class="ui divider"></div>
		<div class="ui star rating" data-rating="<%=score%>" data-max-rating="5"></div>
		<br>
		<%=price%> 
		</div>
	</div>
</div>

<%
		}////end of for
	}///end of if
	else{
		%>
			<img class="ui fluid image" src="../../store/storeImg/noSearch.png" style="height:230px">
		<%
	}
%>

