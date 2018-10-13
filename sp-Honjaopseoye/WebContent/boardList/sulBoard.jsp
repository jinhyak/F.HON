<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>	
<%
	String smem_name = null;
		List<Map<String, Object>> memList = (List<Map<String, Object>>) session.getAttribute("memList");
	if ((List<Map<String, Object>>)memList != null) {
		smem_name = memList.get(0).get("MEM_NAME").toString();
	}
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../include/include/subtop.jsp" %>
<title>혼술 게시판</title>
</head>
<style>
body {

}
</style>

<body>


<form id="key"></form>

<br>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#bab_go").click(function() {
		location.href="./babBoard.jsp";
	});
	
	$("#nol_go").click(function() {
		location.href="./nolBoard.jsp";
	});
	
	$("#main_go").click(function() {
		location.href="./mainBoardList.jsp";
	});
	
	$("#g_insert").click(function(){
		location.href="./write.jsp";
	});
	
	// 리스트 이벤트

	$('#dt_reserv_list').dataTable({
	      //url:'../../member/empty/getReservList.test',
	      "ajax":{ "url":"../board/boardList.hon?key=혼술", "type":"POST" },
	       "columns":[
	    	    {"data":'SUL_NO',"className":'dt-body-center'},
				{"data":'SUL_ID',"className":'dt-body-center'},
				{"data":'SUL_TITLE',"className":'dt-body-center'},
				{"data":'SUL_CATEGORY',"className":'dt-body-center'},
				{"data":'SUL_HIT',"className":'dt-body-center'},
				{"data":'SUL_DATE',"className":'dt-body-center'}
	             ],
	      "language": {     
	          "sEmptyTable":     "데이터가 없습니다",
	            "sInfo":           "_START_ - _END_ / _TOTAL_",
	            "sInfoEmpty":      "0 - 0 / 0",
	            "sInfoFiltered":   "(총 _MAX_ 개)",
	            "sInfoPostFix":    "",
	            "sInfoThousands":  ",",
	            "sLengthMenu":     "페이지당 줄수 _MENU_",
	            "sLoadingRecords": "읽는중...",
	            "sProcessing":     "처리중...",
	            "sSearch":         "검색:",
	            "sZeroRecords":    "검색 결과가 없습니다",
	            "oPaginate": {
	                "sFirst":    "처음",
	                "sLast":     "마지막",
	                "sNext":     "다음",
	                "sPrevious": "이전"
	            },
	            "oAria": {
	                "sSortAscending":  ": 오름차순 정렬",
	                "sSortDescending": ": 내림차순 정렬"
	            }
	      }   
	   });

	//ㅇ
	    var table = $('#dt_reserv_list').DataTable(); // 테이블
	    $('#dt_reserv_tbody').on('click', 'tr', function (e, dt, type, indexes) { // 티바디를 누르면..
	       var data = table.row(this).data();
	       var SUL_NO = data.SUL_NO;
	       location.href='../board/boardOne.hon?key=혼술'+"&num="+ SUL_NO;
	    });
	

})

</script>
<br>
<br>
<br>
<br>
<!-- 전체 테이블 -->
<table bgcolor="white" align="center">
<thead>
</thead>
<tbody align="center">
<tr>
<td align="center">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<div class="ui header" style="margin-left: 0px;margin-right: 0px; margin-top: 100px;margin-bottom: 100px">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ index @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<!-- 상위 버튼 -->
<table>
<tr>
<td align="center">

<!-- 조회수 -->

<table width="890px" height="230px" align="center">
<!-- 조회수 헤드  -->
<thead>

<tr>
<td align="center" colspan="5" height="100px"><font size="5" color="black"><strong>월간 최고 조회수 리뷰 >.< 임당 </strong></font></td>
</tr>

</thead>
<!-- 조회수 헤드  끝 -->
<tr height="180px">
<td align="center"><img src="../image/1.jpg" width="255px" height="200px"></td>
<td align="center"><img src="../image/2.jpg" width="255px" height="200px"></td>
<td align="center"><img src="../image/3.jpg" width="255px" height="200px"></td>
<td align="center"><img src="../image/4.jpg" width="255px" height="200px"></td>
</tr>
<!-- 버튼 이벤트 라인  -->
<tr>
<td id="best_1" align="center" width="200px">
<pre><font size="2" color="black"><strong>가산동 돈까스 맛집!! 리뷰</strong></font>

조회수: 5250192</pre>
</td>

<td align="center" width="200px">
<pre><font size="2" color="black"><strong>치맥은 역시 강남! 치밥 치맥집</strong></font>

조회수: 4432134</pre>
</td>

<td align="center" width="200px">
<pre><font size="2" color="black"><strong>혼밥 추천합니다!!</strong></font>

조회수: 3387123</pre>
</td>

<td align="center" width="200px">
<pre><font size="2" color="black"><strong>E마트 푸드코트 추천!</strong></font>

조회수: 194720</pre>
</td>

<td align="center" width="200px">
<pre><font size="2" color="black"><strong>삼겹살 짱</strong></font>

조회수: 14720</pre>
</td>

<!-- 버튼 이벤트 라인 끝 -->
</tr>

</table>


<!-- 조회수 끝 -->

</table>
   <table width="1300px" height="50px">
   
<tr>
<td align="center" height="100px">공백</td>
</tr>

<tr>
<td align="left">
<button class="positive ui button" id="bab_go">혼밥하기</button>
<button class="positive ui button" id="nol_go">혼놀하기</button>
<button class="positive ui button" id="main_go">메인가기</button>
</td>
</tr>

</table>
            <div id="reserv_list" class="ui bottom attached segment">
               <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 말머리 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
               <table id="dt_reserv_list" class="ui center aligned stackable selectable display datatable">
                 <thead>
                   <tr>
                      <th style="width:100px;">글 번호</th>
                      <th style="width:100px;">제목</th>
                      <th style="width:300px;">분류</th>
                      <th style="width:200px;">작성자</th>
                      <th style="width:500px;">조회수</th>
                      <th style="width:100px;">날짜</th>
                    </tr>
                 </thead>
                    <tbody id="dt_reserv_tbody"></tbody>
               </table>
            </div>
         </div>
</td>
</tr>
</tbody>
<tr>
<td width="600px" height="60px" align="right">
	<button class="ui primary button" id="g_insert" name="g_insert"> 
  글 쓰기
</button>
</td>
</tr>
</table>
<script type="text/javascript">
$(".menu").find('a').click(function() {
   $(".menu").find('a').attr('class','item');//active 초기화
   $(this).attr('class','item active');//누른메뉴 active로 변경
   if($(this).attr('id')=='m_reservation'){
      location.href="./sView.jsp";
   }
   else if($(this).attr('id')=='m_reserv_list'){
      $("#reserv_list").show();
   }
   else if($(this).attr('id')=='m_reserv_history'){
      $("#reservation").hide();
      $("#reserv_list").hide();
   }
});
</script>

<br>
<br>
<br>
<br>
<br>


<%@ include file="/include/include/bottom.jsp" %>
</body>
</html>