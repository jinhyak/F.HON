<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	String grade_id = null;
	String mem_id = null;
	String grade_level = null;
	List<Map<String, Object>> memList = null;
	if (session.getAttribute("memList") != null) {
		memList = (List<Map<String, Object>>) session.getAttribute("memList");
		grade_id = memList.get(0).get("GRADE_ID").toString();
		grade_level = memList.get(0).get("GRADE_LEVEL").toString();
	}
String noti_no = null;
String noti_title = null;
String noti_category = null;
String noti_pw = null;
String noti_writer = null;
int noti_hit = 0;
String noti_date = null;
String noti_content = null;
String noti_image = null;
List<Map<String, Object>> notiList = (List<Map<String, Object>>) request.getAttribute("notiList");
System.out.print(notiList);

		noti_title = notiList.get(0).get("NOTI_TITLE").toString();
		noti_category = notiList.get(0).get("NOTI_CATEGORY").toString();
		noti_pw = notiList.get(0).get("NOTI_PW").toString();
		noti_writer = notiList.get(0).get("NOTI_WRITER").toString();
		noti_date = notiList.get(0).get("NOTI_DATE").toString();
		noti_content = notiList.get(0).get("NOTI_CONTENT").toString();
noti_no = request.getParameter("noti_no");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../include/include/commonUI.jsp"%>
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
<script>
var noti_no = '<%=noti_no%>'
	function modify(){
		location.href="../../menu/nUpdate.hon?noti_no="+noti_no;
	}
</script>
</head>
<body>
	<jsp:include page="../../include/include/subtop.jsp" />

	<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
	<div class="ui header"
		style="margin-left: 150px; margin-right: 150px; margin-top: 100px; margin-bottom: 100px">
		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ index @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<div class="ui two attached stackable column grid" style="width: 100%">
			<div style="width: 20%;">
				<div class="ui field" style="height: 800px">
					<div class="ui segment">
						<div class="ui one column grid">
							<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 말머리 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
							<div class="center aligned column"></div>
							<div class="center aligned column"></div>
							<div class="center aligned column"></div>
							<div class="center aligned column">
								<div class="ui large header">공지사항</div>
							</div>
							<div class="right aligned column"></div>
							<div class="right aligned column"></div>
							<div class="right aligned column">
								<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 목록 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
								<div class="ui segment button" style="width: 100%">
									<a href="#"> 공지사항 </a>
								</div>
							</div>
							<div class="right aligned column">
								<div class="ui segment button" style="width: 100%">
									<a href="#"> qna </a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ contents @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
			<div class="column" style="width: 80%;">
				<div class="ui field">
					<div class="ui segment">
						<div class="ui center aligned one column grid">
							<div class="center aligned column">
								<div class="ui segment">
									<div class="ui large header">공지사항</div>
								</div>
							</div>
							<div class="center aligned column">
								<div class="ui segment" style="width: 100%; height: 100%">

									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 여기만 바뀌면 됨 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

									<a href="#"> 회원 정보 form </a>

									<div class="ui segment">
										<h2>공지사항</h2>
										<hr size="10px" color="red">
										<h2 class="ui left floated header" style="margin-top: 3px"></h2>
										<div class="ui clearing divider"></div>
										<form id="f_insert" name="f_insert" method="post" 
											enctype="multipart/form-data">
											<table class="ui definition table">
												<tbody>
													<tr>
														<td align="center">제목</td>
														<td align="left">
															<div class="ui input focus">
																<input type="text" placeholder="제목" id="noti_title"
																	name="noti_title" style="width: 1000px;" value="<%=noti_title%>">
															</div>
														</td>
													</tr>
													<tr>
														<td align="center">작성자</td>
														<td align="left">
															<div class="ui input focus" style="align: left;">
																<input type="text" style="width: 1000px;"
																	id="noti_writer" name="noti_writer"
																	value='<%= grade_id%>' disabled="disabled">
															</div>
														</td>
													</tr>
													<tr>
														<td align="center">분류</td>
														<td align="center">
															<div class="ui selection dropdown"
																style="border: 1px solid #85B7D9" id="noti_category"
																name="noti_category">
																<input type="hidden" name="noti_category"> <input
																	type="hidden" name="gender"> 
																	<input type="hidden" value="0" name="c_d" id="c_d"><i
																	class="dropdown icon"></i>
																<div class="default text">카테고리</div>
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
															</div>
														</td>
													</tr>
													<tr>
														<td style="justify-content: center">내용</td>
														<td align="left"><textarea id="noti_content" name="noti_content"
																style="width: 100%; height: 500px; text-align: left;">
																<%=noti_content%>
													</textarea></td>
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
												$("#c_d").val(c);
												$('.ui.dropdown')
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
		<jsp:include page="../../include/include/bottom.jsp" />
	</div>
</body>
</html>