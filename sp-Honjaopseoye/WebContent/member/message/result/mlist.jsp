<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<!-- 메세지 목록 결과값 페이지 -->
<% 
	List<Map<String,Object>> list = (List<Map<String,Object>>)request.getAttribute("result");
	List<Map<String,Object>> members=(List<Map<String,Object>>)session.getAttribute("memList");
	String mem_id = null;
	mem_id = members.get(0).get("MEM_ID").toString();//테스트용
	if(list!=null&&list.size()!=0){
		for(int i = 0 ; i<list.size();i++){
			if(mem_id.equals(list.get(i).get("MSG_FROM").toString())){
%>
		<div class="ui item" style="margin-top:2px;">
					<div class="left floated header" style="margin-right:8px"><h4><%=list.get(i).get("MSG_DATE").toString() %></h4></div>
				    <img class="ui right floated avatar image" src="../../image/male.jpg" style="width:50px;height:50px" >
					<div class="ui right floated teal header">나</div>
				    <div class="ui big right floated right pointing label" style="background-color:#F7FE2E">
				      <%=list.get(i).get("MSG_CONTENT").toString().replaceAll(" ", "&nbsp;").replaceAll("\n", "<br>")%>
					</div>
		</div>
<%
			}
			else{
				%>
		<div class="ui item" style="margin-top:2px;">
					<div class="right floated header" style="margin-right:8px"><h4><%=list.get(i).get("MSG_DATE").toString() %></h4></div>
				    <img class="ui left floated avatar image" src="../../image/male.jpg" style="width:50px;height:50px" >
				    <div class="ui left floated teal header"><%=list.get(i).get("MSG_FROM").toString() %></div>
				    <div class="ui big left floated left pointing basic label">
				      <%=list.get(i).get("MSG_CONTENT").toString().replaceAll(" ", "&nbsp;").replaceAll("\n", "<br>")%>
					</div>
		</div>		
				<%
			}
		}
%>
	<script type="text/javascript">
		last_no = <%= list.get(list.size()-1).get("MSG_NO").toString() %>
	</script>
<%		
	}
%>