<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.ui.multiple.selection.dropdown{}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../../include/include/subtop.jsp" %>
<script type="text/javascript">
var mapContainer;
var map;
var mapOption;
var coords = [];
var counter = 0;
var markers = [];
var infowindow;
var datas = [];
var datacounter = 0;
</script>
</head>
<body>
<div class="ui basic segment" style="margin-top:30px;"><!-- big segment -->
	<div class="ui basic segment grid">
	<div class="ui segment" style="width:78%">
			<div class="ui category search">
			  <div class="ui icon input">
			    <input class="prompt" type="text" id="value" placeholder="모임 검색" >
			    <i class="search icon"></i>
			  </div>
			</div>
			<div class="ui multiple selection dropdown" style="width:100px">
				<input type="hidden" value="0" id="bang_gubun" name="bang_gubun"> <i class="dropdown icon"></i>
			<div class="text" id="gubun">분류</div>
				<div class="menu">
					<div class="item" data-value="1">놀놀</div>
					<div class="item" data-value="2">밥밥</div>
					<div class="item" data-value="3">술술</div>
				</div>
			</div>
			<div class="ui multiple selection dropdown">
				<input type="hidden" value="0" id="bang_age"name="bang_age"> <i class="dropdown icon"></i>
			<div class="text" id="age">나이대</div>
				<div class="menu">
					<div class="item" data-value="3100">10대</div>
					<div class="item" data-value="3101">20대</div>
					<div class="item" data-value="3102">30대</div>
					<div class="item" data-value="3103">40대</div>
					<div class="item" data-value="3104">50대</div>
					<div class="item" data-value="3105">60대이상</div>
				</div>
			</div>
			<div class="ui multiple selection dropdown">
				<input type="hidden" value="0" id="bang_gender" name="bang_gender"> <i class="dropdown icon"></i>
			<div class="text" id="age">성별</div>
				<div class="menu">
					<div class="item" data-value="1300">남성만</div>
					<div class="item" data-value="1301">여성만</div>
					<div class="item" data-value="1302">혼성</div>
				</div>
			</div>
			<div class="ui multiple selection dropdown">
				<input type="hidden" value="0" id="bang_money" name="bang_money"> <i class="dropdown icon"></i>
			<div class="text" id="money">금액대</div>
				<div class="menu">
					<div class="item" data-value="1">~3만원</div>
					<div class="item" data-value="3">3만원~5만원</div>
					<div class="item" data-value="5">5만원~10만원</div>
					<div class="item" data-value="10">10만원~15만원</div>
					<div class="item" data-value="15">15만원~20만원</div>
					<div class="item" data-value="20">20만원~30만원</div>
					<div class="item" data-value="40">30만원~50만원</div>
				</div>
			</div>
			<div class="ui multiple selection dropdown">
				<input type="hidden" value="0" name="bang_limit_people" id="bang_limit_people"> <i class="dropdown icon"></i>
			<div class="text">최대 인원</div>
				<div class="menu">
					<div class="item" data-value="1">1명</div>
					<div class="item" data-value="2">2명</div>
					<div class="item" data-value="3">3명</div>
					<div class="item" data-value="4">4명</div>
					<div class="item" data-value="5">5명</div>
					<div class="item" data-value="6">6명</div>
					<div class="item" data-value="7">7명</div>
					<div class="item" data-value="8">8명</div>
					<div class="item" data-value="9">9명</div>
					<div class="item" data-value="10">10명</div>
				</div>
			</div>
			<div class="ui multiple selection dropdown">
				<input type="hidden" value="0" name="bang_topic" id="bang_topic"> <i class="dropdown icon"></i>
			<div class="text">관심사</div>
				<div class="menu">
					<div class="item" data-value="3200">운동</div>
					<div class="item" data-value="3201">영화</div>
					<div class="item" data-value="3202">음악</div>
					<div class="item" data-value="3203">춤</div>
					<div class="item" data-value="3204">독서</div>
					<div class="item" data-value="3205">조립|제작</div>
					<div class="item" data-value="3206">여행</div>
					<div class="item" data-value="3207">레저</div>
					<div class="item" data-value="3208">미술</div>
					<div class="item" data-value="3209">친목</div>
					<div class="item" data-value="3210">맛집</div>
					<div class="item" data-value="3211">연애</div>
					<div class="item" data-value="3212">미디어</div>
					<div class="item" data-value="3213">취업|창업</div>
					<div class="item" data-value="3214">게임</div>
				</div>
			</div>
	</div>
	<div style="width:22%">
		<div class="ui input">
				<button type="button" class="ui medium active button" onclick="g_create()"><i class="user icon"></i>모임 만들기</button>
		</div>
		<div class="ui segment" style="text-align:center"><h3>모임 목록</h3></div>
	</div>
			<div id="map" style="width:78%;height:850px;"></div>
			<div style="width:22%">
				<div class="ui segment">
					<div class="ui grid grouplist" id="placesList">
					</div>
				</div>
			</div>
		<div class="row">
			<div class="ui grid">
			</div>
		</div>
	</div>
</div><!-- big segment -->
<script type="text/javascript">
		$('.dropdown').dropdown();
		$('.ui.search').search({/////sarch input event
		    type          : 'category',
		    minCharacters : 1,
		    apiSettings   : {
		      onResponse: function(jsonData) {
		        var response = {
		            results : {}
		          }
		        console.log(jsonData);
		        ;
		        // translate GitHub API response to work with search
		        $.each(jsonData.data, function(index, item) {
		          var
		            name   = item.BANG_DATE || 'Unknown',
		            maxResults = 8
		          ;
		          console.log(item)
		          if(index >= maxResults) {
		            return false;
		          }
		          // create new language category
		          if(response.results[name] === undefined) {
		            response.results[name] = {
		              name    : name,
		              results : []
		            };
		          }
		          // add result to category
		          response.results[name].results.push({
		            title       : item.BANG_NAME,
		            description : item.BANG_MEMO,
		            url         : './together.jsp?ss='+item.BANG_NAME
		          });
		        });
		        console.log(response)
		        return response;
		      },
		      url: '../../group/searchSelect.hon?value={query}'
		    }
		  });
		spMap();
		function g_create(){
			cmm_window_popup("./together.jsp", 800, 800, "모임방 개설");
		}
		function spMap(){
			mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3
		    };
			map = new daum.maps.Map(mapContainer, mapOption);
			var ps = new daum.maps.services.Places();  

			// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
			infowindow = new daum.maps.InfoWindow({zIndex:1});
			gList();
			// 키워드로 장소를 검색합니다
		}
		function gList(){
			$.ajax({
				method:"post",
				url:"/sp-Honjaopseoye/group/gListSelect.hon",
				success:function(data){
					change_addr(data);
				}
			})
		}
		function change_addr(data){
		    var listEl = document.getElementById('placesList'), 
		    fragment = document.createDocumentFragment(), 
		    bounds = new daum.maps.LatLngBounds(), 
		    listStr = '';
		    // 검색 결과 목록에 추가된 항목들을 제거합니다
		    removeAllChildNods(listEl);
		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
			var geocoder = new daum.maps.services.Geocoder();
			datacounter = data.length;
			data.forEach(function(data){
					//alert(data);
					
				geocoder.addressSearch(data.STORE_ADDR, function(result, status) {
				    // 정상적으로 검색이 완료됐으면 
				     if (status === daum.maps.services.Status.OK) {
				        var coord = new daum.maps.LatLng(result[0].y, result[0].x);
				        coords.push(coord);
				        counter++;
				        console.log(coord);
					    displayPlaces(data,fragment,bounds,coord,counter-1);
				        if(datacounter===counter){
				        	// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
						    listEl.appendChild(fragment); 
						    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
						    map.setBounds(bounds);
				        }
				     }
				     else{
				    	 alert("s");
				     }
				})
			});
		}
		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places,fragment,bounds,coord,i) {
		        // 마커를 생성하고 지도에 표시합니다
		        var placePosition = coord,
		            marker = addMarker(placePosition, i), 
		            itemEl = getListItem(i, places); // 검색 결과 항목 Element를 생성합니다
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        bounds.extend(placePosition);
		        // 마커와 검색결과 항목에 mouseover 했을때
		        // 해당 장소에 인포윈도우에 장소명을 표시합니다
		        // mouseout 했을 때는 인포윈도우를 닫습니다
		        (function(marker, title) {
		        	title=places.BANG_NAME
		        	title=places.BANG_NAME
		        	var bang_no=places.BANG_NO
		        	var store_no=places.STORE_NO
		            daum.maps.event.addListener(marker, 'mouseover', function() {
		                displayInfowindow(marker, title);
		            });
		            daum.maps.event.addListener(marker, 'click', function() {
		            	var info = $('.info');
		            	console.log(info);
		                location.href="./gView.jsp?bang_no="+bang_no+"&store_no="+store_no;
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
		        })(marker, places.place_name);

		        fragment.appendChild(itemEl);
		}
		function getListItem(index, places) {
			var date = places.BANG_DATE
			var a = date.substr(5);
			var el = document.createElement("div"),
		    itemStr = 	'<a href="./gView.jsp?bang_no='+places.BANG_NO+'&store_no='+places.STORE_NO+'">'+
					    '<div class="ui card info">'+
					    '<div class="content">'+
					      '<div class="right floated meta">'+a+'</div>'+
					      places.BANG_NAME+
					    '</div>'+
					    '<div class="image">'+
					      '<img src="/sp-Honjaopseoye/image/storeImg/'+places.STORE_IMG+'">'+
					    '</div>'+
					    '<div class="content">'+
					      '<span class="right floated">'+
					        '<i class="users icon"></i>'+
					        places.BANG_LIMIT_PEOPLE+
					      '</span>'+
					      '<i class="user icon"></i>'+
					      places.BANG_CUR_PEOPLE+
					    '</div>'+
					    '<div class="extra content">'+
					      '<div class="ui large left icon input">'+
					        '<h4>'+places.BANG_MEMO+'</h4>'+
					      '</div>'+
					    '</div>'+
					  '<input type="hidden" value='+places.BANG_NO+'>'+
					  '<input type="hidden" value='+places.STORE_NO+'>'+
					  '</div>'+
					  '</a>';
			el.innerHTML = itemStr;
		    el.className = 'eight wide column item';
		    return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
		    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
		        imgOptions =  {
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