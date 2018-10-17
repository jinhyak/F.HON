<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
List<Map<String,Object>> gfriendList = null;
gfriendList = (List<Map<String,Object>>)request.getAttribute("gfriendList");
if(gfriendList!=null){
	for(int i=0;i<gfriendList.size();i++){
%>
  <div class="ui item" >
    <img class="ui avatar image" src="../../image/male.jpg" style="width:30px;height:30px">
    <div class="middle aligned content" style="width:70px;">
    	<div class="ui teal"><%=gfriendList.get(i).get("MEM_ID")%></div>
    </div>
    <div class="content" style="padding-left:5px">
    	<div class="ui">
      	  <%=gfriendList.get(i).get("MEM_MEMO")%>
    	</div>
    </div>
  </div>
<%	}
}
%>	
	