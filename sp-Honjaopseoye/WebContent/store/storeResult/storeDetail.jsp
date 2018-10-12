<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("storeDetail호출성공");
	List<Map<String,Object>> list
		= (List<Map<String,Object>>)request.getAttribute("list");
	System.out.println("listSize="+list.size());
	
	String tel 			= null;
	String addr 		= null;
	String name 		= null;
	String business	= null;
	String introduce	= null;
	int score			= 0;
	int hit				= 0;
	String img			= null;
	String homepage		= null;
	String price		= null;
	for(int i=0;i<list.size();i++){
		tel = list.get(i).get("STORE_TEL").toString();
		addr = list.get(i).get("STORE_ADDR").toString();
		name = list.get(i).get("STORE_NAME").toString();
		business = list.get(i).get("STORE_BUSINESS").toString();
		introduce = list.get(i).get("STORE_INTRODUCE").toString();
		score = Integer.parseInt((list.get(i).get("STORE_SCORE").toString()));
		hit = Integer.parseInt((list.get(i).get("STORE_HIT").toString()));
		img = list.get(i).get("STORE_IMG").toString();
		homepage = list.get(i).get("STORE_HOMEPAGE").toString();
		price = list.get(i).get("STORE_PRICE").toString();
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=name%></title>
</head>
<body>
<%=tel %><br>
<%=addr %><br>
<%=name %><br>
<%=business %><br>
<%=introduce %><br>
<%=score %><br>
<%=hit %><br>
<%=img %><br>
<%=homepage %><br>
<%=price %><br>



</body>
</html>