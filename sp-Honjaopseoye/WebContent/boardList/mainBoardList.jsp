<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>	
<%


	// 그냥 login
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
<title>메인</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#g_insert").click(function(){
		location.href="./write.jsp";
	});

})

</script>
<body>
<br>
<br>
<br>
<br>

<table align="center" border="1" width="600px" height="300px">
<tr>
<td align="center">
혼밥 게시판 타이틀
</td>
</tr>
</table>


<!--  -->

<table align="center" width="1000px" height="600px">
<tr>
<td>
<div class="ui grid" align="center" style="text-align:center">
        <div class="four wide column">
        
                <div class="ui card">
  <div class="ui slide masked reveal image" style="width:350px; height:150px;">
    <img src="./gui/i1.jpg" width="300px" height="300px" class="visible content">
    <img src="./gui/i2.jpg" width="300px" height="300px" class="hidden content">
  </div>
  <div class="content">
    <a class="header" href="./babBoard.jsp">평범한 일상</a>
    <div class="meta">
      <span class="date">혼밥 리뷰를 확인해 보세요!</span>
    </div>
  </div>
</div>
        
        </div>
        <div class="four wide column">
        
                <div class="ui card">
  <div class="ui slide masked reveal image" style="width:350px; height:150px;">
    <img src="./gui/i3.jpg" width="300px" height="300px" class="visible content">
    <img src="./gui/i4.jpg" width="300px" height="300px" class="hidden content">
  </div>
  <div class="content">
    <a class="header" href="./sulBoard.jsp">저녁의 여유</a>
    <div class="meta">
      <span class="date">혼술 리뷰를 확인해 보세요!</span>
    </div>
  </div>
</div>
        
        
        </div>
        <div class="four wide column">
        
        
                <div class="ui card">
  <div class="ui slide masked reveal image" style="width:350px; height:150px;">
    <img src="./gui/i5.jpg" width="300px" height="300px" class="visible content">
    <img src="./gui/i6.jpg" width="300px" height="300px" class="hidden content">
  </div>
  <div class="content">
    <a class="header" href="./nolBoard.jsp">혼자만의 여가</a>
    <div class="meta">
      <span class="date">혼놀 리뷰를 확인해 보세요!</span>
    </div>
  </div>
</div>
        
        
        </div>
        <div class="four wide column">
        
                        <div class="ui card">
  <div class="ui slide masked reveal image" style="width:350px; height:150px;">
    <img src="./gui/i7.jpg" width="300px" height="300px" class="visible content">
    <img src="./gui/i8.jpg" width="300px" height="300px" class="hidden content">
  </div>
  <div class="content">
    <a class="header" href="./nolBoard.jsp">우리들의 세상</a>
    <div class="meta">
      <span class="date">모두 리뷰를 확인해 보세요!</span>
    </div>
  </div>
</div>
        
        </div>
        
        <div class="four wide column"> </div>
        
        <div class="four wide column"> </div>
        
        
        
        
      </div>
</td>
<tr>
</table>



<!--  -->

<br>
<br>
<br>
<br>
<!-- 테이블 위 -->
<!-- 테이블 위 끝  -->

<!-- 전체 틀 -->
<table width="900px" height="1000px" align="center">
<!-- 중 헤드 -->
<tr>
<td>
<!--  조회수 업 -->

<!--  조회수 업 -->
</td>
</tr>
<!-- 중 헤드 -->

<tr>
<td>
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
    <tr id="n_1" onMouseDown="this.style.backgroundColor='#F6CED8'" onMouseUp="this.style.backgroundColor=''">
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