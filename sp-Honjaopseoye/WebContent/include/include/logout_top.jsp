<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%-- <!-- var a = '<%=%>'는  null일경우 'null'인 문자열로 인식  --> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상단</title>
</head>
<body>
<div class="floating">
<div class="ui inverted vertical masthead center aligned segment">

    <div class="ui container">
      <div class="ui large secondary inverted pointing menu">
        <a class="toc item">
          <i class="sidebar icon"></i>
        </a>
        	<a class="active item" href="../../notice/notice/notice.jsp">공지사항</a>
	        <a class="item" href="../../main/honja/honja_main.jsp">혼밥하자</a>
	        <a class="item" href="../../main/together/together_main.jsp">모임하자</a>
	        <a class="item" href="/sp-Honjaopseoye/board/boardMaxHit.hon">리뷰보기</a>
        
        <div class="ui grid">
        <div class="four wide two wide large screen one wide widescreen column"></div>
        <div class="four wide two wide large screen one wide widescreen column">
        
        </div>
        <div class="four wide two wide large screen one wide widescreen column">
        
        </div>
        <div class="four wide two wide large screen one wide widescreen column"></div>
      </div>
        
        <div class="right item">
        <!-- #########################로그인 버튼 있는 로그인 폼 시작################################ --> 
      
       <div class="ui text container"> 
       	<div id="loginForm">
          <a class="ui inverted button" href="../../member/login/login.jsp">로그인</a>
          <a class="ui inverted button" href="../../member/join/gaip.jsp">회원가입</a>
        </div>
        </div>
          <!-- ########################로그인 버튼 있는 로그인 폼 끝################################# --> 
        </div>
      </div>
    </div>
			<div class="ui text container">
      <h1 class="ui inverted header">
       <br>
          <br>
        혼밥 혼술 입니당
      </h1>
      <br>
    </div>
  </div>
</div>
</body>
</html>