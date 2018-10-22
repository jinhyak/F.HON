<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%@ include file="../../include/include/subtop.jsp" %>
 
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<div class="ui header" style="margin-left: 150px;margin-right: 150px; margin-top: 100px;margin-bottom: 100px">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ index @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
	<div class="ui two attached stackable column grid" style="width:100%">
		<div class="column"style="width:20%;">
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
							<div class="ui segment button" style="width:100%" onclick="location.href='./meminfo.jsp'">
								<h3> 회원 정보 </h3>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%" onclick="location.href='./mdelete.jsp'">
								<h3> 회원 삭제 </h3>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%" onclick="location.href='./f_search.jsp'">
								<h3> 친구 찾기 </h3>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%;background-color:gray">
								<h3> 친구 관리 </h3>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%" onclick="location.href='./gList.jsp'">
								<h3> 그룹 관리</h3>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%" onclick="group()">
								<h3> 그룹 만들기 </h3>
							</div>
							<script>
							function group(){
								cmm_window_popup("../../main/together/together.jsp", 800, 800, "모임 만들기창")
							}
							</script>
						</div>
					</div>	
				</div>
			</div>
		</div>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ contents @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<div class="column"style="width:80%;">
			<div class="ui field">
				<div class="ui segment">
					<div class="ui one column grid">
						<div class="center aligned column">
							<div class="ui segment">
								<div class="ui large header">
							 	         친구 관리
								</div>
							</div>
						</div>
						<div class="column">
							<div class="ui segment" style="width:100%;height:100%">
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 여기만 바뀌면 됨 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
								<div class="ui stackable one column grid" style="margin-top:20px;margin-bottom:50px">
									<div class="column">
										<h2 class="ui dividing header" style="margin-left:50px;">친구 목록</h2>
									</div>
									<div class="ui selection list" id="fri_select" style="width:100%;padding-left: 80px;padding-right: 80px;">
									</div>
									<script type="text/javascript">
											var param="mem_id="+mem_id;
											$.ajax({
												 method:"post"
												,data:param
												,url:"../../friend/fri_select.hon"
												,success:function(data){
													$("#fri_select").html(data);
												}
												,error:function(data){
													alert("실패");
												}
											})
									</script>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 여기만 바뀌면 됨 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
								</div>
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
</body>
</html>