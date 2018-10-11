<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>	
<%
	String smem_name = null;
		List<Map<String, Object>> memList = (List<Map<String, Object>>) session.getAttribute("memList");
	if ((List<Map<String, Object>>)memList != null) {
		smem_name = memList.get(0).get("MEM_NAME").toString();
	}
%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="../Semantic/semantic.css" />
<script src="../Semantic/js/jquery-1.12.0.js"></script>
<script src="../Semantic/semantic.js"></script> 
<title>메인</title>
</head>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#sul_go").click(function(){
		location.href="./sulBoard.jsp";
	});
	
	$("#bab_go").click(function(){
		location.href="./babBoard.jsp";
	});
	
	$("#nol_go").click(function(){
		location.href="./nolBoard.jsp";
	});
	
	$("#g_insert").click(function(){
		location.href="./write.jsp";
	});

})

</script>
<body>


<br>
<br>
<br>
<!-- 로고 임-->
<table align="center" width="850px" height="200px">
<tr><td align="center"><img src="./images/logo.png"></td></tr>
</table>
<!-- 로고 끝 -->

<!-- 테이블 위 -->
<table align="center" width="900px" height="100px">
<tr>
<td align="center">
<font size="10" color="black">혼밥 게시판</font>
</td>
</tr>
</table>
<!-- 테이블 위 끝  -->

<!-- 전체 틀 -->
<table width="900px" height="1000px" align="center">
<!-- 중 헤드 -->
<tr>
<td>
<!--  조회수 업 -->
<table width="890px" height="230px" align="center">
<!-- 조회수 헤드  -->
<thead>

<tr>
<td align="center" colspan="4" height="100px"><font size="5" color="black"><strong>월간 최고 조회수 리뷰</strong></font></td>
</tr>

</thead>
<!-- 조회수 헤드  끝 -->
<tr height="180px">
<td align="center"><img src="./images/1.jpg" width="215px" height="200px"></td>
<td align="center"><img src="./images/2.jpg" width="215px" height="200px"></td>
<td align="center"><img src="./images/3.jpg" width="215px" height="200px"></td>
<td align="center"><img src="./images/4.jpg" width="215px" height="200px"></td>
</tr>
<!-- 버튼 이벤트 라인  -->
<tr>
<td id="best_1" align="center" width="200px">
<pre><font size="2" color="black"><strong>가산동 돈까스 맛집!! 리뷰</strong></font>

조회수: 5250192</pre>
</td>

<td align="center" width="200px">
<pre><font size="2" color="black"><strong>치맥은 역시 강남! 치밥 치맥집</strong></font>

조회수: 4432134</pre>
</td>

<td align="center" width="200px">
<pre><font size="2" color="black"><strong>혼밥 추천합니다!!</strong></font>

조회수: 3387123</pre>
</td>

<td align="center" width="200px">
<pre><font size="2" color="black"><strong>E마트 푸드코트 추천!</strong></font>

조회수: 194720</pre>
</td>
<!-- 버튼 이벤트 라인 끝 -->
</tr>

</table>
<!--  조회수 업 -->
</td>
</tr>
<!-- 중 헤드 -->

<tr>
<td>
<button class="positive ui button" id="bab_go">혼밥</button>
<button class="positive ui button" id="sul_go">혼술</button>
<button class="positive ui button" id="nol_go">혼놀</button>
<!-- 목록  -->
<table align="center" class="ui unstackable table">
  <thead>
    <tr>
      <th>카테고리</th>
      <th>제목</th>
      <th>작성자</th>
      <th class="right aligned">조회수</th>
    </tr>
  </thead>
  <!-- 게시글 목록 -->
  <tbody>
  <!-- 최신 1 -->
    <tr id="n_1" onMouseDown="this.style.backgroundColor='#F6CED8'"
          onMouseUp="this.style.backgroundColor=''">
      <td>혼밥</td> <!-- 작성자 -->
      <td>님들아 님들아</td> <!-- 제목 -->
      <td class="reft aligned">beyonce200</td> 
      <td class="right aligned">1</td> <!-- 조회수 -->
    </tr>
  </tbody>
  <!-- 게시글 목록 -->
  <tfoot>
    <tr><th colspan="5">
      <div class="ui right floated pagination menu">
        <a class="icon item">
          <i class="left chevron icon" id="list_l"></i>
        </a>
        <a class="item" id="list_1" name="list_1">1</a>
        <a class="item" id="list_2" name="list_2">2</a>
        <a class="item" id="list_3" name="list_3">3</a>
        <a class="item" id="list_4" name="list_4">4</a>
        <a class="icon item">
          <i class="right chevron icon" id="list_r"></i>
        </a>
      </div>
    </th>
  </tr></tfoot>
</table>
<!-- 목록  -->
</td>
</tr>
<tr>
<td>
<!-- 하단  -->
<table align="center">
<tr>
<td width="300px" height="60px" align="left">
<!-- 검색 하기 -->
<div class="ui search">
  <div class="ui icon input">
    <input class="prompt" type="text" placeholder="검색하세요" width="200px">
    <i class="search icon"></i>
  </div>
  
<!-- 선택 검색 -->
<select name="bab_category" id="bab_category">
<option value="혼놀">제목</option>
<option value="혼술">작성자</option>
</select>
<!-- 선택 검색 끝 -->

  <div class="results"></div>
  
</div>
<!-- 검색 하기  끝-->
</td>
<td width="600px" height="60px" align="right" style="size: 10;">
	<button class="ui primary button" id="g_insert" name="g_insert"> 
  글 쓰기
</button>
</td>
</tr>
</table>
<!-- 글쓰기 버튼 -->
<!-- 하단  -->
<!-- 글쓰기 버튼 끝  -->
</td>
</tr>
</table>
<!-- 전체 틀 -->
<br>
<br>
<br>

<%@ include file="/include/include/bottom.jsp" %>
</body>
</html>