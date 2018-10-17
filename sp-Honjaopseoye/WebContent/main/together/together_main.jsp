<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String mem_id = null;
String mem_name = null;
String mem_addr = null;
String mem_email = null;
String mem_hobby = null;
String mem_job = null;
String mem_tel = null;
String mem_birth = null;
String mem_gender = null;
String emails[];
String email = null;
String domain = null;
String mem_pw = null;
String lv = null;
int pt = 0;
	List<Map<String,Object>> member = (List<Map<String,Object>>)session.getAttribute("memList");
	if(member!=null){
		mem_id = (String)member.get(0).get("MEM_ID");
		mem_name = (String)member.get(0).get("MEM_NAME");
		mem_addr = (String)member.get(0).get("MEM_ADDR"); 
		mem_email = (String)member.get(0).get("MEM_EMAIL"); 
		mem_hobby = (String)member.get(0).get("MEM_HOBBY"); 
		mem_job = (String)member.get(0).get("MEM_JOB"); 
		mem_tel = (String)member.get(0).get("MEM_TEL");
		mem_birth = (String)member.get(0).get("MEM_BIRTH");
		mem_gender = (String)member.get(0).get("MEM_GENDER");
		mem_pw = (String)member.get(0).get("MEM_PW");
		lv = (String)member.get(0).get("GRADE_LEVEL");
		pt =  Integer.parseInt(member.get(0).get("GRADE_POINT").toString());
		emails = mem_email.split("@");
		email = emails[0];
		domain = "@"+emails[1];
	}
	else{
		mem_id = "비회원";
		lv="없음";
	}
%>
<html>
<head>
<script type="text/javascript">
var mem_id = '<%=mem_id%>'
var mem_name = '<%=mem_name%>'
var mem_addr = '<%=mem_addr%>'
var mem_email = '<%=mem_email%>'
var mem_hobby = '<%=mem_hobby%>'
var mem_job = '<%=mem_job%>'
var mem_tel = '<%=mem_tel%>'
var mem_birth = '<%=mem_birth%>'
var mem_gender = '<%=mem_gender%>'
var email = '<%=email%>'
var domain = '<%=domain%>'
var mem_pw = '<%=mem_pw%>'
var point = '<%=pt%>'
var level = '<%=lv%>'
var msg_count=0;
</script>
<meta charset="UTF-8">
<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
.bg_white {background:#fff;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
<title>Insert title here</title>
<%@include file="../../include/include/commonUI.jsp" %>
<script type="text/javascript">
var x =[];
var y =[];
var g_x=0;
var g_y=0;
var map;
</script>
</head>
<body>
  <div class="ui inverted menu">
    <div class="ui container">
      <a href="../../main/main/main.jsp" class="header item">
        <img class="logo" src="../../image/logo.png" style="width:100px; heigth:100px">
      </a>
      <a href="../../main/main/main.jsp" class="item">Home</a>
      <div class="ui simple dropdown item">
      	  메뉴 <i class="dropdown icon"></i>
        <div class="menu">
          <a class="item" href="javascript:mlist()">회원정보</a>
          <a class="item" href="../../notice/notice.jsp">공지사항</a>
          <a class="item" href="../../main/honja/honja_main.jsp">혼자페이지</a>
          <a class="item" href="../../main/together/together.jsp">만남페이지</a>
          <div class="divider"></div>
          <div class="header">보조 메뉴</div>
          <div class="item">
            <i class="dropdown icon"></i>
            	로그인
            <div class="menu">
              <a class="item" href="../../member/login/login.jsp">로그인</a>
              <a class="item" href="../../member/login/logout.jsp">로그아웃</a>
            </div>
          </div>
        </div>
      </div>
      <div class="right item"><script>document.write(level)</script></div>
      <div class="item">point:<script>document.write(point)</script></div>
      <div class="item"><script>document.write(mem_id)</script></div>
	  <a class="item" href="javascript:messageBox()">
	    <i class="icon mail"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> 메시지
	    </font></font><div class="ui red label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><span id="msg_count">0</span></font></font></div>
	  </a>
	</div>
  </div>
  <script type="text/javascript">
  	function mlist(){
  		if(mem_id!='비회원'){
  		location.href="../../member/meminfo/meminfo.jsp";
  		}
  		else{
  			alert("로그인 후 이용 가능합니다")
  		}
  	}
  	function messageBox(){
  		if(mem_id!='비회원'){
  			cmm_window_popup("../../member/message/messageBox.jsp?mem_id="+mem_id, 800, 800, "메시지함");
  		}
  		else{
  			alert("로그인 후 이용 가능합니다")
  		}
  	}
  	function msgCount(){
  		var param = "mem_id="+mem_id
  		$.ajax({
  			method:"post",
  			url:"../../message/allUnReadMsg.hon",
  			data:param,
  			success:function(data){
  				$("#msg_count").text(msg_count);
  			},
  			error:function(data){
  				alert("메시지 전달 오류")
  			}
  		})
  	}
  	$(document).ready(function(){
  		if(mem_id!='비회원'){
		msgCount();
  		}
  		else{
  		}
  	})
  </script>
<div class="ui segment">
 <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   왼쪽 segment   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ --> 
 <!-- 
 	 <div class="ui blue three item inverted top attached tabular menu">
           <a id="m_reservation" class="item active">
              예약하기
           </a>
           <a id="m_reserv_list" class="item">
              예약조회
           </a>
           <a id="m_reserv_history" class="item">
              예약내역
           </a>
         </div>
     <div id="reservation" class="ui blue bottom attached segment">
      -->
 <div class="ui column grid stackable">
 		<div class="ui fluid gray menu">
 			  <div class="ui simple item">그룹 모임</div>
		      <div class="ui simple dropdown item" id="gubun">
		      	  분류 <i class="dropdown icon"></i>
		        <div class="menu">
		          <a class="item" href="javascript:gubun('술집')">술집</a>
		          <a class="item" href="javascript:gubun('맛집')">맛집</a>
		          <a class="item" href="javascript:gubun('놀집')">놀곳</a>
		          </div>
		        </div>
		      <div class="ui simple dropdown item" id="age">
		      	  나이대 <i class="dropdown icon"></i>
		        <div class="menu">
		          <a class="item" href="javascript:age('3100')">10대</a>
		          <a class="item" href="javascript:age('3101')">20대</a>
		          <a class="item" href="javascript:age('3102')">30대</a>
		          <a class="item" href="javascript:age('3103')">40대</a>
		          <a class="item" href="javascript:age('3104')">50대</a>
		          <a class="item" href="javascript:age('3105')">60대</a>
		          </div>
		        </div>
		      <div class="ui simple dropdown item" id="gender">
		      	  성별<i class="dropdown icon"></i>
		        <div class="menu">
		          <a class="item" href="javascript:gender('1300')">남</a>
		          <a class="item" href="javascript:gender('1301')">녀</a>
		          <a class="item" href="javascript:gender('혼성')">혼성</a>
		          </div>
		        </div>
		      <div class="ui simple dropdown item" id="money">
		      	  금액<i class="dropdown icon"></i>
		        <div class="menu">
		          <a class="item" href="javascript:cash('1')">1만원~3만원</a>
		          <a class="item" href="javascript:cash('3')">3만원~5만원</a>
		          <a class="item" href="javascript:cash('5')">5만원~10만원</a>
		          <a class="item" href="javascript:cash('10')">10만원~15만원</a>
		          <a class="item" href="javascript:cash('15')">15만원~20만원</a>
		          <a class="item" href="javascript:cash('20')">20만원~30만원</a>
		          <a class="item" href="javascript:cash('40')">30만원~50만원</a>
		          </div>
		        </div>
		      <div class="ui simple dropdown item" id="persons">
		      	  인원 수<i class="dropdown icon"></i>
		        <div class="menu">
		          <a class="item" href="javascript:persons('1')">1명</a>
		          <a class="item" href="javascript:persons('2')">2명</a>
		          <a class="item" href="javascript:persons('3')">3명</a>
		          <a class="item" href="javascript:persons('4')">4명</a>
		          <a class="item" href="javascript:persons('5')">5명</a>
		          <a class="item" href="javascript:persons('6')">6명</a>
		          <a class="item" href="javascript:persons('7')">7명</a>
		          <a class="item" href="javascript:persons('8')">8명</a>
		          <a class="item" href="javascript:persons('9')">9명</a>
		          <a class="item" href="javascript:persons('10')">10명</a>
		          </div>
		        </div>
		      <div class="ui simple dropdown item" id="hobby">
		      	  관심사<i class="dropdown icon"></i>
		        <div class="menu">
		          <a class="item" href="javascript:hobby('3200')">운동</a>
		          <a class="item" href="javascript:hobby('3201')">영화</a>
		          <a class="item" href="javascript:hobby('3202')">음악</a>
		          <a class="item" href="javascript:hobby('3203')">춤</a>
		          <a class="item" href="javascript:hobby('3204')">독서</a>
		          <a class="item" href="javascript:hobby('3205')">조립|제작</a>
		          <a class="item" href="javascript:hobby('3206')">여행</a>
		          <a class="item" href="javascript:hobby('3207')">레저</a>
		          <a class="item" href="javascript:hobby('3208')">미술</a>
		          <a class="item" href="javascript:hobby('3209')">친목</a>
		          <a class="item" href="javascript:hobby('3210')">맛집</a>
		          <a class="item" href="javascript:hobby('3211')">연애</a>
		          <a class="item" href="javascript:hobby('3212')">미디어</a>
		          <a class="item" href="javascript:hobby('3213')">취업|창업</a>
		          <a class="item" href="javascript:hobby('3214')">게임</a>
		          </div>
		        </div>
		      <div class="right item"><div class="ui input"><input id="keyword" style="width:200px"></div><div class="ui button" onclick="searchPlaces()" style="width:100px;height:34px">검색</div></div>
		      <div class="ui item button" onclick="bang_insert()"><h2>모임 방 개설</h2></div>
		</div>
 <div class="ui ten wide column basic segment pushable" style="width:1200px;height:1400px">
	<!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 지도   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
 	<div class="map_wrap">
	<!-- //지도 위치 -->
    <div id="map" style="width:100%;height:650px;position:relative;overflow:hidden;"></div>
        <div id="pagination"></div>
	</div>
 </div>
 <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  왼쪽  시그먼트  끝   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
 
 <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  오른쪽 시그먼트    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
 <div class="ui six wide column basic segment pushable">
	 <div class="ui segment">
		<div class="header" style="text-align:center;margin-top:10px;" ><h1> 그룹 목록  </h1></div>
		<div id="menu_wrap"><ul id="placesList"></ul></div>
	 </div>
 </div>
 </div><!--  grid  -->
</div><!-- 제일 큰 segment  -->
<script>
function hobby(hobby){
	alert(hobby);
}
function persons(a){
	alert(a);
}
function cash(b){
	alert(b);	
}
function gender(c){
	alert(c)
}
function age(d){
	alert(d)
}
function gubun(e){
	alert(e);
}
/*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 지도 함수  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*/

function bang_insert(){
	cmm_window_popup("./together.jsp", 800, 800, "그룹만들기창")
}
// 마커를 담을 배열입니다
var markers = [];
// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  
// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});
// 키워드로 장소를 검색합니다
searchPlaces();
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng( 129.7644351433894,35.24052597099921 ), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
 	// 지도를 생성합니다    
map = new daum.maps.Map(mapContainer, mapOption); 
// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {
    var keyword = document.getElementById('keyword').value;
    alert(keyword)
    console.log(keyword);
    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }
    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch(keyword, testDao); 
}
function testDao(){
    $.ajax({
    	method:"post"
    	,url:"/sp-Honjaopseoye/group/searchSelect.hon"
    	,success:function(result){
    		//alert("result:"+result)
    		displayPlaces(result);
    		//displayPlaces(result);
    	}
    })
        /* for(i in data){
        	$("#d_abc").append("<option id="+data[i].addernum+"val="+data+">")
        } */
}
//function change_address(places,i){
//function change_address(places,i,bounds,fragment){
function change_address(places,bounds,fragment,i){
    var geocoder = new daum.maps.services.Geocoder();
    //alert("result1:"+result1);
    //alert("result:"+temp[0].STORE_NAME+","+temp[1].STORE_NAME);
  	var callback = function(result, status) {
			if (status === daum.maps.services.Status.OK) {
		    	//console.log(result);result[0].x, result[0].y
		    	//g_x = result[0].x;
		    	//g_y = result[0].y;
		        // 마커를 생성하고 지도에 표시합니다
		        var placePosition = new daum.maps.LatLng(result[0].x,result[0].y),
		            marker = addMarker(placePosition, i),
		            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        bounds.extend(placePosition);
		        // 마커와 검색결과 항목에 mouseover 했을때
		        // 해당 장소에 인포윈도우에 장소명을 표시합니다
		        // mouseout 했을 때는 인포윈도우를 닫습니다
		        (function(marker, title) {
		            daum.maps.event.addListener(marker, 'mouseover', function() {
		                displayInfowindow(marker, title);
		            });
		            daum.maps.event.addListener(marker, 'mouseout', function() {
		                infowindow.close();
		            });
		            itemEl.onmouseover =  function () {
		                displayInfowindow(marker, title);
		            };
		            itemEl.onmouseout =  function () {
		                infowindow.close();
		            };
		        })(marker, places[i].STORE_NAME);
		        fragment.appendChild(itemEl);					
		    }/////////// end of if
		};
		//geocoder.addressSearch(places[i].STORE_ADDR, callback);	
	geocoder.addressSearch(temp[i].STORE_ADDR, callback);	
//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////
		//console.log("temp[i].STORE_ADDR:"+temp[i].STORE_ADDR);
}/////////////////// end of change_address
// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {//[object,object]
    alert("displayPlaces:"+result);
	var listEl = document.getElementById('placesList'),
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(),
    bounds = new daum.maps.LatLngBounds(),
    listStr = '';
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);
    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    for (var i=0;i<places.length;i++){
//    	change_address(places,i);
//    	change_address(places,i,bounds,fragment);
    	change_address(places,bounds,fragment,i);
    	//console.log("for문 끝")
    }
    //console.log(x);
    //console.log(x.length+" , "+x[0]);
    //alert("x:"+x+", "+x.length);
    //console.log(y);
    //console.log(Object.keys(x).length);
    //var temp = JSON.stringify(x);
    //var obj = JSON.parse(temp);
/*     var obj = JSON.parse(x);
    console.log(obj[0]+" , "+obj.length); */
    
    
     for (var i=0; i<places.length; i++ ){
/*         // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(x[i],y[i]),
            marker = addMarker(placePosition, i),
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);
        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });
            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });
            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };
            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].STORE_NAME);
        fragment.appendChild(itemEl); */
    }/////////////////////end of for /////////////////////
    alert("for밖");
    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    alert("11");
    menuEl.scrollTop = 0;
    alert("111");
    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds); 
    alert("1111");
}
// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {
    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + 'ssss' + '</h5>';
    if (false) {
        itemStr += '    <span>' + places.STORE_BUSINESS + '</span>' +
                    '   <span class="jibun gray">' +  'sees'  + '</span>';
    } 
    else {
        itemStr += '    <span>' +  'places.STORE_NAME'  + '</span>'; 
    }
      itemStr += '  <span class="tel">' + 'ss'  + '</span>' +
                '</div>';           
    el.innerHTML = itemStr;
    el.className = 'item';
    return el;
}
/* 진짜 function getListItem(index, places) {
    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';
    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           
    el.innerHTML = itemStr;
    el.className = 'item';
    return el;
} */
// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  
        {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage
        });
    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
    return marker;
}
// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}
// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 
    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }
    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;
        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }
        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}
// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
    infowindow.setContent(content);
    infowindow.open(map, marker);
}
 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>
<%@include file="../../include/include/bottom.jsp" %>
</body>
</html>