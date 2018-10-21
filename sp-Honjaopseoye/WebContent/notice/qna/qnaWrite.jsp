<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../Semantic/semantic.css" />
<script src="../../Semantic/js/jquery-1.12.0.js"></script>
<script src="../../Semantic/semantic.js"></script>
<title>문의하기</title>
<style type="text/css">
img {
	width: 100%;
	height: 100%;
	overflow: auto;
}
</style>
<!--이미지 미리보기 스크립트 구간 -->
<script type="text/javascript">

// 이미지 미리보기
$(document).ready(function(){
	
	$("#b_cancel").click(function(){
		location.href="./qna.jsp";
	});
	
}) /* 레디 끝  */
<form method="Post" action="../../notice/qnaInsert.hon" id="qna_board" name="qna_board">
</script>
</head>
<body>
<!-- 입력 게시판 테이블   -->
<table align="center" border="1" width="800px" height="1000px" bgcolor="white">
<!-- 게시판 머리  -->
<thead align="center" style="width:800px; height:200px;">
<tr>
<td><img src="/sp-Honjaopseoye/notice/qna/logo.png" width="800px" height="200px"></td>
</tr>
</thead>
<!-- 게시판 머리 끝  -->


<!-- 테스트 -->


<!-- 테스트 -->



<!-- 게시판 입력 GUI  -->

<tbody style="width:800px; height:500px;" >
<tr>
<!-- 기능 메뉴 -->
<td width="800px" height="100px">

</td>
<!-- 기능 메뉴 끝 -->
</tr>

<!-- 글쓰기 -->
<tr>
<!-- 콤보박스  -->
<td width="800px" height="400px">
<select name="qna_category" id="qna_category">
<option value="혼놀">혼놀</option>
<option value="혼술">혼술</option>
<option value="혼밥" selected="selected">혼밥</option>
</select>
&nbsp;&nbsp;
<!-- 제목입력  -->
<div class="ui input focus">
<input type="text" placeholder="제목입력" style="width:730px; height:23px;" id="qna_title" name="qna_title">
</div>
<!-- 글 입력 -->
<textarea style="width: 800px; height:600px;" id="qna_content" name="qna_content"></textarea>
<!-- 글 입력끝 -->
<div class="ui input">
  <input type="text" placeholder="비번입력" id="qna_pw" name="qna_pw">
</div>
</td>
<!-- 글쓰기 끝 -->
</tr>
<tr>
<td>
</td>
</tr>
</tbody>

<!-- 게시판 입력 GUI 끝  -->

<!-- 테이블 하단 -->

 <tfoot align="center" style="width:800px; height:300px;">
        
        <!-- 버튼 GUI  -->
        <tr>
        <td width="800px" height="100px">
        <button class="negative ui button" id="b_cancel" name="b_cancel">취소하기</button>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button class="positive ui button" id="b_insert" name="b_insert">등록하기</button>
        </td>
        </tr>
        
    </tfoot>

<!-- 테이블 하단 끝 -->

</table>

</form>
<!-- 입력 게시판 테이블 끝  -->


<br>
<br>
<br>

<!-- @@@@@@@@@@@@@@@@@@@@ 게시판 작성 form 끝 @@@@@@@@@@@@@@@@@@@@ -->
<%@ include file="/include/include/bottom.jsp" %>
</body>
</html>
<!-- 하단  -->
