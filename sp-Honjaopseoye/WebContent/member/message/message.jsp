<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.ui.pointing.label{
  width: 300px;
  white-space: clipe;
  word-wrap:break-word;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../../include/include/commonUI.jsp" %>
<%
	String fri_id = null;
	String mem_id = null;
	if(request.getParameter("mem_id")!=null){
		mem_id = request.getParameter("mem_id");
	};
	if(request.getParameter("fri_id")!=null){
		fri_id = request.getParameter("fri_id");
	};
%>
<title>Insert title here</title>
</head>
<body>
<div class="ui container" style="width:793;heigth:600.53;margin-top:50px">
		<div class="ui top attached segment" style="background: rgba(0,0,0,0.1)">
		  <p><h3>채팅하기</h3></p>
		</div>
		<div class="ui attached segment pushable" style="width:100%;height:400px;" id="scroll">
			<div class="ui list" id="msgList">
			</div>
		</div>
		<div class="ui bottom attached segment"style="margin-top:20px;background:rgba(0,0,0,0.1);">
			<form id="f_sub">
			<div class="ui ten column grid">
				<div class="fourteen wide column">
			  <div class="ui form">
					<textarea id="context"rows="2" name="msg_content"></textarea>
			  </div>
				</div>
				<div class="two wide column">
					<div class="ui blue large button" id="msg_button"> 전송 </div>
				</div>
			</div>
			</form>
		</div>
</div>
<script>
var mem_id;
var fri_id;
mem_id = '<%=mem_id%>'
fri_id = '<%=fri_id%>'
var Lastno=0;
	$('#msg_button').click(function(){
		msgSubmit();
	});
	
	function msgSubmit(){
		var param=$("#f_sub").serialize()+"&msg_from="+mem_id+"&msg_to="+fri_id
		if(mem_id==null||mem_id==""||fri_id==null||fri_id==""){
			alert("오류입니다.")
		}
		else{
			$.ajax({
				 method:"post"
				,url:"../../message/insert.hon"
				,data:param
				,success:function(data){
					if(data==1){
						$("#scroll").scrollTop($("#msgList").height());
					}
					else{
						alert("전송 실패")
					}
				}
				,error:function(data){
					alert("전송 아작스 오류")
				}
			})
			$("#context").val("")
		}
	}
	
	function msgList(lastno){
		var param = "msg_from="+mem_id+"&msg_to="+fri_id+"&msg_no="+lastno;
		if(mem_id==""||mem_id==null||fri_id==""||fri_id==null){
			alert('비회원은 이용하실 수 없습니다.')
		}
		else{
			$.ajax({
				method:"post",
				data:param,
				url:"../../message/msgListByRecent.hon",
				success:function(data){
					if(data==""){
					}
					else{
						$("#msgList").append(data);
						Lastno = last_no;
					}
				},
				error:function(data){
					alert("메시지 로드 실패");
				}
			})
		}
	}
	function infinityMsg(){
		setInterval(function() {
			msgList(Lastno)
		}, 1000)
	}
	$(document).ready(function(){
		if(mem_id!='비회원'){
			msgList('0');
			infinityMsg();
		}
		else{
			alert("비회원은 안됨")
		}
	})
</script>
</body>
</html>