<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList, java.util.HashMap" %>   

<%
request.setAttribute("qna_writer","beyonce200");

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


<%@ include file="../../include/include/commonUI.jsp" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../Semantic/semantic.css" />
<script src="../../Semantic/js/jquery-1.12.0.js"></script>
<script src="../../Semantic/semantic.js"></script>
<title>문의하기 수정</title>
<!--이미지 미리보기 스크립트 구간 -->
<script type="text/javascript">

// 이미지 미리보기
$(document).ready(function(){
	
	var text = document.qna_board.qna_content
	text.value += '<%=qna_content %>';
	
	$("#b_cancel").click(function(){
		location.href="./qna.jsp";
	});
	
}) /* 레디 끝  */



</script>
<!-- 이미지 미리보기 스크립트 구간  끝-->

<!-- 바디 스타일 -->
<style>
/* body {
	background-image: url('writerBackground.jpg');
} */

</style>
<!-- 바디 스타일 끝 -->

</head>


<body>
<!-- 상단  -->

<!-- 상단 끝 -->


<!-- @@@@@@@@@@@@@@@@@@@@ 게시판 작성 form @@@@@@@@@@@@@@@@@@@@  -->
<br>
<br>
<br>
<form method="Post" action="../qnaList/qnaUpdate.hon?qna_no=<%=qna_no %>" id="qna_board" name="qna_board">

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
<input type="text" placeholder="제목입력" value="<%=qna_title %>" style="width:730px; height:23px;" id="qna_title" name="qna_title">
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
<%@ include file="/include/include/bottom.jsp" %>

</body>
</html>
<!-- @@@@@@@@@@@@@@@@@@@@ 게시판 작성 form 끝 @@@@@@@@@@@@@@@@@@@@ -->

<!-- 하단  -->