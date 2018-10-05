<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List, java.util.Map" %>
<%@ page import="com.google.gson.Gson" %>
<%
	System.out.println("Json º¯È¯Áß");
	List<Map<String,Object>> getQnaList = 
		(List<Map<String,Object>>)request.getAttribute("getQnaList");
	Gson gs = new Gson();
	String jsonBoard = gs.toJson(getQnaList);
	String name =  "\"data\"";
	out.print("{" + name + ":" + jsonBoard + "}");
%>
