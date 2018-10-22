<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import=" hj.util.HangulConversion" %>
<%
HangulConversion hc = new HangulConversion();
String noti_no = null;
String noti_title = null;
String noti_category = null;
String noti_pw = null;
String noti_writer = null;
int noti_hit = 0;
String noti_date = null;
String noti_content = null;
String noti_image = null;
noti_no = hc.toUTF(request.getParameter("noti_no"));
noti_title = hc.toUTF(request.getParameter("noti_title"));
noti_pw = hc.toUTF(request.getParameter("noti_pw"));
noti_writer = hc.toUTF(request.getParameter("noti_writer"));
noti_content = hc.toUTF(request.getParameter("noti_content"));
noti_category = hc.toUTF(request.getParameter("noti_category"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
img {
	width: 100%;
	height: 100%;
	overflow: auto;
}
textarea {
	resize: none;
}
</style>
<script>
	function btn_cancel(){
		location.href="./notice.jsp"
	}
</script>
</head>
<body>
	<%@ include file="../../include/include/subtop.jsp" %>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
	<div class="ui header" style="margin-left: 150px; margin-right: 150px; margin-top: 100px; margin-bottom: 100px">
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
							<div class="ui segment button" style="width:100%;" onclick="location.href='/sp-Honjaopseoye/notice/notice/notice.jsp'">
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
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 여기만 바뀌면 됨 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
									<div class="ui basic segment">
										<form id="f_insert" name="f_insert" method="post" 
											enctype="multipart/form-data">
											<table class="ui definition table">
												<tbody>
													<tr>
														<td align="center">제목</td>
														<td align="left">
															<div class="ui input focus">
															<input type="hidden" value="<%=noti_no %>" name="noti_no">
																<input type="text" placeholder="제목" id="noti_title"
																	name="noti_title" style="width: 1000px;" value="<%=noti_title%>">
																<input type="hidden" name="noti_title"value="<%=noti_title%>">
															</div>
														</td>
													</tr>
													<tr>
														<td align="center">작성자</td>
														<td align="left">
															<div class="ui input focus" style="align: left;">
																<input type="text" style="width: 1000px;"id="noti_writer" name="noti_writer"value='<%= mem_id%>' readonly="readonly">
															</div>
														</td>
													</tr>
													<tr>
														<td align="center">분류</td>
														<td align="center">
															<div class="ui selection dropdown" 
																style="border: 1px solid #85B7D9" id="noti_category"name="noti_category">
																<input type="hidden" name="noti_category" value="<%=noti_category%>"> <i class="dropdown icon"></i>
																<div class="default text"></div>
																<div class="menu">
																	<div class="item" data-value="전체" name="all">전체</div>
																	<div class="item" data-value="혼놀" name="nol">혼놀</div>
																	<div class="item" data-value="혼술" name="sul">혼술</div>
																	<div class="item" data-value="혼밥" name="bab">혼밥</div>
																</div>
															</div>
														</td>
													</tr>
													<tr>
														<td align="center">비밀번호</td>
														<td align="left">
															<div class="ui input focus" style="align: left;">
																<input type="password" style="width: 195px;"
																	id="noti_pw" name="noti_pw" value="<%= noti_pw%>">
																<input type="hidden" name="noti_pw"value="<%= noti_pw%>">
															</div>
														</td>
													</tr>
													<tr>
														<td style="justify-content: center">내용</td>
														<td align="left"><textarea id="noti_content" name="noti_content" style="width: 100%; height: 500px; text-align: left;"><%=noti_content%></textarea></td>
														<tr>
														<td align="center">첨부파일</td>
														<td align="left"><input type="file" id="noti_file"
															name="noti_file">
															</td>
													</tr>
												</tbody>
											</table>
										</form>
										<div style="margin-bottom: 30px"></div>
										<script>
											$(document).ready(function() {
												$('#noti_category')
													.dropdown()
												;
										
											});
										</script>
											<span style="margin-top: 10px; text-align: right; margin-bottom:100px;">
											<button class="ui grey button" onClick='modify()'>등록</button>
											</span>
											<span style="margin-top: 10px; text-align: right; margin-bottom:100px;">
											<button class="ui grey button" onClick='btn_cancel()'>취소</button>
											</span>
									
								</div>

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
	<div>
</div>
		<%@include file="../../include/include/bottom.jsp" %>
	<script>
	var noti_no = '<%=noti_no%>'
		function modify(){
			var noti_content = $("#noti_content").val();
			var noti_title = $("#noti_title").val();
			//alert(noti_title)
			var noti_pw = $("#noti_pw").val();
		if(noti_content == null || noti_content==""){
			alert('글을 작성해 주세요.');
		}
		else if(noti_title == null || noti_title==""){
			alert('제목을 작성해주세요.');
		}
		else if(noti_pw == null || noti_pw==""){
			alert('비밀번호를 입력해주세요.');
		}
		else{
			$("#f_insert").attr('method','post');
			$("#f_insert").attr('action','../../menu/nUpdate.hon');
			$("#f_insert").submit();
		}
	}
	</script>
	
</body>
</html>