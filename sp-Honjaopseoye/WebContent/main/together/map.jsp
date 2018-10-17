<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%@include file="../../include/include/commonUI.jsp" %>
</head>
<body>
<div id="map" style="width:1000px;height:800px;"></div>
<script>
var geocoder = new daum.maps.services.Geocoder(),
wtmX = 199769.96511678,
wtmY = 453520.42735819;

var callback = function(result, status) {
if (status === daum.maps.services.Status.OK) {
    console.log(result[0].x); // 126.570667
    console.log(result[0].y); // 33.45070100000001
    System.out.print("콜백");
}
};

//WTM 좌표를 WGS84 좌표계의 좌표로 변환한다
geocoder.transCoord(wtmX, wtmY, callback, {
input_coord: daum.maps.services.Coords.WTM,
output_coord: daum.maps.services.Coords.WGS84
});

var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new daum.maps.LatLng(, 129.7644351433894), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};
var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴


</script>
</body>
</html>