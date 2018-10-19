<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../include/include/commonUI.jsp"%>
<script type="text/javascript">
	function cancel() {
		window.close();
	}
</script>
<style type="text/css">
#textarea{resize: none;}
</style>
</head>
<body>
	<div class="ui top attached tabular menu">
		<div class="active item" style="width: 200px; margin-top: 50px;">1:1문의</div>
	</div>
	<div class="ui bottom attached active tab segment">
		<form class="ui form">
			<h4 class="ui dividing header">문의 내용</h4>
			<div style="margin-left: 10px">
				<!-- ====================== start of 작성자 =============================== -->
				<div class="field">
					<div class="fields">
						<div class="field">
							<label style="padding-top: 5px;">작성자</label>
						</div>
						<div class="field" style="margin-left: 15px;">
							<input type="text" name="mem_id" placeholder="작성자">
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
							<input type="password" name="mem_pw" placeholder="비밀번호">
						</div>
					</div>
				</div>
				<!-- ====================== end of 비밀번호 =============================== -->
				<!-- ====================== start of 분류 =============================== -->
				<div class="field">
					<div class="fields">
						<div class="field">
							<label style="padding-top: 5px;">분류</label>
						</div>
						<div class="field" style="margin-left: 28px;">
							<select class="ui search dropdown" id="hj_sort">
								<option value="">분류</option>
								<option value="bab">혼밥</option>
								<option value="sul">혼술</option>
								<option value="nol">혼놀</option>
							</select>
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
							<input type="text" name="ask_title" placeholder="제목"
								style="width: 300px">
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
							<textarea id="textarea"style="width: 500px; margin-left: 28px;"></textarea>
						</div>
					</div>
				</div>
				<!-- ====================== end of 내용 =============================== -->
				<div
					style="text-align: center; margin-top: 50px; margin-bottom: 50px;">
					<div class="ui primary submit button">보내기</div>
					<div id="btn_cancel" class="ui blue button" onClick="cancel()">취소</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>