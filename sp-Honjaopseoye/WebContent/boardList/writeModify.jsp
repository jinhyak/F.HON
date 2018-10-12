<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.HashMap, java.util.ArrayList" %>

<%
	
	String no = null;
	String id = null;
	String title = null;
	String category = null;
	String hit = null;
	String date = null;
	String text = null;
	String url = null;


	/* DB데이터 뿌리기  */
	List<Map<String, Object>> conBoardUpdateSubList = (List<Map<String, Object>>)request.getAttribute("conBoardUpdateSubList");
	
	String key = (String)request.getAttribute("categoryKey");
	
	if(key.equals("혼밥")){
		
		no = conBoardUpdateSubList.get(0).get("BAB_NO").toString();
		id = conBoardUpdateSubList.get(0).get("BAB_ID").toString();
		title = conBoardUpdateSubList.get(0).get("BAB_TITLE").toString();
		category = conBoardUpdateSubList.get(0).get("BAB_CATEGORY").toString();
		hit = conBoardUpdateSubList.get(0).get("BAB_HIT").toString();
		date = conBoardUpdateSubList.get(0).get("BAB_DATE").toString();
		text = conBoardUpdateSubList.get(0).get("BAB_TEXT").toString(); 
		url = conBoardUpdateSubList.get(0).get("BAB_URL").toString(); 
		
	} else if(key.equals("혼술")){
		
		no = conBoardUpdateSubList.get(0).get("SUL_NO").toString();
	   	id = conBoardUpdateSubList.get(0).get("SUL_ID").toString();
	   	title = conBoardUpdateSubList.get(0).get("SUL_TITLE").toString();
	   	category = conBoardUpdateSubList.get(0).get("SUL_CATEGORY").toString();
	   	hit = conBoardUpdateSubList.get(0).get("SUL_HIT").toString();
	   	date = conBoardUpdateSubList.get(0).get("SUL_DATE").toString();
	   	text = conBoardUpdateSubList.get(0).get("SUL_TEXT").toString(); 
	   	url = conBoardUpdateSubList.get(0).get("SUL_URL").toString(); 
		
		
	} else if(key.equals("혼놀")){
		
		no = conBoardUpdateSubList.get(0).get("NOL_NO").toString();
	   	id = conBoardUpdateSubList.get(0).get("NOL_ID").toString();
	   	title = conBoardUpdateSubList.get(0).get("NOL_TITLE").toString();
	   	category = conBoardUpdateSubList.get(0).get("NOL_CATEGORY").toString();
	   	hit = conBoardUpdateSubList.get(0).get("NOL_HIT").toString();
	   	date = conBoardUpdateSubList.get(0).get("NOL_DATE").toString();
	   	text = conBoardUpdateSubList.get(0).get("NOL_TEXT").toString(); 
	   	url = conBoardUpdateSubList.get(0).get("NOL_URL").toString(); 
		
	}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../Semantic/semantic.css" />
<script src="../Semantic/js/jquery-1.12.0.js"></script>
<script src="../Semantic/semantic.js"></script>
<title>게시글 수정</title>
<!--이미지 미리보기 스크립트 구간 -->
<script type="text/javascript">

// 이미지 미리보기임
$(document).ready(function(){
	var no = '<%=no %>';
	var text = document.f_board.t_text;
	text.value = '<%=text %>'; 
	var sel = document.f_board.category;
	sel.value = '<%=category %>';
	alert(sel);
	
	
 	$(function() {
		$("#img_file").change(function() {
			readURL(this);
		});
	});
	
	function readURL(input) {
		alert("이미지");
		
			if (input.files && input.files[0]) {
				
				var reader = new FileReader();
			
					reader.onload = function(e) {
						$('#blah').attr('src', e.target.result);
					}

				reader.readAsDataURL(input.files[0]);
				} // if문
				
	} // readURL함수  
	
	$("#b_img").click(function(){
		
		var formData = new FormData(document.getElementById('f_board'));
		var img_file = $("#img_file").val();
		img_file = img_file.substring(12);
		
		// 이미지 등록 처리
		$.ajax({
			method:"POST"
		   ,url:"imageInsert.file"
		   ,data:formData
		   ,enctype:"multipart/form-data"
		   ,contentType: false
		   ,processData: false
		   ,success:function(formData){
			   
				//img_file = img_file.substring(12);
				text.value += "<br>" + "<img src='./images/" + img_file + "'>" +"<br>";
				alert("이미지 태그가 추가 되었습니다.");
			   
		   }
		   ,error:function(xhrObject){
			   alert("error:"+xhrObject.responseText);
		   }
		});
		
	});
	
	
	$("#b_cancel").click(function(){
		location.href="./mainBoardList.jsp";
	});
	
	$("#b_up").click(function(){
/* 	var t_category = $("#category").val();
	var t_title =  $("#title").val();
	var t_url = $("#url").val();
	var text_a = text.value 
		alert(category + t_title + t_url + text_a + no);
		alert("저장하러갑니다.");
		location.href='../boardList/Update.hon?num=' + no +"&category=" + t_category + "&title=" + t_title + "&url=" + t_url+"&text="+ text_a; */
		
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
<form id="f_board" name="f_board" action="../boardList/Update.hon?num=<%=no %>" method="post">

<!-- 입력 게시판 테이블   -->
<table align="center" border="1" width="800px" height="1000px" bgcolor="white">
<!-- 게시판 머리  -->
<thead align="center" style="width:800px; height:200px;">
<tr>
<td><img src="./images/logo.png" width="800px" height="200px"></td>
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

<input type="text" style="width: 260px; height: 18px;" placeholder="동영상URL" id="url" name="url" value="<%=url %>">
<input type="file" id="img_file" name="img_file" accept=".gif, .jpg, .png">
</td>
<!-- 기능 메뉴 끝 -->
</tr>

<!-- 글쓰기 -->
<tr>
<!-- 콤보박스  -->
<td width="800px" height="400px">
<select name="category" id="category">
<option value="혼놀">혼놀</option>
<option value="혼술">혼술</option>
<option value="혼밥" selected="selected">혼밥</option>
</select>
&nbsp;&nbsp;
<!-- 제목입력  -->
<div class="ui input focus">
<input type="text" placeholder="제목입력" value="<%=title %>" style="width:730px; height:23px;" id="title" name="title">
</div>
<!-- 글 입력 -->
<textarea style="width: 800px; height:600px;" id="t_text" name="t_text"></textarea>
<!-- 글 입력끝 -->

</td>
<!-- 글쓰기 끝 -->
</tr>

</tbody>

<!-- 게시판 입력 GUI 끝  -->

<!-- 테이블 하단 -->

 <tfoot align="center" style="width:800px; height:300px;">
        <!-- 이미지 미리보기  -->
        <!-- 이미지 미리보기 타이틀  -->
        <tr>
        <td><font size="3" color="blue">@이미지 미리보기@</font></td>
        </tr>
        <tr>
            <td width="200px" height="200px" align="center">
            <br>
			<img align="middle" id="blah" src="#" alt="" width="200px" height="200px" />
               <br>
               <br>
               <div class="ui animated button" tabindex="0" id="b_img" name="b_img">
  				<div class="visible content">이미지 등록</div>
 				 <div class="hidden content">
 				   <i class="right arrow icon"></i>
 					 </div>
						</div>
						<br>
               <br>
            </td>
        </tr>
        
        <!-- 버튼 GUI  -->
        <tr>
        <td width="800px" height="100px">
        <button class="negative ui button" id="b_cancel" name="b_cancel">취소하기</button>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button class="positive ui button" id="b_insert" name="b_up">등록하기</button>
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

<!-- 하단  -->
<%@ include file="/include/include/bottom.jsp" %>
</body>
</html>