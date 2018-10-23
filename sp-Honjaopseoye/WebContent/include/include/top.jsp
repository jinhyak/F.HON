<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	  	String smem_name = null;
		List<Map<String, Object>> memList2 = (List<Map<String, Object>>) session.getAttribute("memList");
	if (session.getAttribute("memList") != null) {
		smem_name = memList2.get(0).get("MEM_NAME").toString();
	} else if(smem_name == null){
		smem_name = "비회원";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상단</title>
<%@include file="./commonUI.jsp"%>
<style type="text/css">
#top_imgs {
	background: url("/sp-Honjaopseoye/image/bg/eating.png")
}

#guel {
	position: relative;
	top: 25%;
	background-color: rgba(0, 0, 0, 0.8);
	padding-left: 10px;
	text-shadow: 2px 1px 0px #6E6E6E;
}

#menus {
	font-weight: bold;
}

#mungu {
	font-size: 40px;
	font-family: "arial", san-serif;
	font-weight: bold;
}

h1 {
	padding-bottom: 0px;
}
</style>
</head>
<body>


	<div class="floating">
		<div class="ui inverted vertical masthead center aligned segment" id="top_imgs" style="width: 100%; height: 700px; padding: 0px; position-top: fixed">


			<div class="ui large secondary inverted menu" style="background-color: black; margin-top: 0px; background-color: rgba(0, 0, 0, 0.8);">
				<div class="ui container" style="font-weight: bold">
					<div style="float: left"></div>
					<a class="toc item"> <i class="sidebar icon"></i></a> 
					<a class="active item" href="../../notice/notice/notice.jsp" id="menus">공지사항</a> 
					<a class="item" href="../../main/honja/honja_main.jsp" id="menus">혼자하자</a> 
					<a class="item" href="../../main/together/together_main.jsp" id="menus">같이하자</a> 
					<a class="item" href="/sp-Honjaopseoye/board/boardMaxHit.hon" id="menus">리뷰보기</a>
					<div class="right item">
						<!-- #########################로그인 버튼 있는 로그인 폼 시작################################ -->
						<div id="loginForm" style="font-weight: bold">
							<%=smem_name%>님 환영합니다.
							 <a class="ui inverted button" href="../../member/login/logout.jsp">로그아웃</a>
							 <a class="ui inverted button" href="../../member/meminfo/meminfo.jsp">정보수정</a>
							<!-- ########################로그인 버튼 있는 로그인 폼 끝################################# -->
						</div>
					</div>
				</div>
			</div>

			<div class="ui text container" id="guel" style="float: right; margin-right: 100px; border: 8px solid white; box-shadow: 1px 1px 0px 1px #999;">
				<!-- <div style="border:solid 1.5px white; border-right:0px; float:left;" > -->
				<h1 class="ui inverted header" id="mungu" style="float: left; text-align: left; padding-top: 5px;">
					당신의 라이프 스타일을 <br> <span style="text-align: left;"><h1 id="mungu">찾아보세요.</h1></span> 당신의 취향을 <span><h1 id="mungu">다른사람들과 공유해보세요.</h1></span>
				</h1>
			</div>



		</div>
	</div>
	</body>
</html>