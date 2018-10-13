<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../../include/include/subtop.jsp" %>
</head>
<body>
<script type="text/javascript">
$(document).ready(function() {
	$("#insert_go").click(function(){
		location.href="./qnaInsert.jsp";
	});
	$.fn.dataTable.ext.errMode = '';
    $('#dt_reserv_list').dataTable({
      "ajax":{ "url":"../../menu/qSelect.hon", "type":"POST",error:function(){alert('실패')} },
       columns:[
			{"data":'QNA_NO'},
			{"data":'QNA_TITLE'},
			{"data":'QNA_CATEGORY'},
			{"data":'QNA_WRITER'},
			{"data":'QNA_DATE'},
			{"data":'QNA_HIT'}
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
    var table = $('#dt_reserv_list').DataTable(); // 테이블
    $('#dt_reserv_tbody').on('click', 'tr', function (e, dt, type, indexes) { // 티바디를 누르면..
       var data = table.row(this).data();
       var QNA_NO = data.QNA_NO;
       location.href='../../menu/qView.hon?qna_no='+QNA_NO;
    });
});
</script>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<div class="ui header" style="margin-left:150px;margin-right:150px; margin-top:100px;margin-bottom:100px">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ index @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
	<div class="ui two attached stackable column grid" style="width:100%">
		<div class="center aligned column"style="width:20%;">
			<div class="ui field" style="height:800px">
				<div class="ui segment">
					<div class="ui one column grid">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 말머리 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						<div class="center aligned column">
						</div>
						<div class="center aligned column">
						</div>
						<div class="center aligned column">
							<div class="ui large header">
							 	<img src="/sp-Honjaopseoye/image/logo.png" style="width:100%;heigth:100%">
							</div>
						</div>
						<div class="right aligned column">
						</div>
						<div class="right aligned column">
						</div>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 목록 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%" onclick="location.href='../notice/notice.jsp'">
								<h3> 공지사항 </h3>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%;background-color:gray">
								<h3> QnA </h3>
							</div>
						</div>
					</div>	
				</div>
			</div>
		</div>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ contents @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<div class="column"style="width:80%;">
			<div class="ui field">
				<div class="ui segment">
					<div class="ui center aligned one column grid">
						<div class="center aligned column">
							<div class="ui segment">
								<div class="ui large header">
							 	         QNA
								</div>
							</div>
						</div>
						<div class="center aligned column">
							<div class="ui segment" style="width:100%;">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 여기만 바뀌면 됨 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
            <div id="reserv_list" class="ui bottom attached segment">
               <table id="dt_reserv_list" class="ui celled table">
                 <thead>
                    <tr>
                      <th style="width:100px;">번호</th>
                      <th style="width:100px;">제목</th>
                      <th style="width:300px;">분류</th>
                      <th style="width:200px;">작성자</th>
                      <th style="width:500px;">등록일</th>
                      <th style="width:100px;">조회수</th>
                    </tr>
                 </thead>
                    <tbody id="dt_reserv_tbody"></tbody>
               </table>
            </div>
               <div style="width:100%;" align="right">
              	 <button class="ui large button" id="insert_go">
  					문의하기
				 </button>
               </div>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 여기만 바뀌면 됨 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
							</div>
						</div>
					</div>	
				</div>
			</div>
		</div>
	</div>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
</div>
<%@ include file="../../include/include/bottom.jsp" %>
<script type="text/javascript">
$(".menu").find('a').click(function() {
   $(".menu").find('a').attr('class','item');//active 초기화
   $(this).attr('class','item active');//누른메뉴 active로 변경
   if($(this).attr('id')=='m_reservation'){
      /* location.href="./s
      View.jsp"; */
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

</body>
</html>