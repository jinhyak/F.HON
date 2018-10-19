<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
	$('.ui.dropdown').dropdown();
})
	
	function addr_confirm(){
		var addr = $('#result_address').val()+" "+$('#detail_address').val()
		$('#store_addr').attr('value',addr);
		$('.modal')
		.modal('hide');
	}
	function cancel(){
		$('.modal')
		.modal('hide');
	}
/* ----------------------------------------모달 끝---------------------------------------------- */	
/* -----------------------------------------파일 이름 inputtag에 넣어주는 함수 */ 
	function fileName(){
		
		var fileName = $('#fileinput').val();
		var clean = fileName.split('\\').pop();//경로 잘라서 이미지 이름만 나오게함
		
		$('#store_img').attr('value',clean);
	}
	
	/* ---------------------------------end of fileName -------------------------*/

	/* -------------------------------------------값 등록 함수------------------------------ */
	function submit(){
		
		if(valueCheck()==false)return;
		
		if(confirm("등록하시겠습니까?")){
			var imgData = new FormData(document.getElementById('f_imgInput')); 
			 // 이미지 등록 처리
		     $.ajax({
		       method:"POST" // 포스트 방식
		      ,url:"../storeImg.hon" // 서블릿		        
		      ,data:imgData // 폼 필드
	          ,enctype:"multipart/form-data" // 멀티파트로 
	          ,contentType: false
	          ,processData: false
	          ,success:function(result){
	        	  //데이터를 db에 넣어주는 ajax임 동시에하면 꼬여서 success에 넣어줌
	        	  $('#store_img').attr('value',result);
	        	  //alert($('#store_img').val());
	        	var formData = $("#f_matjip").serialize();
	        	//alert(formData)
	  			$.ajax({
	  				url:"../storeAdd.hon",
	  			 	method: "POST",
	  				data: formData,
	  				success:function(result){
	  					
	  					//alert(result)
	  					if(result=='1'){
	  						alert("등록되었습니다");
	  						location.href="../../main/main/main.jsp";
	  					}
	  					else{
	  						alert("등록이 실패하였습니다");
		  					location.href="./storeAdd.jsp"
	  					}
	  				},error:function(xhrObject){
	  					   alert(xhrObject.responseText);
	  				   }
	  			})////////end of ajax
	        	  
	          }
	          ,error:function(xhrObject){
	             alert("error:"+xhrObject.responseText);
	          }  
	          });//////////////////end of ajax
			
		}//end of if
		else{
			return;
		}
	}////////////end of submit()
	/* -------------------------------------------값 등록 끝----------------------------------- */
	/* --------------------------------------------입력값 유효성 검사 --------------------------------------------- */
	function valueCheck(){
		if($.trim($('#store_name').val())==""){
			alert("가게이름을 입력하세요");
			$("#store_name").focus();
			return false;
		};
		var check = regexp = /^[0-9]*$/
		var tel = $("#store_tel").val();
		if($.trim($('#store_tel').val())==""){
			alert("전화번호를 입력하세요");
			$("#store_tel").focus();
			return false;
		}
		else if(!check.test(tel)){
			alert("전화번호는 숫자만 입력가능합니다")	;
			$("#store_tel").focus();
			return false;
		};
		
		var business = $('#store_business').dropdown('get value');
		if($.trim(business)==""){
			alert("업종을 선택하세요");
			$("#store_business").focus();
			return false;
		};
		var price = $('#store_price').dropdown('get value');
		if($.trim(price)==""){
			alert("가격대를 선택하세요");
			$("#store_price").focus();
			return false;
		};
		if($.trim($('#store_addr').val())==""){
			alert("주소를 입력하세요");
			$("#store_addr").focus();
			return false;
		};
		if($.trim($('#store_img').val())==""){
			alert("대표이미지를 첨부하세요");
			$("#store_img").focus();
			return false;
		};
		if($.trim($('#store_introduce').val())==""){
			alert("가게 한줄소개를 입력하세요");
			$("#store_introduce").focus();
			return false;
		};
		if($.trim($('#store_homepage').val())==""){
			alert("홈페이지가 없다면 없음을 입력해주세요");
			$("#store_homepage").focus();
			return false;
		};
		if($.trim($('#store_keyword').val())==""){
			alert("키워드를 하나 이상 입력하세요");
			$("#store_keyword").focus();
			return false;
		};
		return true;
	}
	/* ------------------------------------------------------유효성 검사 끝-------------------------------------- */
	/* -------------------------------------------------지도 script코드 시작-------------------------------------*/
	function locationInput(){
			$('#modal_location').modal({
				centered:false
			})
			.modal('show');
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	   	 	mapOption = {
	        	center: new daum.maps.LatLng(37.566821, 126.978657), // 지도의 중심좌표
	       		 level: 3 // 지도의 확대 레벨
	   		 };  
				mapContainer.style.width = "850px";
		 		mapContainer.style.height = "398px"; 

			// 지도를 생성합니다    
		 	var map = new daum.maps.Map(mapContainer, mapOption);
	
		$('#addr_btn').click(function(){
		var value = $.trim($('#search_addr').val())
		if(value==""){
			alert('주소를 입력하세요')
			return;
		}
		else{
			//alert(value)
			// 장소 검색 객체를 생성합니다
			var ps = new daum.maps.services.Places(); 
	
			// 키워드로 장소를 검색합니다
			ps.keywordSearch(value, placesSearchCB); 
	
			// 키워드 검색 완료 시 호출되는 콜백함수 입니다
			function placesSearchCB (data, status, pagination) {
	    		if (status === daum.maps.services.Status.OK) {
	
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	    	    // LatLngBounds 객체에 좌표를 추가합니다
	        	var bounds = new daum.maps.LatLngBounds();
	
	        	for (var i=0; i<data.length; i++) {
	            	bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
	        	}       
	        	
	        	// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        	map.setBounds(bounds);
	        	map.setLevel(3);
	        	
	        	// 지도를 클릭한 위치에 표출할 마커입니다
	        	var marker = new daum.maps.Marker({
	        	}); 
	        	// 지도에 클릭 이벤트를 등록합니다
	        	// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	        	daum.maps.event.addListener(map, 'click', function(mouseEvent) {
	        		
	        	    // 클릭한 위도, 경도 정보를 가져옵니다 
	        	    var latlng = mouseEvent.latLng; 
	        	   
	        	 	// 지도에 마커를 표시합니다
	        	    marker.setMap(map);
	        	    // 마커 위치를 클릭한 위치로 옮깁니다
	        	    marker.setPosition(latlng);
	        	    
	        	    var lat = latlng.getLat() //위도
	        	    var lng = latlng.getLng() //경도
	        	    
	        	    $('#store_latitude').attr('value',lat)
	        	    $('#store_longitude').attr('value',lng)
	        	    
	        	    var geocoder = new daum.maps.services.Geocoder();
	        	    
	        	    var coord = new daum.maps.LatLng(lat,lng);
	        	    	var callback = function(result, status) {
	        	        if (status === daum.maps.services.Status.OK) {
	        	        	
	        	           	$('#result_address').attr('value',result[0].address.address_name)
	        	        }
	        	        else{
	        	        	alert("주소번지불러오기 에러")
	        	        }
	        	    	};///end of collback
	        	    //콜백함수 실행
        	    	geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);

	        		});/////end of addListner
	        	
	    		}//end of if
	    		else{
	    			alert('주소를 다시 검색하세요');
	    		}
			}//////// end of placesSearchCB
		}/////////////end of else
		});////////////////////end of click
	}/////////end of locationInput()
	

	/* -------------------------------------------------지도 script코드 끝-------------------------------------*/
	
	
</script>
<div class="ui stackable segment" >
<form id="f_matjip" name="f_matjip" method="POST">
		<div class="ui divider"></div>
		<!-- ==========================가게 이름 등록=============================== -->
		<div class="ui labeled input" style="width:100%;">
  			<div class="ui label">
   				<h2>가게이름</h2>
  			</div>
  			<input type="text" id="store_name" name="store_name" placeholder="ex)홍짜장 가산점">
		</div>
		<!-- ============================가게 이름 등록 끝========================== -->
		<div class="ui divider"></div>
		<!-- ==============================가게 전화번호 등록======================= -->
		<div class="ui labeled input" style="width:100%;">
  			<div class="ui label">
   				<h2>전화번호</h2>
  			</div>
  			<input type="text" id="store_tel" name="store_tel" placeholder="숫자만 입력하세요">
		</div>
		<!-- ================================가게 전화번호 등록 끝==================== -->
		<div class="ui divider"></div>
		<!--=================================음식 종류 등록=========================  -->
		<div class="ui label">
			<h2>업종</h2>
		</div>
		<div class="ui dropdown" id="store_business" name="store_business">
 			<input type="hidden"  name="store_business">
  				<i class="dropdown icon"></i>
  				<div class="default text">업종</div>
  			<div class="menu">
    			<div class="item" data-value="2100">한식</div>
    			<div class="item" data-value="2101">중식</div>
    			<div class="item" data-value="2102">일식</div>
    			<div class="item" data-value="2103">양식</div>
    			<div class="item" data-value="2104">분식</div>
    			<div class="item" data-value="2105">기타</div>
  			</div>
		</div>
		<!-- ============================음식 종류 등록 끝============================ -->
		<div class="ui divider"></div>
		<!-- ===========================가격대 등록===================================== -->
		<div class="ui label">
			<h2>가격대</h2>
		</div>
		<div class="ui dropdown" id="store_price" name="store_price">
 			<input type="hidden" name="store_price">
  				<i class="dropdown icon"></i>
  				<div class="default text">가격대</div>
  			<div class="menu">
    			<div class="item" data-value="~만원">~만원</div>
    			<div class="item" data-value="만원~2만원">만원~2만원</div>
    			<div class="item" data-value="2만원~3만원">2만원~3만원</div>
    			<div class="item" data-value="3만원~4만원">3만원~4만원</div>
    			<div class="item" data-value="4만원~5만원">4만원~5만원</div>
    			<div class="item" data-value="5만원~">5만원~</div>
  			</div>
		</div>
		<!--================================ 가격대 등록 끝========================= -->		
		<div class="ui divider"></div>
		<!-- ===========================주소 시작============================ -->
		<div class="ui labeled icon input" style="width:100%;">
  			<div class="ui label">
   				<h2>주소 등록</h2>
  			</div>
  			<input type="text" name="store_addr" readonly="readonly"
				  placeholder="주소가 입력되지 않았습니다" id="store_addr">
				 <div class="ui icon button" onclick="locationInput()" style="padding-top: 20px; width:100px;">
				  	<i class="plus icon"></i>
				  	주소등록
				 </div>
		</div>
		<!-- ===========================주소 끝============================ -->
		<div class="ui divider"></div>
		<!-- ================================가게 이미지 등록===================== -->
		<div class="ui labeled input" style="width:100%;">
  			<div class="ui label">
   				<h2>대표이미지</h2>
  			</div>
  				<input type="text" placeholder="이미지파일이 없습니다" readonly="readonly" id="store_img" name="store_img">
  				<label class="ui button" for="fileinput" style="padding-top: 20px; width:150px;">
  					<i class="ui upload icon"></i> 
    				이미지등록
			   </label>
		</div>
		<!-- =============================가게 이미지 등록 끝========================== -->
		<div class="ui divider"></div>
		<!--=============================== 가게 한줄소개 등록======================== -->
		<div class="ui labeled input" style="width:100%;">
  			<div class="ui label">
   				<h2>가게 한줄소개</h2>
  			</div>
  			<input type="text" placeholder="ex)가산동 최고의 맛을 자랑하는 중국집" id="store_introduce" name="store_introduce">
		</div>
		<!--===============================가게 한줄소개 등록 끝=======================  -->
		<div class="ui divider"></div>
		<!-- =============================가게 홈페이지 주소 등록========================= -->
		<div class="ui labeled input" style="width:100%;">
  			<div class="ui label">
   				<h2>가게 홈페이지 주소</h2>
  			</div>
  			<input type="text" placeholder="존재하지 않으면 없음입력" id="store_homepage" name="store_homepage">
		</div>
		<!-- =============================가게 홈페이지 주소 등록 끝========================= -->
		<div class="ui divider"></div>
		<!-- =============================가게 검색 키워드 등록========================= -->
		<div class="ui labeled input" style="width:100%;">
  			<div class="ui label">
   				<h2>검색키워드</h2>
  			</div>
  			<input type="text" placeholder="ex)짜장면 자장면 가산동 가산 가산동중국집 중국집" id="store_keyword" name="store_keyword">
		</div>
		<!-- =============================가게 검색 키워드 등록 끝========================= -->
		<!-- ============== 위도 경도 히든태그  이값들을 db에 전송============= -->
  			<input type="hidden" placeholder="위도가 없습니다"readonly="readonly" id="store_latitude" name="store_latitude">
  			<input type="hidden" placeholder="경도가 없습니다"readonly="readonly" id="store_longitude" name="store_longitude">
		<!-- ============== 위도 경도 히든태그 끝===================== -->
		
</form>	
		<form id="f_imgInput">
		<!-- ===============================이미지 파일이 들어가 있는 input태그============================= -->
		<input type="file" accept="image/*" id="fileinput" name="store_img" style="display:none" onchange="fileName()"/>
		</form>
	
		
		<div class="ui divider"></div>
		<div class="ui basic center aligned segment">
			<button class="ui primary button" id="sendbutton" onclick="submit()">
  			등록
  			</button>
			<button class="ui button" onclick=" location.reload();">
  			취소
			</button>
		</div>
</div>

<!-- =========================================지도 모달 시작==================================== -->
<div class="ui modal" id="modal_location">
	<i class="close icon"></i>
	<div class="header">
			<h3>주소 등록창</h3>
	</div>
	<div class="content">
		<div class="body">
			<div class="ui basic segment container"
			style="padding-top: 0px;padding-bottom: 0px;">
			<!--========주소 검색 버튼========  -->
			<div class="ui action input">
 				<input type="text" placeholder="주소를 입력하세요" id="search_addr">
  				<button class="ui button" id="addr_btn">검색</button>
			</div>
			<!--========주소 검색 버튼 끝========-->
			<div class="ui basic right floated segment"
			style="margin-top: 0px;padding-right: 0px;margin-right:
			0px;padding-top: 0px;margin-bottom: 0px;">
				<div class="ui pointing below big label">
      				검색후 매장의 위치를 클릭하세요
    			</div>
    		</div>
			<div class="ui divider"></div>
			<!-- ==========지도 세그먼트 =========-->
  			<div class="ui top attached segment pushable"style="height: 400px;">
	  		<!--======= 지도 시작 =======-->
		      	<div id="map"></div>
  			<!--======= 지도 끝  =======-->
  			</div>
  			<!-- ==========지도 세그먼트 끝=========-->
  			<div class="ui divider"></div>
			<!-- ==========버튼과 인풋 =========--> 
			
  			<div class="ui labeled input" style="width:100%;">
  				<div class="ui label">
    			주소  
    			</div>
    			<input type="text" placeholder="주소가 없습니다"readonly="readonly" id="result_address">
			</div>
			<div class="ui labeled input" style="width:100%;padding-top: 5px;">
  			<div class="ui label">
   				상세주소
  			</div>
  			<input type="text" placeholder="상세주소를 입력하세요" id="detail_address" name="detail_address">
	  			<div class="ui primary button" onclick="addr_confirm()" style="margin-left: 3px;">
  				확인
  				</div>
  				<div class="ui primary button" onclick="cancel()"style="margin-right: 0px;">
  				취소	
  				</div>
			</div>
			<!-- ==========버튼과 인풋 끝=========-->
  			
			</div>
		</div>
	</div>
</div>
<!-- =========================================지도 모달 끝 ==================================== -->