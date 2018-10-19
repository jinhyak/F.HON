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
	List<Map<String, Object>> conBoardUpdateSubList = (List<Map<String, Object>>)request.getAttribute("conBoardUpdateSub");
	
	String key = (String)request.getAttribute("category");
	
	if(conBoardUpdateSubList != null){
		
	
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
	} else {
		
	}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/include/include/subtop.jsp" %>
<title>Insert title here</title>
<script type="text/javascript">

//이미지 미리보기임
$(document).ready(function(){
	
	var no = '<%=no %>';
	var texts = document.f_data.text;
	texts.value += "<%=text %>";
	var c = '<%=category %>';
	$("#c_d").val(c);
	
	$('.ui.dropdown')
	  .dropdown()
	;
	
	var texts = document.f_data.text;
	
	$(function() {
		$("#img_file").change(function() {
			readURL(this);
		});
	});
	
	function readURL(input) {
		//alert("이미지");
		
			if (input.files && input.files[0]) {
				
				var reader = new FileReader();
			
					reader.onload = function(e) {
						$('#blah').attr('src', e.target.result);
					}

				reader.readAsDataURL(input.files[0]);
				} // if문
				
	} // readURL함수  
	
	
	$("#b_img").click(function(){
		
		var formData = new FormData(document.getElementById('f_data'));
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
				texts.value += "<br>" + "<img src='./images/" + img_file + "'>" +"<br>";
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
	
	$("#b_insert").click(function(){
	var category = $("#category").dropdown("get value");
	var id = "bey";
		$("#f_data").attr('method', 'post');
		$("#f_data").attr('action', '../board/Update.hon?category='+ category + "&id=" + id + "&no=" + no)
		$("#f_data").submit();
		
	});
	
}) /* 레디 끝  */

</script>
<!-- 이미지 미리보기 스크립트 구간  끝-->

</head>
<body>
<br>
<br>
<br>
<br>
<br>
<br>

<table align="center">
<tr><td>
</td></tr>
<tr>
<td>
<h2 class="ui center aligned icon header">
  <i class="circular users icon"></i>
  자유롭게 포스팅을 시작하세요!
</h2>

</td>
</tr>
</table>


<br>
<br>
<br>
<!-- 입력 -->
<form id="f_data" name="f_data">

<table align="center" width="1200px" height="1000px">
<tr>
<td>

<table align="center" width="1200px" height="1000px">

<thead>
<tr>
<td>

<table width="1000px" height="50px">
<tr>
<td align="left" width="200px" height="30px">

<div class="ui compact selection dropdown" id="category" name="category">
 <input type="hidden" value="0" name="c_d" id="c_d"> 
  <i class="dropdown icon"></i>
  <div class="text">카테고리</div>
  <div class="menu">
    <div class="item">혼밥</div>
    <div class="item">혼술</div>
    <div class="item">혼놀</div>
  </div>
</div>

</td>

<td align="left" width="900px" height="30px">
<div class="ui form">
  <div class="field">
    <input type="text" placeholder="제목을 입력해 주세요" id="title" name="title" value="<%=title %>">
  </div>
</div>
</td>

<td align="left" width="300px" height="30px">
<input type="file" id="img_file" name="img_file" accept=".gif, .jpg, .png">
</td>

<td align="left" width="400px" height="30px">
<div class="ui input">
  <input type="text" placeholder="동영상 URL" id="url" name="url" value="<%=url %>">
</div>
&nbsp;
<i class="video icon"></i>
</td>
</tr>

</table>

</td>
<td align="center">
포스팅
</td>
</tr>
</thead>
<!-- 게시판 글 -->

<tr>
<td align="center" colspan="4" height="400px">

<textarea style="width:1200px; height:700px;" id="text" name="text"></textarea>

</td>
</tr>

<!-- 비번입력  -->

<tr>
<td width="150px" height="30px">
<div class="ui input">
  <input type="text" placeholder="비밀번호 입력" id="pw" name="pw">
</div>
</td>
</tr>

<!-- 이미지 추가 -->

<tr>
<td align="center" width="300px" height="200px">
<img align="middle" id="blah" src="#" alt="" width="200px" height="200px" />
이미지 미리보기

</td>
<td width="1000px" height="200px" align="center" colspan="3">

<div class="ui animated fade button" id="b_img" name="b_img" tabindex="0" style="width:150px; height:150px">
  <div class="visible content"><pre>
  
 
  
이미지
  </pre></div>
  <div class="hidden content">
    이미지 등록하기
  </div>
</div>


</td>
</tr>

</table>

</td>
</tr> 
</table>
</form>

<table align="center" width="300px" height="300px">
<tr>
<td>
<button class="negative ui button" id="b_cancel" name="b_cancel">취소하기</button>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button class="positive ui button" id="b_insert" name="b_insert">등록하기</button>
</td>
</tr>
</table>


<br>
<br>
<br>

<%@ include file="/include/include/bottom.jsp" %>
</body>
</html>