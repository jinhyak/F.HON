<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList, java.util.HashMap" %>
    
    
<%


String qna_no = null;
String qna_title = null;
String qna_category = null;
String qna_writer = null;
String qna_hit = null;
String qna_date = null;
String qna_content = null;

	List<Map<String, Object>> getQnaOne = (List<Map<String, Object>>)request.getAttribute("getQnaOne");
	
 	qna_no = getQnaOne.get(0).get("QNA_NO").toString();
	qna_title = getQnaOne.get(0).get("QNA_TITLE").toString();
	qna_category = getQnaOne.get(0).get("QNA_CATEGORY").toString();
	qna_writer = getQnaOne.get(0).get("QNA_CATEGORY").toString();
	qna_hit = getQnaOne.get(0).get("QNA_HIT").toString();
	qna_date = getQnaOne.get(0).get("QNA_DATE").toString();
	qna_content = getQnaOne.get(0).get("QNA_CONTENT").toString(); 
	
	/* System.out.println(getQnaOne.get(0));
	
	
	List<Map<String, Object>> maplist = new ArrayList<Map<String, Object>>();
	
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("qna_no", qna_no);
	map.put("qna_title", qna_title);
	map.put("qna_category", qna_category);
	map.put("qna_writer", qna_writer);
	map.put("qna_hit", qna_hit);
	map.put("qna_date", qna_date);
	map.put("qna_content", qna_content);
	
	maplist.add(0, map);
	
	maplist.get(0); */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>qna</title>
</head>
<body>
<!-- 상단 끝 -->

<br>
<br>
<div align="center">
<img src="./images/logo.png" width="800px" height="200px">
</div>
<br>
<br>
<br>

<!-- 게시글 확인  -->
<table align="center" width="1000px" height="1000px" bgcolor="white">


<!-- 제목, 아이디, 글번호, 카테고리, 날짜,  -->
<thead align="center" style="width:1000px; height:100px;">

<tr>
<td>

<!-- 상단 테이블  -->
<table background="./images/title.jpg" align="center" width="1000px" height="100px">

<!-- 상위 -->
<tr>
<td align="left" rowspan="2"><p><font color="gray">No.<%= qna_no%></font></p></td>
<td align="center" rowspan="2"><p><font color="gray"> <%=qna_category%></font></p></td>
<td align="center" colspan="2" rowspan="2" width="600px" height="80px"><font size="6" color="gray"><%= qna_title%> </font></td>
<td align="center" colspan="3"><font color="gray">작성일:<%= qna_date%></font></td>
</tr>
<tr>
<td align="center" colspan="3"><font color="gray">작성자 :<%= qna_writer%> </font></td>
</tr>

<!-- 부가 -->
</table>

</td>

<tr>
<td><h2 class="ui dividing header"></h2></td>
</tr>

</thead>
<!-- 제목, 아이디, 글번호, 카테고리, 날짜 끝 -->

<!-- 작성 내용 -->
<tbody align="center" style="width:1000px; height:700px;">

<tr>
<!-- 상단부터 순서대로....  -->
<td>
<pre>
<%= qna_content%>
</pre>
</td>

</tr>

<tr>
<td align="right" style="width:1000px; height:100px;">

<!-- 목록 -->
<button class="ui primary button" id="list_sel">
  목록보기
</button>
<!-- 목록 -->
</td>
</tr>

</tbody>
<!-- 작성 내용 끝 -->


<!-- 댓글  -->
<tfoot align="center" style="width:1000px; height:200px;">

<tr>
<td align="center">

<table align="center">
<tr height="100px">
<td><h2 class="ui dividing header">답변 쓰기</h2></td>
</tr>
<tr>
<tr height="100px">
<td>
<h2>
<!-- 댓글 공간 -->
<table align="center" width="900px" height="100px">
<tr>
<td>댓글 보는곳</td>
</tr>
</table>
<!-- 댓글 공간 끝 -->
</h2>
</td>
</tr>
<tr>
<td align="center">
<textarea style="width:855px; height:85px; align-content:center;"></textarea>
</td>
<td align="center">
&nbsp;&nbsp;&nbsp;&nbsp;
<button class="positive ui button" id="bab_reply" name="bab_reply" style="width:100px;">밥변</button>
</td>
</tr>
</table>

</td>
</tr>

</tfoot>
<!-- 댓글  -->

</table>
<!-- 게시글 확인 끝 -->

<br>
<br>
<br>
<br>
<br>

</body>