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
							<div class="ui segment button" style="width:100%" onclick="location.href='./meminfo.jsp'">
								<h3> 회원 정보 </h3>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%;background-color:gray">
								<h3> 회원 삭제 </h3>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%" onclick="location.href='./f_search.jsp'">
								<h3> 친구 찾기 </h3>
							</div>
						</div>
						<div class="right aligned column">
							<div class="ui segment button" style="width:100%" onclick="location.href='./f_select.jsp'">
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
					<div class="ui center aligned one column grid">
						<div class="center aligned column">
							<div class="ui segment">
								<div class="ui large header">
							 	         회원 삭제
								</div>
							</div>
						</div>
						<div class="center aligned column">
							<div class="ui segment" style="width:100%;height:100%">
							
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 여기만 바뀌면 됨 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<div class="ui left aligned segment">
									<div style="color:red"><h3>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</h3></div>
									<div><h4>탈퇴할 경우 재사용 및 복구가 불가능합니다.</h4></div>
									<div><h4>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니</h4></div>
									<div><h4>신중하게 선택하시기 바랍니다.</h4></div>
								</div>
								<br>
								<form class="ui form" id="f_form">
									<input type="hidden" name="gubun" id="gubun" value="delete">
								<div class="ui stackable equal width left aligned two column grid segment">
									<div class="row">
										<div class="two wide column">
											<label>아이디</label>
										</div>
										<div class="column">
											<div class="ui disabled input">
			  									<input type="text" id="mem_id" name="mem_id" value="<%=mem_id%>">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="two wide column">
											<label>비밀번호</label>
										</div>
										<div class="column">
											<div class="ui focus input error">
			  									<input type="password" id="pmem_pw" name="pmem_pw" placeholder="비밀번호 입력">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="ui fluid large teal submit button" id="btn_drop" name="btn_drop">탈퇴하기</div>
									</div>
								</div>
								<div class="ui error message"></div>
								</form>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 여기만 바뀌면 됨 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		
							</div>
						</div>
					</div>	
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$("#btn_drop").click(function() {
		var pmem_pw = $("#pmem_pw").val();
		if(pmem_pw == mem_pw) {
			alert("탈퇴 요청이 완료되었습니다.");
			$("#f_form").attr("method","post");
			$("#f_form").attr("action","../../member/empty/delete.test");
			$("#f_form").submit();//이 때 서버로 전송이 일어남
		}
		else {
			alert("비밀번호가 일치하지 않습니다.");
			$("#pmem_pw").val('');
		}
	});// /main/member/empty/delet.test
</script>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ header @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
</div>
<%@ include file="../../include/include/bottom.jsp"%>
</body>
</html>