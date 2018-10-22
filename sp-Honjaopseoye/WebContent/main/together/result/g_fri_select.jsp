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
  <div class="ui link item">
	  <div class="item">
	  	<div class="ui circular image" style="width:60px;height:60px;">
	      <img src="../../image/member/<%=gfriendList.get(i).get("MEM_IMG")%>">
	    </div>
	    <div class="middle aligned content" style="padding-left:15px;">
	    	<div class="ui header teal">
	    	  <%=gfriendList.get(i).get("MEM_ID")%>
	    	</div>
	   	    <div class="description">
	     	  <%=gfriendList.get(i).get("MEM_MEMO")%>
	     	</div>
	    </div>
	  </div>
  </div>
<%	}
}
%>	
	