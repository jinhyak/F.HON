<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../../include/include/subtop.jsp"/>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<div class="ui header" style="margin-left: 150px;margin-right: 150px; margin-top: 100px;margin-bottom: 100px">
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
							<div class="ui segment button" style="width:100%; background-color:gray" onclick="location.href='../notice/notice.jsp'">
								<h3> 공지사항 </h3>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%;" onclick="location.href='../qna/qna.jsp'">
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
							 	         공지사항
								</div>
							</div>
						</div>
						<div class="center aligned column">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 여기만 바뀌면 됨 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<div class="ui segment" style="width:100%;">
		<div id="c_notify" class="ui segment display" style="padding-bottom:5px;">
		<!---------------------------------------------------------- 공지사항 본문 내용 시작--------------------------------------------------------------- -->
		<div>
			<!-- ---------------============================= start of table ===================================------------------------------- -->
			<table class="ui celled table" id="notice">
				<thead>
					<tr>
						<th id="noti_no">번호</th>
						<th id="noti_category">분류</th>
						<th id="noti_title">제목</th>
						<th id="noti_writer">작성자</th>
						<th id="noti_date">등록일</th>
						<th id="noti_hit">조회수</th>
					</tr>
				</thead>
			</table>
			<!------------------------------------------------------- end of table------------------------------------------------------------------------- -->
		</div>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 여기만 바뀌면 됨  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
</div>
		<!-- 글쓰기 버튼 -->
		<div id="btn_write" style="text-align: right;"><button class="ui gray button" onClick="btn_write()">글쓰기</button></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
</div>
<script type="text/javascript">
 $(document).ready(function(){
    $('#notice').DataTable( {
    	   "ajax": {
    	       "url" : "/sp-Honjaopseoye/menu/nSelect.hon",
    	       "dataSrc": "data",
    	       "type" : "post"
    	     	},
    	    "columns": [
    	   		          { "data": "NOTI_NO" },
    	   		          { "data": "NOTI_CATEGORY" },
    	   		          { "data": "NOTI_TITLE" },
    	   		          { "data": "NOTI_WRITER" },
    	   		          { "data": "NOTI_DATE" },
    	   		          { "data": "NOTI_HIT" }
    	   		        ],
    	   		   //@@@@@@@@@@@@@@@@@@@@@@@@@@@ 한글처리 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  
    	   		     "language": {//한글 처리     
    	   	          "sEmptyTable":     "데이터가 없습니다",
    	   	            "sInfo":           "_START_ - _END_ / _TOTAL_",
    	   	            "sInfoEmpty":      "0 - 0 / 0",
    	   	            "sInformfoFiltered":   "(총 _MAX_ 개)",
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
    	   	            
    	   	            //@@@@@@@@@@오름차순 정렬, 내림차순 정렬 @@@@@@@@@@@@@
    	   	            "oAria": {
    	   	                "sSortAscending":  ": 오름차순 정렬",
    	   	                "sSortDescending": ": 내림차순 정렬"
    	   	            }
    	   	      }   
    	   })
    	var table = $('#notice').DataTable();
       $('#notice tbody').on( 'click', 'tr', function (row) {
           if ( $(this).hasClass('selected') ) { //singleSelected 처리
               $(this).removeClass('selected');
           //////// 로우값 가져오기
               var clickrow = table.row(this).data();
               
           //alert(clickrow.NOTI_NO+", "+clickrow.NOTI_TITLE+", "+clickrow.NOTI_CATEGORY+", "+clickrow.NOTI_DATE+", "+clickrow.NOTI_HIT+", "+clickrow.NOTI_WRITER);
               location.href="../../menu/noticeDetail.hon?NOTI_NO="+clickrow.NOTI_NO;
           }
           else {
               table.$('tr.selected').removeClass('selected');
               $(this).addClass('selected');
           }
       });
       
   // master 일 때만 글쓰기 버튼 보이게 하기
	if(level=='master'&&mem_id=='master'){
		$("#btn_write").show();
	}else {
		$("#btn_write").hide();
	}
}); 
</script>
<script type="text/javascript">
	function btn_write(){
		location.href="./nWrite.jsp"
	}
</script>
<%@ include file="../../include/include/bottom.jsp" %>
</body>
</html>