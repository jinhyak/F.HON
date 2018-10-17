<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List, java.util.Map, java.util.ArrayList, java.util.HashMap"%>
<%
String keyword = "답글";
String qna_no = null;
String qna_title = null;
String qna_category = null;
String qna_writer = null;
String qna_hit = null;
String qna_date = null;
String qna_content = null;
String qna_step = null;
String qna_depth = null;
String qna_group = null;
            

 List<Map<String, Object>> conQnABoardIdList = (List<Map<String, Object>>)request.getAttribute("conQnABoardIdList");

 	qna_no = conQnABoardIdList.get(0).get("QNA_NO").toString();
	qna_title = conQnABoardIdList.get(0).get("QNA_TITLE").toString();
	qna_category = conQnABoardIdList.get(0).get("QNA_CATEGORY").toString();
	qna_writer = conQnABoardIdList.get(0).get("QNA_WRITER").toString();
	qna_hit = conQnABoardIdList.get(0).get("QNA_HIT").toString();
	qna_date = conQnABoardIdList.get(0).get("QNA_DATE").toString();
	qna_content = conQnABoardIdList.get(0).get("QNA_CONTENT").toString();
	qna_step = conQnABoardIdList.get(0).get("QNA_STEP").toString(); 
	qna_depth = conQnABoardIdList.get(0).get("QNA_DEPTH").toString(); 
	qna_group = conQnABoardIdList.get(0).get("QNA_GROUP").toString();
	System.out.print("qna_no"+ qna_no+
			"qna_title" + qna_title +
			"qna_category" + qna_category +
			"qna_writer" + qna_writer + 
			"qna_hit" + qna_hit +
			"qna_date" +  qna_date + 
			"qna_content" + qna_content +
			"qna_step" +  qna_step + 
			"qna_depth" + qna_depth +
			"qna_group" + qna_group);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- qnaView에서 받은 값을 유지시킨채로 이동한다. -->
<title>Insert title here</title>

<%@include file="../../include/include/subtop.jsp" %>
</head>
<body>
<script type="text/javascript">

$(document).ready(function() {
    $('.dropdown').dropdown()
});
function insert_go(){
	var qna_pw = $('#qna_pw').val();
	if(qna_pw==null || qna_pw==""){
		alert("비밀번호를 입력해 주세요.");
		return
	}
	else{
		$('.ui.form').submit();
	} 
	$('.ui.form').submit();
}
function insert_cancel(){
	location.href="../notice/qna/qna.jsp"
}
</script>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<div class="ui header" style="margin-left:150px;margin-right:150px; margin-top:100px;margin-bottom:100px">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ index @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
	<div class="ui two attached stackable column grid" style="width:100%">
		<div class="center aligned column"style="width:20%;">
			<div class="ui field" style="height:800px">
				<div class="ui segment">
					<div class="ui one column grid">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 말머리 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						<div class="center aligned column">
						</div>
						<div class="center aligned column">
						</div>
						<div class="center aligned column">
							<div class="ui large header">
							 	<img src="/sp-Honjaopseoye/image/logo.png" style="width:100%;heigth:100%">
							</div>
						</div>
						<div class="right aligned column">
						</div>
						<div class="right aligned column">
						</div>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 목록 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%" onclick="location.href='../notice/notice.jsp'">
								<h3> 공지사항 </h3>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%" onclick="location.href='../notice/qna/qna.jsp'">
								<h3> QnA </h3>
							</div>
						</div>
					</div>	
				</div>
			</div>
		</div>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ contents @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<div class="column"style="width:80%;">
			<div class="ui field">
				<div class="ui segment">
					<div class="ui center aligned one column grid">
						<div class="center aligned column">
							<div class="ui segment">
								<div class="ui large header">
							 	         답변하기
								</div>
							</div>
						</div>
						<div class="center aligned column">
							<div class="ui segment" style="width:100%;">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 여기만 바뀌면 됨 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<form class="ui form" action="../menu/qInsert.hon?qna_writer=<%=qna_writer%>&keyword=<%=keyword%>&qna_depth=<%=qna_depth%>&qna_step=<%=qna_step%>&qna_group=<%=qna_group%>&qna_title=RE:<%=qna_title%>&qna_category=<%=qna_category%>" method="post"accept-charset="UTF-8">
	<div class="ui basic segment"><!-- start of segment -->
		<div class="ui grid"  style="text-align:left"><!-- start of grid -->
			<div class="row"><!-- first row start -->
				<div class="tree fields"><!-- start of fileds  -->
					<div class="field">
					<h5>제목</h5>
						<div class="ui input">
							<input type="text" id="qna_title" name="qna_title" disabled="disabled" value="RE:<%=qna_title %>">
						</div>
					</div>
					<div class="field">
					<h5>분류</h5>
						<div class="ui fluid selection dropdown">
						  <input type="hidden" name="qna_category">
						  <div class="default text"><%=qna_category %></div>
						</div>
					</div>
				</div><!-- end of fileds -->
			</div><!-- end of row -->
			<div class="row"><!-- second row start -->
				<div class="field" style="width:100%">
					<h5>내용</h5>
					<textarea rows="25" id="qna_content" name="qna_content"><%=qna_content%>
		Re:==========================================================================>
					
					</textarea>
				</div>
			</div><!--second row end  -->
			<div class="row"><!-- third row start -->
				<div class="tree fields">
					<div class="field">
						<h5>비밀번호</h5>
						<input type="password" id="qna_pw" name="qna_pw">
					</div>
				</div>
			</div><!-- third row end -->
				<div class="row" align="right">
					<div class="two fields">
						<div class="field">
							<button class="ui button" type="button" onclick="insert_go()">답변등록</button>
						</div>
						<div class="field">
							<button class="ui button" type="button" onclick="insert_cancel()">취소하기</button>
						</div>
					</div>
				</div>
		</div>
	</div>
</form>

<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 여기만 바뀌면 됨 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
							</div>
						</div>
					</div>	
				</div>
			</div>
		</div>
	</div>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
</div>
<%@ include file="../../include/include/bottom.jsp" %>


</body>
</html>
