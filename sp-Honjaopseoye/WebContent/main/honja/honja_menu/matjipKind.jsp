<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
		<select class="ui dropdown" id="store_business">
  			<option value="">업종</option>
  			<option value="00">한식</option>
  			<option value="01">중식</option>
  			<option value="02">일식</option>
  			<option value="03">양식</option>
  			<option value="04">분식</option>
  			<option value="05">기타</option>
		</select>
		<select class="ui dropdown" id="store_price">
  			<option value="">가격대</option>
  			<option value="~만원">~만원</option>
  			<option value="만원~2만원">만원~2만원</option>
  			<option value="2만원~3만원">2만원~3만원</option>
  			<option value="3만원~4만원">3만원~4만원</option>
  			<option value="4만원~5만원">4만원~5만원</option>
  			<option value="5만원~">5만원~</option>
		</select>
</body>
</html>