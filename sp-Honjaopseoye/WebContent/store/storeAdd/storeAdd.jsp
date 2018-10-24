<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
<!--
.business{
	font-size: medium;
	font-weight: bold;
	
}
.gubun{
	font-size: large;
	font-weight: bold;
	color: gray;
}
.keyword{
	font-size: x-large;
	font-weight: bold;
}
-->
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가게등록</title>
<script type="text/javascript">
	/* $(document).ready(function(){
		$('.ui.dropdown')
		  .dropdown()
		;
	}) */

	function chooseMenu(){
		var chooseMenu = $("input[type=radio][name=frequency]:checked").val();
		
		$.ajax({
			method:"POST"
		   ,url:"./"+chooseMenu+"Add.jsp" //check박스의 값을 받아 해당하는 입력 페이지를 부름
		   ,success:function(result){
			   $("#storeInput").html(result);
		   }
		   ,error:function(xhrObject){
			   alert(xhrObject.responseText);
		   }
		});
	}//////////////////end of chooseMenu

</script>
</head>
<body style="min-width: 588px;">
<%@include file="../../include/include/subtop.jsp"%>
<div class="ui basic segment" style="margin-top: 0px;padding-top: 0px;">

<!-- ====================본문===================== -->
  <div class="ui basic segment text container one column grid"style="margin-top: 35px;padding-top: 50px;">
  	<div class="column">
  		<span class="keyword">매장을 등록하세요</span>
  	</div>
  <!--================== 선택매뉴 시작 =============== -->
  	<div class="column" style="padding-bottom: 0px;">
  		<div class="ui form" id="chooseMenu">
  			<div class="inline fields">
    			<label><span class="gubun">매장 구분 선택</span></label>
    			<div class="field">
			      <div class="ui radio checkbox">
        			<input type="radio" name="frequency" checked="checked" value="matjip">
        			<label><span class="business">맛집 등록</span></label>
      			  </div>
    		    </div>
    			<div class="field">
      			<div class="ui radio checkbox">
        			<input type="radio" name="frequency" value="suljip">
        			<label><span class="business">술집 등록</span></label>
      			</div>
    	   </div>
    	   <div class="field">
      	   <div class="ui radio checkbox">
        		<input type="radio" name="frequency" value="nolgot">
        		<label><span class="business">놀곳 등록</span></label>
      	  	</div>
    	  </div>
    	  <div class="ui linkedin button" id="choiceButton" onclick="chooseMenu()">
    	  	확인
    	  </div>
  		</div>
	  </div>
	</div>
	<!--================== 선택매뉴 끝 =============== -->
	<!-- ====================가게정보 입력 시작===================== -->
	<div class="column" id="storeInput" style="min-height: 850px; padding-top: 0px;">
		
	</div>
  	<!-- ====================가게정보 입력 끝===================== -->
  </div>
<!-- ====================본문===================== -->
</div>
<%@include file="../../include/include/bottom.jsp" %>
</body>
</html>