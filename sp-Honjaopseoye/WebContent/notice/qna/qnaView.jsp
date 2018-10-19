<%@page
	import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List, java.util.Map, java.util.ArrayList, java.util.HashMap"%>

<%

String qna_no = null;
String qna_title = null;
String qna_category = null;
String qna_writer = null;
String qna_hit = null;
String qna_date = null;
String qna_content = null;

	List<Map<String, Object>> conQnABoardIdList = (List<Map<String, Object>>)request.getAttribute("conQnABoardIdList");
	
 	qna_no = conQnABoardIdList.get(0).get("QNA_NO").toString();
	qna_title = conQnABoardIdList.get(0).get("QNA_TITLE").toString();
	qna_category = conQnABoardIdList.get(0).get("QNA_CATEGORY").toString();
	qna_writer = conQnABoardIdList.get(0).get("QNA_WRITER").toString();
	qna_hit = conQnABoardIdList.get(0).get("QNA_HIT").toString();
	qna_date = conQnABoardIdList.get(0).get("QNA_DATE").toString();
	qna_content = conQnABoardIdList.get(0).get("QNA_CONTENT").toString(); 
	
%>


<%@ include file="../../include/include/commonUI.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의글</title>
<script type="text/javascript">

	$(document).ready(function() {


		var no = '<%=qna_no %>';
		var id = '<%=qna_writer %>';

		$("#list_sel").click(function() {

			location.href = "./qna.jsp";

		});

		$("#up_go").click(function() {

			location.href = "../notice/qnaUpdateSub.hon?qna_no=" + no

		});

		$("#de_go").click(function() {
			alert(no + id);
			location.href = '../notice/qnaDelete.hon?no=' + no + "&id=" + id;
		});


	})
</script>
</head>
<body>
	<!-- 상단 끝 -->
	<br>
	<br>
	<div align="center">
		<img src="/sp-Honjaopseoye/notice/qna/logo.png" width="800px"
			height="200px">
	</div>
	<br>
	<br>
	<br>

	<!-- 게시글 확인  -->
	<table align="center" width="1000px" height="1000px" bgcolor="white">


		<!-- 제목, 아이디, 글번호, 카테고리, 날짜,  -->
		<thead align="center" style="width: 1000px; height: 100px;">

			<tr>
				<td>
					<!-- 상단 테이블  -->
					<table align="center" width="1000px" height="100px">

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
					<button class="positive ui button" id="up_go" name="up_go"
						style="width: 100px;">수정</button>
					<button class="positive ui button" id="de_go" name="de_go"
						style="width: 100px;">삭제</button> <br> <!-- 목록 -->
				</td>
			</tr>
			<tr>
				<td><button class="ui primary button" id="list_sel">
						목록보기</button></td>
			</tr>


		</tbody>
		<!-- 작성 내용 끝 -->


		<!-- 댓글  -->
		<tfoot align="center" style="width: 1000px; height: 200px;">

			<tr>
				<td align="center">

					<table align="center">
						<tr height="100px">
							<td><h2 class="ui dividing header">답변 쓰기</h2></td>
						</tr>
						<tr>
						<tr height="100px">
							<td>
								<h2>
									<!-- 댓글 공간 -->
									<table align="center" width="900px" height="100px">
										<tr>
											<td>댓글 보는곳</td>
										</tr>
									</table>
									<!-- 댓글 공간 끝 -->
								</h2>
							</td>
						</tr>
						<tr>
							<td align="center"><textarea
									style="width: 855px; height: 85px; align-content: center;"></textarea>
							</td>
							<td align="center">&nbsp;&nbsp;&nbsp;&nbsp;
								<button class="positive ui button" id="bab_reply"
									name="bab_reply" style="width: 100px;">답변</button>
							</td>
						</tr>
					</table>

				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
		</tfoot>
		<!-- 댓글  -->

	</table>
	<!-- 게시글 확인 끝 -->

	<br>
	<br>
	<br>
	<br>
	<br>
	<%@ include file="../../include/include/bottom.jsp"%>

</body>