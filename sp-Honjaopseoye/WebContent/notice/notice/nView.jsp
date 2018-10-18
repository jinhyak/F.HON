<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	//List 받아옴
	List<Map<String, Object>> notiList = (List<Map<String, Object>>)request.getAttribute("notiList") ;
	int noti_no = 0;
	String noti_title = null;
	String noti_category = null;
	String noti_pw = null;
	String noti_writer = null;
	int noti_hit = 0;
	String noti_date = null;
	String noti_content = null;
	String noti_image = null;
	if (notiList!= null&&notiList.size()>0) {
		if (notiList.get(0).get("NOTI_NO") != null) {
			noti_no = Integer.parseInt(notiList.get(0).get("NOTI_NO").toString());
		}
		noti_title = notiList.get(0).get("NOTI_TITLE").toString();
		noti_category = notiList.get(0).get("NOTI_CATEGORY").toString();
		noti_pw = notiList.get(0).get("NOTI_PW").toString();
		noti_writer = notiList.get(0).get("NOTI_WRITER").toString();
		noti_hit = Integer.parseInt(notiList.get(0).get("NOTI_HIT").toString());
		noti_date = notiList.get(0).get("NOTI_DATE").toString();
		noti_content = notiList.get(0).get("NOTI_CONTENT").toString();
		if (notiList.get(0).get("NOTI_IMAGE") != null) {
			noti_image = notiList.get(0).get("NOTI_IMAGE").toString();
		}
		else{
			noti_image = "noSearch.png";
		}
	}
	//이전, 다음번호 담아오는 select문에서 받아온 것
	List<Map<String, Object>> PN_select = null;
	String PREV_TITLE = null;
	String NEXT_TITLE = null;
	int NEXT_NOTI_NO = 0;
	int PREV_NOTI_NO = 0;
	if (request.getAttribute("PN_select") != null) {
		PN_select = (List<Map<String, Object>>) request.getAttribute("PN_select");
		PREV_TITLE = PN_select.get(0).get("PREV_TITLE").toString();
		NEXT_TITLE = PN_select.get(0).get("NEXT_TITLE").toString();
		PREV_NOTI_NO = Integer.parseInt(PN_select.get(0).get("PREV_NOTI_NO").toString());
		NEXT_NOTI_NO = Integer.parseInt(PN_select.get(0).get("NEXT_NOTI_NO").toString());
	}
	//update시
	List<Map<String, Object>> updateList = (List<Map<String, Object>>)request.getAttribute("updateList");
	if (updateList != null && updateList.size()>0) {
		noti_title = updateList.get(0).get("NOTI_TITLE").toString();
		noti_writer = updateList.get(0).get("NOTI_WRITER").toString();
		noti_content = updateList.get(0).get("NOTI_CONTENT").toString();
		noti_pw = updateList.get(0).get("NOTI_PW").toString();
		noti_category = updateList.get(0).get("NOTI_CATEGORY").toString();
		noti_image = updateList.get(0).get("NOTI_IMAGE").toString();
		PREV_TITLE = updateList.get(1).get("PREV_TITLE").toString();
		NEXT_TITLE = updateList.get(1).get("NEXT_TITLE").toString();
		PREV_NOTI_NO = Integer.parseInt(updateList.get(1).get("PREV_NOTI_NO").toString());
		NEXT_NOTI_NO = Integer.parseInt(updateList.get(1).get("NEXT_NOTI_NO").toString());
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var NEXT_NOTI_NO = '<%=NEXT_NOTI_NO%>';
	var PREV_NOTI_NO = '<%=PREV_NOTI_NO%>';
	var noti_no = '<%=noti_no%>';
	var noti_title = '<%=noti_title%>';
	var noti_pw = '<%=noti_pw%>';
	var noti_writer = '<%=noti_writer%>';
	var noti_content = <%=noti_content%>
</script>
</head>
<body>
<%@ include file="../../include/include/subtop.jsp" %>
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
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 여기만 바뀌면 됨 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
							<div class="ui basic segment">
								<form name="f_update" id="f_update">
										<div>
											<div id="titles"style="margin-left: 30px; margin-top: 3px; text-align: left">
												<font size="4.5px"><%=noti_title%></font>
											<input type="hidden" value="<%=noti_title%>" name="noti_title">		
											</div>
											<div id="date" class="left aligned column;"
												style="text-align: left; margin-left: 30px; margin-top: 5px;">
												<h5>2018.10.13</h5>
											</div>
											<div style="float: right; margin-right: 10px" id="hit">
												<h5 style="color: #747474">
													조회수
													<%=noti_hit%></h5>
											</div>
										</div>
										<h2 class="ui left floated header" style="margin-top: 3px"></h2>
										<div class="ui clearing divider"></div>
											<div>
												<h1>[Event] 제2회 혼자옵서예 내가 뽑은 베스트 후기는?</h1>
											</div>
											<input type="hidden" value="<%=noti_no%>" name="noti_no">
											<input type="hidden" value="<%=noti_writer%>" name="noti_writer">
											<input type="hidden" value="<%=noti_writer%>" name="noti_pw">
											<div style="justify-content: center; margin-top: 30px;">
												<%=noti_content%>
											<input type="hidden" value="<%=noti_content%>" name="noti_content">	
											</div>
											<div style="height: 100%">
												<%
													if (noti_image == null) {
												%>
												<script>
													$('#imgs').hide();
												</script>
												<%
													} else if (noti_image != null) {
												%>

												<img id="imgs" src="/sp-Honjaopseoye/image/<%=noti_image%>">
												<%
													}
												%>
											</div>
										</form>
											<div style="margin-bottom: 30px"></div>
											<div>
												<table class="ui celled table" id="np_select">
													<thead>
														<tr>
															<th width="100px;">이전글 <i class="angle up icon"></i></th>
															<td><a id="PrevTag" style="color: black"
																href="javascript:next(PREV_NOTI_NO)"><%=PREV_TITLE%></a></td>
														</tr>
														<tr>
															<th width="100px;">다음글 <i class="angle down icon"></i></th>
															<td><a id="NextTag" style="color: black"
																href="javascript:prev(NEXT_NOTI_NO);"><%=NEXT_TITLE%></a></td>
														</tr>
													</thead>
												</table>
											</div>
										</div>
									</div>

									<table align="right" style="padding-bottom: 10px">
										<tr align="right">
											<td id="noti_modify">
												<div>
													<button class="ui grey button"  onClick='modifier()'>수정</button>
												</div>
											</td>
								
											<td id="noti_delete">
												<div>
													<button class="ui grey button" onClick='remover()'>삭제</button>
												</div>
											</td>
											<td>
												<div>
													<button class="ui grey button" onClick='goBack()'>목록</button>
												</div>
											</td>
										</tr>
									</table>
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
<script type="text/javascript">
	function remover() {
		alert("삭제 ㄱㄱ");
		location.href = "/sp-Honjaopseoye/menu/nDelete.hon?NOTI_NO=" + noti_no;
	}
	function goBack() {
		location.href = "/sp-Honjaopseoye/notice/notice/notice.jsp"
	}
	function modifier(){
		alert("들감");
	    $("#f_update").attr('method','post');
	    $("#f_update").attr('action','../notice/notice/n_modify.jsp');
		$("#f_update").submit();
	}
	$(document).ready(function() {
		if (level == 'master') {
			alert(level)
			$("#noti_modify").show();
			$("#noti_delete").show();
	
		} else {
			$("#noti_modify").hide();
			$("#noti_delete").hide();
		}
	});
</script>
<%@ include file="../../include/include/bottom.jsp"%>
</body>
</html>