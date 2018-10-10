<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String s_name = null;
		List<Map<String, Object>> memList2 = (List<Map<String, Object>>) session.getAttribute("memList");
	if (session.getAttribute("memList") != null) {
		s_name = memList2.get(0).get("MEM_NAME").toString();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상단</title>
<%@ include file="../../include/include/commonUI.jsp" %>
<%@include file="./commonUI.jsp" %>
<script>
        jQuery(document).ready(function($) {
            $('.counter').counterUp({
                delay: 10,
                time: 1000
            });
        });
    </script>
<style>
</style>
</head>
<body>
<script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
<script src="../../Semantic/jquery.counterup.min.js"></script>
<div class="ui inverted vertical masthead center aligned segment" style="position-top: fixed">
    <div class="ui container">
      <div class="ui large secondary inverted pointing menu">
        <a class="toc item">
          <i class="sidebar icon"></i>
        </a>
	        <a class="active item" href="../../notice/notice/notice.jsp">공지사항</a>
	        <a class="item" href="../../notice/qna/qna.jsp">Q&A</a>
	        <a class="item" href="../../main/honja/honja_main.jsp">혼밥하자</a>
	        <a class="item" href="../../main/together/together.jsp">인사하자</a>
	        <div class="ui grid">
	        <div class="four wide two wide large screen one wide widescreen column"></div>
	        <div class="four wide two wide large screen one wide widescreen column">
        </div>
	        <div class="four wide two wide large screen one wide widescreen column">
	        </div>
        <div class="four wide two wide large screen one wide widescreen column"></div>
       </div>
        <div class="right item">
       <!-- 나중에 컨테이너 처리 할거임 -->
       		<div class="ui text container"> 
       	  <%=s_name%>님 환영합니다.
          <a class="ui inverted button" href="../../member/login/logout.jsp">로그아웃</a>
          <a class="ui inverted button" href="../../member/meminfo/meminfo.jsp">정보수정</a>
        	</div>
        </div>
      </div>
    </div>
    <div class="ui text container">
        <!-- 숫자 카운팅 -->
<h2 class="ui icon header" style="magin-right:100px;">
  <i class="circular users icon"></i>
  <div class="content">
    <div class="sub header">글자를 넣어보자</div>
  <span class="counter">1,234,567</span><span>명</span>
  </div>
</h2>
	        <h2 class="ui icon header" style="magin-left:100px;">
  <i class="settings icon"></i>
  <div class="content">
    <div class="sub header">글자를 넣어보자</div>
  <span>$</span><span class="counter">1.99</span>
  </div>
</h2>
	        <h2 class="ui icon header">
  <i class="plug icon"></i>
  <div class="content">
    <div class="sub header">글자를 넣어보자</div>
  	<span class="counter">12345</span>
  </div>
</h2>
    </div>
</div>
</body>
</html>