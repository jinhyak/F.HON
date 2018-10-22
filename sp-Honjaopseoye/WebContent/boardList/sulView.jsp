<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.HashMap, java.util.ArrayList" %>
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



   <%
   
   String no = null;
   String id = null;
   String title = null;
   String category = null;
   String hit = null;
   String date = null;
   String text = null;
   String url = null;
   
   

   	List<Map<String, Object>> conBoardOneList = (List<Map<String, Object>>)request.getAttribute("conBoardOneList");
   	
    if(conBoardOneList != null){
    	
   	no = conBoardOneList.get(0).get("SUL_NO").toString();
   	id = conBoardOneList.get(0).get("SUL_ID").toString();
   	title = conBoardOneList.get(0).get("SUL_TITLE").toString();
   	category = conBoardOneList.get(0).get("SUL_CATEGORY").toString();
   	hit = conBoardOneList.get(0).get("SUL_HIT").toString();
   	date = conBoardOneList.get(0).get("SUL_DATE").toString();
   	text = conBoardOneList.get(0).get("SUL_TEXT").toString(); 
    	
		if(conBoardOneList.get(0).get("SUL_URL").toString() != null){
			
			url = conBoardOneList.get(0).get("SUL_URL").toString();
			
		}

	}
   	
   
   %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../include/include/subtop.jsp" %>
<title>혼밥할래</title>
<style type="text/css">
p {white-space: pre-wrap;}

</style>
</head>
<body>

<br>
<br>
<br>
<br>
<br>
<br>

<!-- 전체 테이블 @@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->

<table width="1000px" height="1000px" align="center">

<!-- 게시판 머리 -->
<thead align="center">
<tr align="left">
<td>
<!-- 1번줄  -->
<table>
<tr>
<td>
<td width="100px"><p><strong>번호:</strong> <%=no %></p></td>
<td width="150px"><p><strong>카테고리:</strong> <%=category %></p></td>
<td width="450px"><p><strong>제목:</strong> <%=title %></p></td>
<td width="200px"><p><strong>날짜:</strong> <%=date %></p></td>
</tr>
</table>
<!-- 1번줄 end -->
</td>
</tr>
</thead>
<!-- 게시판 머리 end -->



<!-- 게시판 내용 -->
<tbody align="center">
<tr>
<td>

<!-- 내용  테이블 -->
<table width="1000px"  height="950px">

<!-- 내용 상단 -->
<thead align="left">
<tr>
<td><h2 class="ui dividing header"> </h2></td>
</tr>
<tr>
<td>
<!-- 2번줄 -->
<table width="1000px">
<tr>
<td align="left" width="800px"><p><strong>작성자:</strong> <%=id %></p></td>
<td align="left" width="200px"><p><strong>조회수:</strong> <%=hit %></p></td>
</tr>
</table>
<!-- 2번줄 end -->
</td>
</tr>
</thead>
<!-- 내용 상단 end -->

<!-- 내용 중단 -->
<tbody align="center">
<tr>
<td>
<pre>
<%=text %>
</pre>

</td>
</tr>

<tr>
<td>

<%
 if(url != null){
	 
	 %>
	 <div id="player"></div>
	 <%
 } else {
	 out.print("동영상 없음");
 }
%>




<script>
var v = '<%= url%>';

		
      var tag = document.createElement('script');

      tag.src = "https://www.youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);


      var player;
      function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', { // 동영상 환경 설정
          height: '360',
          width: '600',
          videoId: v,
          events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
          }
        });
      }

      function onPlayerReady(event) {
        event.target.playVideo(); // 해당 동영상 플레이 재생
      }

     var done = false;
      function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING && !done) {
        //  setTimeout(stopVideo, 6000); // 재생후 6초가 지나면 재생 멈춤
          done = true; 
        }
      }
      function stopVideo() {
        player.stopVideo();
      }
		

    </script>
    
</td>
</tr>
</tbody>
<!-- 내용 중단 end -->

<!-- 내용 하단  -->
<tfoot>
<tr>
<td align="center">

<!-- 좌표 받아오기 선택 -->
<div id="map" style="width:500px;height:400px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4c4b0f804416e7147ffbcdbd3f500a78"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
	</script>
<!-- 좌표 받아오기 선택 end -->
</td>
</tr>
</tfoot>
<!-- 내용 하단 end  -->

</table>
<!-- 내용  테이블 end -->
</tbody>
<!-- 게시판 내용 end -->



<!-- 게시판 댓글 -->

<%
	List<Map<String, Object>> conBoardCommentList = 
	(List<Map<String, Object>>)request.getAttribute("conBoardCommentList");
	
	String r_id = null;
	String r_text = null;
	String r_date = null; 
	
	// DB 카운트
%>

<tfoot align="center">
<%
	// 삭제
	String deletekey = category + "&no=" + no;
	// 업데이트
	String updatekey = category + "&no="+ no;

	if(id.equals(smem_name)){
		
%>

<tr><td align="right"><a href="../board/boardUpdateSub.hon?category=<%=updatekey %>">수정</a>&nbsp;|&nbsp;<a href="../board/boardDelete.hon?category=<%=deletekey %>">삭제</a></td></tr>

<%

	} else {
		
	}
%>

<tr>
<td align="left"><h2 class="ui dividing header">댓글</h2></td>
</tr>

<tr>
<td>
<%
	if (conBoardCommentList.size() >= 1) {

		reply: for (int i = 0; i < conBoardCommentList.size(); i++) {

			
			r_id = conBoardCommentList.get(i).get("SUL_RE_WRITER").toString();
			r_text = conBoardCommentList.get(i).get("SUL_RE_CONTENT").toString();
			r_date = conBoardCommentList.get(i).get("SUL_RE_DATE").toString();
			
			// DB 오류 있을때  네츄럴 페이지 처리
			if (r_id == null || r_text == null || r_date == null) {
				
				break reply;
			}

%>
					 <!-- 댓글 라인  DB 조회후 나와야함-->
					<table id="r_reple" width="800px" bgcolor="#E6E6E6" align="center">
						<tr>
							<td width="100px" align="left">
							<font size="2"><strong><%=r_id%></strong></font> <font size="1"><%=r_date%></font>
							</td>
						</tr>
						<tr>
							<td><p style="size: 1;"><%=r_text%></p></td>
						</tr>
						<tr>
							<td align="left"><h2 class="ui dividing header"></h2></td>
						</tr>
					</table>
					 <!-- 댓글 라인 end --> 
					 <%
 	}
			
 } else {
	 
	 %>
	 <!-- 댓글이 없으면..  -->
	 <table width="1000px" bgcolor="#E6E6E6">
						<tr>
							<td width="200px"></td>
						</tr>
						<tr>
							<td align="center"><img src="/sp-Honjaopseoye/boardList/gui/replys.gif" width="100px" height="100px">
							<pre>현재 댓글이 없습니다.</pre>
							</td>
						</tr>
						<tr>
							<td align="left"><h2 class="ui dividing header"></h2></td>
						</tr>
					</table>
	 
	 <%
	 
 }
 %>
 </td>
</tr>

<tr>
<td>

<!-- 댓글 쓰기 -->
<table align="center" width="1000px" height="200px">

<tr>
<td align="center"></td>
</tr>

<tr>
<td align="center" width="800px">
<div class="ui form">
<textarea style="width:900px; height:100px; align-content:center;" id="r_text" name="r_text"></textarea>
</div>
</td>

<td align="center" width="200px">
<button class="ui primary button" style="width:100px; height:100px;" onclick="bab_r()">
등록
</button>
</td>

</tr>
</table>
<script type="text/javascript">

function bab_r(){
	   var category = '<%=category %>';
	   var board_no = '<%=no %>';
	   var r_text = $("#r_text").val();
	   var r_id = '<%=smem_name%>';
	   
	   $.ajax({
	      method:"POST"
	      ,url:'../board/commentInsert.hon'
	      ,data:"r_text="+r_text+"&category="+category+"&board_no="+board_no+"&id="+r_id
	      ,success:function(){
	/*          alert("아작스 성공");
	         location.reload(); // 새로고침
	         var temp = JSON.stringify(result);
	         var jsonDoc = JSON.parse(temp);// array
	         for(){
	            
	         }
	         var temp="<b>ㅇㄹㄴㅇㄹ</b>";
	         $("#div_id").html(temp); */
	         
	      }
	      ,error:function(xhrObject){
	         location.reload();
	   /*       alert("error:"+xhrObject.responseText);
	         alert("실패"); */
	      }
	      
	   });
	}


</script>

<!-- 댓글 쓰기  end -->
</td>
</tr>
</tfoot>
<!-- 게시판 댓글 end -->



</table>
<!-- 전체 테이블 end @@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

<br>
<br>
<!-- 버튼 라인 -->

<br>
<br>
<br>
<br>
<br>
<br>

<%@ include file="/include/include/bottom.jsp" %>
</body>
</html>