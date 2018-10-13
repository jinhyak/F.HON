<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<%@include file="../../include/include/subtop.jsp" %>
</head>
<body>
<script type="text/javascript">
$(document).ready(function() {
    $('.dropdown').dropdown()
});
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
							<div class="ui segment button" style="width:100%" onclick="location.href='../qna/qna.jsp'">
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
							 	         문의하기
								</div>
							</div>
						</div>
						<div class="center aligned column">
							<div class="ui segment" style="width:100%;">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 여기만 바뀌면 됨 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<form class="ui form">
	<div class="ui basic segment"><!-- start of segment -->
		<div class="ui grid"  style="text-align:left"><!-- start of grid -->
			<div class="row"><!-- first row start -->
				<div class="tree fields"><!-- start of fileds  -->
					<div class="field">
				<h5>제목</h5>
						<div class="ui input">
							<input type="text" name="qna_title">
						</div>
					</div>
					<div class="field">
					<h5>분류</h5>
						<div class="ui fluid selection dropdown">
						  <input type="hidden" name="qna_category">
						  <div class="default text">분류</div>
						  <i class="dropdown icon"></i>
						  <div class="menu">
						  	<div class="item" data-value="혼밥">혼밥</div>
						  	<div class="item" data-value="혼술">혼술</div>
						  	<div class="item" data-value="혼놀">혼놀</div>
						  </div>
						</div>
					</div>
				</div><!-- end of fileds -->
			</div><!-- end of row -->
			<div class="row"><!-- second row start -->
				<div class="field" style="width:100%">
					<h5>내용</h5>
					<textarea rows="25" name="qna_content"></textarea>
				</div>
			</div><!--second row end  -->
			<div class="row"><!-- third row start -->
				<div class="tree fields">
					<div class="field">
						<h5>비밀번호</h5>
						<input type="password" name="qna_pw">
					</div>
				</div>
			</div><!-- third row end -->
				<div class="row" align="right">
					<div class="two fields">
						<div class="field">
							<button class="ui button" type="button" onclick="insert_go()">문의등록</button>
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
<script type="text/javascript">
function insert_go(){
	$('.ui.form').
}
function insert_cancel(){
	location.href="./qna.jsp"
}
</script>

</body>
</html>