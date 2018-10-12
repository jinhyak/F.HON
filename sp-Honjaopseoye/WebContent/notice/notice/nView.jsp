<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	List<Map<String, Object>> notiList = null;
	int noti_no = 0;
	String noti_title = null; 
	String noti_category = null;  
	String noti_pw = null; 
	String noti_writer = null; 
	int noti_hit = 0; 
	String noti_date = null; 
	String noti_content = null;
	if(request.getAttribute("notiList")!=null){
		notiList = (List<Map<String, Object>>)request.getAttribute("notiList");
		noti_no = Integer.parseInt(notiList.get(0).get("NOTI_NO").toString());
		noti_title = notiList.get(0).get("NOTI_TITLE").toString();
		noti_category = notiList.get(0).get("NOTI_CATEGORY").toString();
		noti_pw = notiList.get(0).get("NOTI_PW").toString();
		noti_writer = notiList.get(0).get("NOTI_WRITER").toString();
		noti_hit = Integer.parseInt(notiList.get(0).get("NOTI_HIT").toString());
		noti_date = notiList.get(0).get("NOTI_DATE").toString();
		noti_content = notiList.get(0).get("NOTI_CONTENT").toString();
	}
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../include/include/commonUI.jsp"%> <!-- 원래 include를 넣을 경우 forward했을 때 앞에 프로젝트명을 못읽기 때문에 ../../ 대신  앞에 프로젝트명 넣어서 사용해야 ui가 안깨져서 사용  --> 
<script type="text/javascript">
	function cancel() {
		history.back();
	}
</script>
<style type="text/css">
#textarea{resize: none;}
</style>
</head>
<body>
	<div class="ui top attached tabular menu">
		<div class="active item" style="width: 200px; margin-top: 50px;">공지사항</div>
	</div>
	<div class="ui bottom attached active tab segment">
		<form class="ui form">
			<div style="margin-left: 10px">
				<!-- ====================== start of 작성자 =============================== -->
				<div class="field">
					<div class="fields">
						<div class="field">
							<label style="padding-top: 5px;">작성자</label>
						</div>
						<div class="field" style="margin-left: 15px;">
							<input type="text" name="admin"  value="<%= noti_writer%>" readonly="readonly">
						</div>
					</div>
				</div>
				<!-- ====================== end of 작성자 =============================== -->
				<!-- ====================== start of 비밀번호 =============================== -->
				<div class="field">
					<div class="fields">
						<div class="field">
							<label style="padding-top: 5px;">비밀번호</label>
						</div>
						<div class="field" style="margin-left:1px;">
							<input type="password" name="admin_pw" value="<%=noti_pw%>" readonly="readonly">
						</div>
					</div>
				</div>
				<!-- ====================== end of 비밀번호 =============================== -->
				<!-- ====================== start of 분류 =============================== -->
				<div class="field">
					<div class="fields">
						<div class="field" style="margin-left: 28px;">
							<label style="padding-top: 5px;">분류</label>
						</div>
						<div class="field" style="margin-left:1px;">
							<input type="text" name="sort" value="<%=noti_category%>" readonly="readonly">
						</div>
					</div>
				</div>
			</div>
				<!-- ====================== end of 분류 =============================== -->
				<!-- ====================== start of 제목 =============================== -->
				<div class="field">
					<div class="fields">
						<div class="field">
							<label style="padding-top: 5px;">제목</label>
						</div>
						<div class="field" style="margin-left: 28px;">
							<input type="text" name="ask_title" placeholder="제목" value="<%=noti_title%>"
								style="width: 300px" readonly="readonly">
						</div>
					</div>
				</div>
				<!-- ====================== end of 제목 =============================== -->
				<!-- ====================== start of 내용 =============================== -->
				<div class="field">
					<div class="fields">
						<div class="field">
							<label style="padding-top: 5px;">내용</label>
						</div>
						<div class="field">
							<textarea id="textarea"style="width: 500px; margin-left: 28px;" readonly="readonly"><%=noti_content%></textarea>
						</div>
					</div>
				</div>
				<!-- ====================== end of 내용 =============================== -->
				<div
					style="text-align: center; margin-top: 50px; margin-bottom: 50px;">
				</div>
			</div>
		</form>
</body>
</html>