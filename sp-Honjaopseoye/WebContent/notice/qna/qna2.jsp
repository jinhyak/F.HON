<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>������ �亯</title>

<link rel="stylesheet" type="text/css" href="../../Semantic/DataTables/DataTables-1.10.18/css/jquery.dataTables.min.css">
<script type="text/javascript" src="../../Semantic/jquery-3.3.1.js"></script>
<script type="text/javascript" src="../../Semantic/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="../../Semantic/semantic.css" />
<script src="../../Semantic/semantic.js"></script>
</head>
<script type="text/javascript">

$(document).ready(function() {

	
	$("#insert_go").click(function(){
		location.href="./qnaWrite.jsp";
		
	});
	

    $('#dt_reserv_list').dataTable({
      //url:'../../member/empty/getReservList.test',
      "ajax":{ "url":"../../notice/qSelect.hon", "type":"POST" },
       columns:[
			{"data":'QNA_NO',"className":'dt-body-center'},
			{"data":'QNA_TITLE',"className":'dt-body-center'},
			{"data":'QNA_CATEGORY',"className":'dt-body-center'},
			{"data":'QNA_WRITER',"className":'dt-body-center'},
			{"data":'QNA_DATE',"className":'dt-body-center'},
			{"data":'QNA_HIT',"className":'dt-body-center'}
             ],
      "language": {     
          "sEmptyTable":     "�����Ͱ� �����ϴ�",
            "sInfo":           "_START_ - _END_ / _TOTAL_",
            "sInfoEmpty":      "0 - 0 / 0",
            "sInfoFiltered":   "(�� _MAX_ ��)",
            "sInfoPostFix":    "",
            "sInfoThousands":  ",",
            "sLengthMenu":     "�������� �ټ� _MENU_",
            "sLoadingRecords": "�д���...",
            "sProcessing":     "ó����...",
            "sSearch":         "�˻�:",
            "sZeroRecords":    "�˻� ����� �����ϴ�",
            "oPaginate": {
                "sFirst":    "ó��",
                "sLast":     "������",
                "sNext":     "����",
                "sPrevious": "����"
            },
            "oAria": {
                "sSortAscending":  ": �������� ����",
                "sSortDescending": ": �������� ����"
            }
      }   
   });


    var table = $('#dt_reserv_list').DataTable(); // ���̺�
    $('#dt_reserv_tbody').on('click', 'tr', function (e, dt, type, indexes) { // Ƽ�ٵ� ������..
       var data = table.row(this).data();
       var QNA_NO = data.QNA_NO;
       location.href='../../notice/qView.hon?qna_no='+QNA_NO;
    });
});
</script>
<body>
<form id="j_s"></form>

<!-- ��� ���̺� ����  -->
<table align="center" width="1000px" height="300px">
<tr>
<td align="center"><img src="/sp-Honjaopseoye/notice/qna/logo.png"></td>
</tr>
<tr>
<tr>
<td height="100px"></td>
</tr>
<tr>
<td align="center"><font size="10">Q&A ���� �ñ���? ?</font></td>
</tr>
</table>


<!-- ��� ���̺� ���� �� -->

<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<div class="ui header" style="margin-left: 150px;margin-right: 150px; margin-top: 100px;margin-bottom: 100px">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ index @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<table border="1" align="center">
<tr>
<td>
   <div class="ui field">
      <div class="ui stackable column grid">
         <div class="ui column">
            <div class="ui blue three item inverted top attached tabular menu">
              <a id="m_reservation" class="item">
              </a>
              <a id="m_reserv_list" class="item active">
              </a>
              <a id="m_reserv_history" class="item">
              </a>
            </div>
            <div id="reserv_list" class="ui blue bottom attached segment">
               <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ���Ӹ� @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
               <table id="dt_reserv_list" class="ui center aligned stackable selectable display datatable">
                 <thead>
                   <tr>
                      <th style="width:100px;">�� ��ȣ</th>
                      <th style="width:100px;">����</th>
                      <th style="width:300px;">�з�</th>
                      <th style="width:200px;">�ۼ���</th>
                      <th style="width:500px;">��¥</th>
                      <th style="width:100px;">��ȸ��</th>
                    </tr>
                 </thead>
                    <tbody id="dt_reserv_tbody"></tbody>
               </table>
               <button class="ui primary button" id="insert_go">
  �����ϱ�
</button>
            </div>
         </div>
      </div>
   </div>
</div>
</td>
</tr>
</table>
<script type="text/javascript">
$(".menu").find('a').click(function() {
   $(".menu").find('a').attr('class','item');//active �ʱ�ȭ
   $(this).attr('class','item active');//�����޴� active�� ����
   if($(this).attr('id')=='m_reservation'){
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

<%@ include file="/include/include/bottom.jsp" %>
</body>
</html>