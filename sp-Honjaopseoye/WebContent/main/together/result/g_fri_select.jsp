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
  <div class="item">
  	<div class="ui circular image">
      <img src="../../image/member/<%=gfriendList.get(i).get("MEM_IMG")%>" style="width:60px;height:60px;">
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
<%	}
}
%>	
<script>
$('.item').click(function() {
    var item = $(this);
    var div = item.children().eq(1);
    var fri_id = div.children().eq(0).text();
	console.log(fri_id);
	var fri = item.children().eq(0);//1번째 div
	var fri_img = fri.children().attr('src');
	console.log(fri_img);
	
	$("#fri_img").attr('src',fri_img);
	$("#fri_chat").modal({
		onApprove : function() {
			cmm_window_popup("/sp-Honjaopseoye/member/message/message.jsp?mem_id="+mem_id+"&fri_id="+fri_id, 800, 800, "메시지 등록")
		}
	}).modal('show');
});
</script>	