<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../../include/include/commonUI.jsp" %>
</head>
<body>


<script type="text/javascript">
	
	$.ajax({
		success:function(){
			alert("a");	
		}
	})

	a();
	function a(b){
		alert("1")
	}
	function b(){
		alert("2");
	}
</script>



















</body>
</html>
