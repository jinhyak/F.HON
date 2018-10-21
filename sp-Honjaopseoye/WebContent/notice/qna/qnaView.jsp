<%@page
	import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
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
String qna_group = null;
String qna_depth = null;

	List<Map<String, Object>> list = (List<Map<String, Object>>)request.getAttribute("conQnABoardIdList");
	
 	qna_no = list.get(0).get("QNA_NO").toString();
	qna_title = list.get(0).get("QNA_TITLE").toString();
	qna_category = list.get(0).get("QNA_CATEGORY").toString();
	qna_writer = list.get(0).get("QNA_WRITER").toString();
	qna_hit = list.get(0).get("QNA_HIT").toString();
	qna_date = list.get(0).get("QNA_DATE").toString();
	qna_content = list.get(0).get("QNA_CONTENT").toString();
	qna_step = list.get(0).get("QNA_STEP").toString(); 
	qna_group = list.get(0).get("QNA_GROUP").toString(); 
	qna_depth = list.get(0).get("QNA_DEPTH").toString(); 
%>

<%@ include file="../../include/include/commonUI.jsp"%>
<%@ include file="../../include/include/subtop.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의글</title>
<script type="text/javascript">

	$(document).ready(function() {

		var keyword = '<%=keyword %>';
		var no = '<%=qna_no %>';
		var id = '<%=qna_writer %>';
		var title = '<%=qna_title %>';
		var content = '<%=qna_content %>';

		$("#list_sel").click(function() {

			location.href = "../notice/qna/qna.jsp";

		});
		
		$("#re_go").click(function() {

			location.href='../menu/qView.hon?qna_no='+no+ "&keyword=" + keyword;
		});

		$("#up_go").click(function() {

			location.href = "../menu/qUpdate.hon?qna_no=" + no+ "&qna_title=" + title+ "&qna_content=" + content;

		});

		$("#de_go").click(function() {
			alert(no + id);
			location.href = '../menu/qnaDelete.hon?no=' + no + "&id=" + id;
		});


	})
</script>
</head>
<body>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
	<div class="ui header"style="margin-left: 150px; margin-right: 150px; margin-top: 100px; margin-bottom: 100px">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ index @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<div class="ui two attached stackable column grid" style="width: 100%">
			<div style="width: 20%;">
				<div class="ui field" style="height: 800px">
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
							<div class="ui segment button" style="width:100%; background-color:gray">
								<h3> 공지사항 </h3>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%;" onclick="location.href='/sp-Honjaopseoye/notice/qna/qna.jsp'">
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
							 	         공지사항
								</div>
							</div>
						</div>
						<div class="center aligned column">
							<div class="ui segment" style="width:100%;">

	<!-- 게시글 확인  -->
	<table align="center" width="100%" height="80%" bgcolor="white">


		<!-- 제목, 아이디, 글번호, 카테고리, 날짜,  -->
		<thead align="center" style="width:100%; height:80% ;">

			<tr>
				<td>
					<!-- 상단 테이블  -->
					<table align="center" width="100%" height="100px">

						<!-- 상위 -->
						<tr>
							<td align="left" rowspan="2"><p>
									<font color="gray">No.<%=qna_no%></font>
								</p></td>
							<td align="center" rowspan="2"><p>
									<font color="gray"> <%=qna_category%></font>
								</p></td>
							<td align="center" colspan="2" rowspan="2" width="600px"
								height="80px"><font size="6" color="gray"><%=qna_title%>
							</font></td>
							<td align="center" colspan="3"><font color="gray">작성일:<%=qna_date%></font></td>
						</tr>
						<tr>
							<td align="center" colspan="3"><font color="gray">작성자
									:<%=qna_writer%>
							</font></td>
						</tr>

						<!-- 부가 -->
					</table>

				</td>
			<tr>
				<td><h2 class="ui dividing header"></h2></td>
			</tr>

		</thead>
		<!-- 제목, 아이디, 글번호, 카테고리, 날짜 끝 -->

		<!-- 작성 내용 -->
		<tbody align="center" style="width: 1000px; height: 700px;">

			<tr>
				<!-- 상단부터 순서대로....  -->
				<td><pre>
<%=qna_content%>
</pre></td>

			</tr>

			<tr>
				<td align="right" style="width: 1000px; height: 100px;">
					<!-- 목록 -->
					<button class="positive ui button" id="re_go" name="re_go"
						style="width: 100px;">답글</button>
					<button class="positive ui button" id="up_go" name="up_go"
						style="width: 100px;">수정</button>
					<button class="positive ui button" id="de_go" name="de_go"
						style="width: 100px;">삭제</button>  <!-- 목록 -->
				<button class="ui primary button" id="list_sel">
						목록보기</button></td>
			</tr>


		</tbody>
		<!-- 작성 내용 끝 -->



	</table>
	<!-- 게시글 확인 끝 -->
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<%@ include file="../../include/include/bottom.jsp"%>

</body>