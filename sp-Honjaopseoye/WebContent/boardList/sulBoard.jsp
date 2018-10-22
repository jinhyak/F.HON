<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>	
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
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../include/include/subtop.jsp" %>
<title>혼술 게시판</title>
</head>
<style>
	#topbg{ background: url("/sp-Honjaopseoye/image/gui/topbg.jpg")}
</style>
<body>

	<div id="topbg" class="ui inverted vertical masthead center aligned segment" style="margin-top: 50px; height: 450px;">
	    <div class="ui text container"style="margin-top: 160px;">
	      <h1 class="ui inverted header">
	       <font size="10">혼술 리뷰 게시판</font>
	      </h1>
	      <br>
	      <br>
	      <h2>혼술 리뷰를 확인해 보세요</h2>
	    </div>
	  </div>
<form id="key"></form>

<br>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#g_insert").click(function(){
		location.href="./write.jsp";
	});
	
	// 리스트 이벤트

	$('#dt_reserv_list').dataTable({
	      //url:'../../member/empty/getReservList.test',
	      "ajax":{ "url":"../board/boardList.hon?category=혼술", "type":"POST" },
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
	       location.href='../board/boardOne.hon?category=혼술'+"&no="+ SUL_NO;
	    });
	

})

</script>



<div class="ui container"
		style="margin-left: 200px; margin-right: 200px;">
		<h2 class="ui header" style="margin-top: 50px;">
			<img src="../image/logo.png" style="width: 170px; height: 60px;" onClick="mainlist()">
			<div class="content">
				혼술 리뷰
				<div class="sub header" style="padding-top: 10px;">네티즌들의 추천 ! 그
					이상을 누릴 수 있는 홀술 리뷰 게시판</div>
			</div>
		</h2>
</div>	
<script type="text/javascript">

function mainlist() {
	
	location.href="/sp-Honjaopseoye/board/boardMaxHit.hon";
	
}

</script>


<!-- 전체 테이블 -->
<table bgcolor="white" align="center">
<thead>
</thead>
<tbody align="center">
<tr>
<td align="center">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<div class="ui header" style="margin-left: 0px;margin-right: 0px; margin-top: 0px;margin-bottom: 100px">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ index @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<!-- 상위 버튼 -->
<table>
<tr>
<td align="center">

<!-- 조회수 -->

<div class="ui container"
			style="margin-left: 200px; margin-right: 200px;margin-top:50px;">
			<div class="ui grid" align="center" style="text-align: center">
				<div class="four wide column">

					<div class="ui card">
						<div class="ui slide masked reveal image"
							style="width: 350px; height: 150px;">
							<img src="/sp-Honjaopseoye/image/gui/i1.jpg" width="300px" height="300px"
								class="visible content"> <img src="/sp-Honjaopseoye/image/gui/i2.jpg"
								width="300px" height="300px" class="hidden content">
						</div>
						<div class="content">
							<a class="header" href="/sp-Honjaopseoye/boardList/babBoard.jsp">평범한 일상</a>
							<div class="meta">
								<span class="date"><font size="2">혼밥 리뷰를 확인해 보세요!</font></span>
							</div>
						</div>
					</div>

				</div>
				<div class="four wide column">

					<div class="ui card">
						<div class="ui slide masked reveal image"
							style="width: 350px; height: 150px;">
							<img src="/sp-Honjaopseoye/image/gui/i3.jpg" width="300px" height="300px"
								class="visible content"> <img src="/sp-Honjaopseoye/image/gui/i4.jpg"
								width="300px" height="300px" class="hidden content">
						</div>
						<div class="content">
							<a class="header" href="/sp-Honjaopseoye/boardList/sulBoard.jsp">감성을 자극하는 밤</a>
							<div class="meta">
								<span class="date"><font size="2">혼술 리뷰를 확인해 보세요!</font></span>
							</div>
						</div>
					</div>
				</div>
				<div class="four wide column">


					<div class="ui card">
						<div class="ui slide masked reveal image"
							style="width: 350px; height: 150px;">
							<img src="/sp-Honjaopseoye/image/gui/i5.jpg" width="300px" height="300px"
								class="visible content"> <img src="/sp-Honjaopseoye/image/gui/i6.jpg"
								width="300px" height="300px" class="hidden content">
						</div>
						<div class="content">
							<a class="header" href="/sp-Honjaopseoye/boardList/nolBoard.jsp">혼자만의 여가 생활</a>
							<div class="meta">
								<span class="date"><font size="2">혼놀 리뷰를 확인해 보세요!</font></span>
							</div>
						</div>
					</div>


				</div>
				<div class="four wide column">

					<div class="ui card">
						<div class="ui slide masked reveal image"
							style="width: 350px; height: 150px;">
							<img src="/sp-Honjaopseoye/image/gui/i7.jpg" width="300px" height="300px"
								class="visible content"> <img src="/sp-Honjaopseoye/image/gui/i8.jpg"
								width="300px" height="300px" class="hidden content">
						</div>
						<div class="content">
							<a class="header" href="/sp-Honjaopseoye/main/together/together_main.jsp">우리들은 하나</a>
							<div class="meta">
								<span class="date"><font size="2">혼족들이 모여 소통할 수 있는 공간</font></span>
							</div>
						</div>
					</div>

				</div>

				<div class="four wide column" style="padding-top: 5px;">
					<div class="content" style="text-align: left">
						<strong>검증된 혼족들의 맛있는 리뷰</strong> 
						<p></p>
						<div class="meta" style="text-align: left;">
							<font size="2">혼밥이 일상이된 시대 지금
							당신은 혼밥을 즐겨 하시나요?</font>
						</div>
					</div>
				</div>
				<div class="four wide column" style="padding-top: 5px;">
					<div class="content" style="text-align: left">
						<strong>분위기 작살 오늘의 감성 리뷰</strong> 
						<p></p>
						<div class="meta" style="text-align: left;">
							<font size="2">감성을 자극하는 밤!!
							오늘 혼술 한잔 어떠신가요?</font>
						</div>
					</div>
				</div>
				<div class="four wide column" style="padding-top: 5px;">
					<div class="content" style="text-align: left">
						<strong>내가 바로 혼자 놀기의 달인</strong> 
						<p></p>
						<div class="meta" style="text-align: left;">
							<font size="2">심심하신가요? 혼자 놀기의 달인들이
							알려주는 재밌는 꿀팁!!</font>
						</div>
					</div>
				</div>
				<div class="four wide column" style="padding-top: 5px;">
					<div class="content" style="text-align: left">
						<strong>혼자가 지겨운 그들의 이야기</strong> 
						<p></p>
						<div class="meta" style="text-align: left;">
							<font size="2">혼자하는 생활이 많이 외롭죠?
							이젠 같이 즐기세요~</font>
						</div>
					</div>
				</div>
			</div>
</div>

<!-- 조회수 끝 -->

</table>
   <table width="1300px" height="50px">
   
<tr>
<td align="center" height="100px"></td>
</tr>

<tr>
<td align="left">
</td>
</tr>

</table>
            <div id="reserv_list" class="ui bottom attached segment">
               <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 말머리 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
               <table id="dt_reserv_list" class="ui center aligned stackable selectable display datatable">
                 <thead>
                   <tr>
           			  <th style="width:100px;">글 번호</th>
                      <th style="width:100px;">작성자</th>
                      <th style="width:500px;">제목</th>
                      <th style="width:200px;">카테고리</th>
                      <th style="width:300px;">조회수</th>
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

<%

	if(smem_name != null){
		

%>
<button class="ui primary button" id="g_insert" name="g_insert"> 
  글 쓰기
</button>

<%
	} else {
		out.print("비회원은 쓰기 권한이 없습니다.");
	}
%>

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