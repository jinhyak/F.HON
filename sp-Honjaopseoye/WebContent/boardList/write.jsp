<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>	
<%
	String smem_name = null;
		List<Map<String, Object>> memList = (List<Map<String, Object>>) session.getAttribute("memList");
	if ((List<Map<String, Object>>)memList != null) {
		smem_name = memList.get(0).get("MEM_NAME").toString();
	}
	
	// naver login
	Map<String, Object> pMap = null;
	if(session.getAttribute("nMem") != null){
		pMap = (Map<String, Object>)session.getAttribute("nMem");
		smem_name = pMap.get("nickname").toString();
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
		alert("이미지 버튼");
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
				texts.value += " " + "<img src='../boardList/images/" + img_file + "'>" +" ";
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
	var id = '<%=smem_name%>';
	var title = $("#title").val();
	var text = $("#text").val();
	var pw = $("#pw").val();
	
		alert("1 :"+category+"2 :"+id+"3 :"+title+"4 :"+text+"5 :"+pw);
	
		if(category=="" || title=="" || text=="" || pw==""){
			
			alert("공백을 넣을 수 없습니다.");
			
		} else {
			
			$("#f_data").attr('method', 'post');
			$("#f_data").attr('action', '../board/boardInsert.hon?category='+ category + "&id=" + id)
			$("#f_data").submit();
			
			
		}
		
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
    <input type="text" placeholder="제목을 입력해 주세요" id="title" name="title">
  </div>
</div>
</td>

<td align="left" width="300px" height="30px">
<input type="file" id="img_file" name="img_file" accept=".gif, .jpg, .png">
</td>

<td align="left" width="400px" height="30px">
<div class="ui input">
  <input type="text" placeholder="동영상 URL" id="url" name="url">
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