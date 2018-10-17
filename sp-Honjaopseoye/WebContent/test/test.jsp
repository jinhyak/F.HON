<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <!-- Standard Meta -->
<%@include file="../../include/include/commonUI.jsp" %>
  <!-- Site Properties -->
<script type="text/javascript">
var map;
var counter = 0;
var addrArray = [ /*...*/ ];
var xObject = {}; // 각 주소에 대한 x 좌표를 담을 객체
listStr = '';
var mapContainer;
var mapOption;
/* var xObject = {};
var yObject = {};
var addressArray = [];
var total = addressArray.length;
var counter = 0; */
</script>
</head>
<body>
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
<div class="map_wrap">
    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="g_search(); return false;">
                    키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
<script>
var markers = [];
// 지도를 생성합니다    
mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level:5 // 지도의 확대 레벨
    };
// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  
// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});
g_search();
// 키워드로 장소를 검색합니다
function g_search(){
	$.ajax({
		method:"post",
		url:"../group/gListSelect.hon",
		success:function(data){
		    // 검색 결과 목록에 추가된 항목들을 제거합니다
		    listEl = document.getElementById('placesList');
		    menuEl = document.getElementById('menu_wrap');
		    bounds = new daum.maps.LatLngBounds();
		    map = new daum.maps.Map(mapContainer, mapOption);
		    var fragment = document.createDocumentFragment();
		    removeAllChildNods(listEl);
		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
			for(var i=0;i<data.length;i++){
				testDao(data,i,bounds,fragment);
			}
		}
	})
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function testDao(data,i,bounds,fragment) {
				var geocoder = new daum.maps.services.Geocoder();
				console.log(i+":"+data[i].STORE_ADDR);
				geocoder.addressSearch(data[i].STORE_ADDR, function(result, status) {
				xObject["result"] = result[0].x;
				addrArray.push(xObject);
				var total = addrArray.length;
				counter++; // 비동기 콜백이 수행되었으면 하나 업 카운트
				console.log("total:"+total+",counter:"+counter+",주소:"+data[i].STORE_ADDR);
				    if (total === counter) { // 모든 비동기 콜백이 수행되었다면
				    	displayPlaces(data,i,result[0].x,result[0].y,bounds,fragment)
				    };
				});
	}
// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places,i,x,y,bounds,fragment) {
	    console.log(places);
	    console.log(x)
	    console.log(y)
	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new daum.maps.LatLng(x, y),
	            marker = addMarker(placePosition,i), 
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
	        })(marker, places[i].place_name);
	        fragment.appendChild(itemEl);
		    console.log("places::"+places.length)
		    if(places.length===counter){
			    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			    listEl.appendChild(fragment);
		  		console.log(listEl)
			    menuEl.scrollTop = 0;
			    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		    }
	}

// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {
	
	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <h5>' + places.BANG_NAME + '</h5>';
	
	    if (places.road_address_name) {
	        itemStr += '    <span>' + places.BANG_NAME + '</span>' +
	                    '   <span class="jibun gray">' +  places.STORE_ADDR  + '</span>';
	    } else {
	        itemStr += '    <span>' +  places.BANG_NAME  + '</span>'; 
	    }
	                 
	      itemStr += '  <span class="tel">' + places.BANG_MEMO  + '</span>' +
	                '</div>';           
	
	    el.innerHTML = itemStr;
	    el.className = 'item';
	
	    return el;
	}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx) {
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
</body>

</html>
