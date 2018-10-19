<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String bang_no = request.getParameter("bang_no");
	String store_no = request.getParameter("store_no");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약조회</title>
<%@ include file="../../include/include/subtop.jsp" %>

</head>
<script type="text/javascript">
$(document).ready(function() {
	//alert(mem_id);
	$.fn.dataTable.ext.errMode = '';
    $('#dt_reserv_list').dataTable({
		//url:'../../member/empty/getReservList.test',
		"ajax":{ "url":"../../reservation/sel_history.hon?mem_id=<%=mem_id%>", "type":"POST" },
    	"order": [[ 0, "desc" ]],
	    columns:[
			        {"data":'RESERV_NO', "className": 'dt-body-center'},
			        {"data":'BANG_NO', "className": 'dt-body-center'},
			        {"data":'BANG_NAME', "className": 'dt-body-center'},
			        {"data":'STORE_NAME', "className": 'dt-body-center'},
			        {"data":'STORE_ADDR', "className": 'dt-body-left'},
			        {"data":'STORE_TEL', "className": 'dt-body-center'},
			        {"data":'RESERV_PEOPLE', "className": 'dt-body-center'},
			        {"data":'RESERV_DATE', "className": 'dt-body-center'},
			        {"data":'RESERV_TIME', "className": 'dt-body-center'}
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
    var table = $('#dt_reserv_list').DataTable();
    $('#dt_reserv_tbody').on('click', 'tr', function (e, dt, type, indexes) {
	    var data = table.row(this).data();
        //alert('1개 행이 선택됨, Row index : '+table.row(this).index());
        //alert(data.RESERV_NO+', '+data.BANG_NO+', '+data.BANG_NAME+', '+data.STORE_NAME);
    });
});
</script>
<body>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<div class="ui header" style="margin-left: 150px;margin-right: 150px; margin-top: 100px;margin-bottom: 100px">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ index @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
	<div class="ui field">
		<div class="ui stackable column grid">
			<div class="ui column">
				<div class="ui blue three item inverted top attached tabular menu">
				  <a id="m_reservation" class="item">
				  	예약하기
				  </a>
				  <a id="m_reserv_list" class="item">
				  	예약조회
				  </a>
				  <a id="m_reserv_history" class="item active">
				  	예약내역
				  </a>
				</div>
				<div id="reserv_list" class="ui blue bottom attached segment">
					<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 말머리 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
					<table id="dt_reserv_list" class="ui center aligned stackable selectable display datatable">
					  <thead>
					    <tr>
						    <th style="width:100px;">예약번호</th>
						    <th style="width:100px;">그룹번호</th>
						    <th style="width:300px;">방제목</th>
						    <th style="width:200px;">가게이름</th>
						    <th style="width:500px;">가게주소</th>
						    <th style="width:100px;">전화번호</th>
						    <th style="width:100px;">예약인원</th>
						    <th style="width:100px;">예약날짜</th>
						    <th style="width:100px;">예약시간</th>
					  	</tr>
					  </thead>
					  	<tbody id="dt_reserv_tbody"></tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(".menu").find('a').click(function() {
	$(".menu").find('a').attr('class','item');//active 초기화
	$(this).attr('class','item active');//누른메뉴 active로 변경
	if($(this).attr('id')=='m_reservation'){
		location.href="./sView.jsp";
	}
	else if($(this).attr('id')=='m_reserv_list'){
		location.href="./reserv.jsp";
	}
	else if($(this).attr('id')=='m_reserv_history'){
		$("#reserv_history").show();
	}
});
</script>

<%@ include file="../../include/include/bottom.jsp"%>
</body>
</html>