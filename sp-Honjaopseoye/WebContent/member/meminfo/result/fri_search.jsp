<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
List<Map<String,Object>> list = null;
list = (List<Map<String,Object>>)request.getAttribute("result");
if(list!=null){
	for(int i=0;i<list.size();i++){
%>
   <div class="ui item" class="fri_search" >
    <div class="right floated content">
      <div class="ui button btnclick">추가하기</div>
    </div>
    <img class="ui left floated avatar image" src="../../image/male.jpg" style="width:50px;height:50px">
    <div class="left floated content" style="width:70px;">
    	<div class="ui teal header"><%=list.get(i).get("MEM_ID")%></div>
	    <div class="discription"><%=list.get(i).get("MEM_NAME")%></div>
    </div>
    <div class="left floated content" style="padding-left:5px">
    	<div class="ui header">
      	  <%=list.get(i).get("MEM_BIRTH")%>
    	</div>
	    <div class="discription">
	      <%=list.get(i).get("MEM_EMAIL")%>
	    </div>
    </div>
  </div>
<%	}
}
%>	
	<script>
	$(".btnclick").click(function(){
		var button = $(this);
		var item = button.parent().parent();
		var div_menu = item.children();
		var fri_id = div_menu.eq(2).children().eq(0).text();
		var fri_name = div_menu.eq(2).children().eq(1).text();
		var fri_birth = div_menu.eq(3).children().eq(0).text().trim();
		var fri_email = div_menu.eq(3).children().eq(1).text().trim();
		var param = "mem_id="+mem_id+"&fri_id="+fri_id+"&fri_name="+fri_name+"&fri_birth="+fri_birth+"&fri_email="+fri_email+"&mem_name="+mem_name+"&mem_birth="+mem_birth+"&mem_email="+mem_email
		$.ajax({
			 method:"post"
			,data:param
			,url:"../../friend/insert.hon"
			,success:function(data){
				if(data==1){
					alert("친구가 성공적으로 추가되었습니다")
					item.remove();
				}
				else{
					alert("친구 추가가 실패하였습니다.")
				}
			}
			,error:function(data){
				alert("실패");
			}
		})
	})
	</script>

