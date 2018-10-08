<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.HashMap, java.util.ArrayList" %>

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
   	
   	no = conBoardOneList.get(0).get("NOL_NO").toString();
   	id = conBoardOneList.get(0).get("NOL_ID").toString();
   	title = conBoardOneList.get(0).get("NOL_TITLE").toString();
   	category = conBoardOneList.get(0).get("NOL_CATEGORY").toString();
   	hit = conBoardOneList.get(0).get("NOL_HIT").toString();
   	date = conBoardOneList.get(0).get("NOL_DATE").toString();
   	text = conBoardOneList.get(0).get("NOL_TEXT").toString(); 
   	url = conBoardOneList.get(0).get("NOL_URL").toString(); 
   
   %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="../Semantic/semantic.css" />
<script src="../Semantic/js/jquery-1.12.0.js"></script>
<script src="../Semantic/semantic.js"></script>
<title>글보기</title>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#list_sel").click(function(){
		location.href="./mainBoardList.jsp";
	});
	
})


</script>
</head>
<body>
<!-- 상단 끝놀게시판 -->

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
<td align="left" rowspan="2"><p><font color="gray">No. <%= no%></font></p></td>
<td align="center" rowspan="2"><p><font color="gray"><%=category%></font></p></td>
<td align="center" colspan="2" rowspan="2" width="600px" height="80px"><font size="6" color="gray"><%= title%></font></td>
<td align="center" colspan="3"><font color="gray">작성일: <%= date%></font></td>
</tr>
<tr>
<td align="center" colspan="3"><font color="gray">작성자 : <%= id%></font></td>
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
<%= text%>
</pre>
</td>

</tr>
<!-- 동영상 라인  -->
<tr>
<td>
<div id="player"></div>

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
<!-- 동영상 라인  끝 -->

<!--  지도  -->
<tr>
<td>
<br>
<br>

<br>
<!-- 지도 보이는 라인 -->
<div id="map" style="width:500px;height:400px;"></div>
<!-- 지도 보이는 라인 끝 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4c4b0f804416e7147ffbcdbd3f500a78"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
	</script>
</td>
</tr>

<!-- 지도 -->
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
<td><h2 class="ui dividing header">댓글 쓰기</h2></td>
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
<button class="positive ui button" id="bab_reply" name="bab_reply" style="width:100px;">댓글쓰기</button>
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
</html>