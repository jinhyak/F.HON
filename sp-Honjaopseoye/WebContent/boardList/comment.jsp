<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.Map, java.util.List, java.util.HashMap" %>
<%
	List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
	Map<String, Object> rMap = new HashMap<String, Object>();
	rMap.put("id", "봉");
	rMap.put("text", "단 한번의 사랑에도");
	list.add(rMap);
	
	rMap = new HashMap<String, Object>();
	rMap.put("id", "오서방");
	
	rMap.put("text", "이것 들이?!");
	list.add(rMap);
	
	rMap = new HashMap<String, Object>();
	rMap.put("id", "한예슬");
	rMap.put("text", "짜증나 짜증나!");
	list.add(rMap);
	
	rMap = new HashMap<String, Object>();
	rMap.put("id", "장근석");
	rMap.put("text", "나 멋잇는 의대생이자놔~");
	list.add(rMap); 
	
	String id = null;
	String text = null;
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글</title>
</head>
<body>
<table align="center" border="1" width="800px" height="100px">

<tr>
<td>
<!-- 댓글라인 -->
<!-- 댓글1 -->
<%

for(int i = 0; i < list.size(); i++){
	
	id = list.get(i).get("id").toString();
	text = list.get(i).get("text").toString();
	
	
%>
<table width="800px" height="8px" bgcolor="green">
<tr>
<td style="color: blue"><%=id %></td>
</tr>
<tr>
<td><pre><%=text %></pre></td>
</tr>
</table>
<%

}
%>
<!-- 댓글라인 끝 -->

</td>
</tr>

</table>
</body>
</html>