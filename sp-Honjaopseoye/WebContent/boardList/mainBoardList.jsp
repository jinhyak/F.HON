<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>	
<%


	// 그냥 login
	String smem_name = null;
		List<Map<String, Object>> memList = (List<Map<String, Object>>) session.getAttribute("memList");
	if ((List<Map<String, Object>>)memList != null) {
		smem_name = memList.get(0).get("MEM_NAME").toString();
	}
	
	// naver login
	Map<String, Object> pMap = null;
	if(session.getAttribute("nMem") != null){
		pMap = (Map<String, Object>)session.getAttribute("nMem");
		smem_name = pMap.get("nickname").toString();
	}
	
%>

<%
	// 최고 조회수
	
	    String bab_title = null;
	    String bab_category = null;
	    String bab_text = null;
	    String bab_hit = null;
	    
	    String sul_title = null;
	    String sul_category = null;
	    String sul_text = null;
	    String sul_hit = null;
	    
	    String nol_title = null;
	    String nol_category = null;
	    String nol_text = null;
	    String nol_hit = null;

%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/include/include/subtop.jsp" %>
<title>메인</title>
</head>

<script type="text/javascript">
$(document).ready(function(){
	
	$("#g_insert").click(function(){
		location.href="./write.jsp";
	});

})

</script>
<body>

	<div class="ui inverted vertical masthead center aligned segment" style="margin-top: 50px; height: 400px;">
	    <div class="ui text container"style="margin-top: 70px;">
	      <h1 class="ui inverted header">
	       <font size="10">혼족들의 리뷰 게시판</font>
	      </h1>
	      <br>
	      <br>
	      <h2>해당 카테고리 선택후 리뷰를 확인해보세요</h2>
	    </div>
	  </div>

<!--  -->
	<div class="ui container"
		style="margin-left: 200px; margin-right: 200px; margin-bottom:10%">
		<h2 class="ui header" style="margin-top: 50px;">
			<img src="../image/logo.png" style="width: 170px; height: 60px;">
			<div class="content">
				혼자옵서예 리뷰-
				<div class="sub header" style="padding-top: 10px;">네티즌들의 추천 ! 그
					이상을 누릴 수 있는 리뷰 게시판</div>
			</div>
		</h2>
		<!--중간  -->
		<div class="ui container"
			style="margin-left: 200px; margin-right: 200px;margin-top:50px;">
			<div class="ui grid" align="center" style="text-align: center">
				<div class="four wide column">

					<div class="ui card">
						<div class="ui slide masked reveal image"
							style="width: 350px; height: 150px;">
							<img src="/sp-Honjaopseoye/image/gui/i1.jpg" width="300px" height="300px"
								class="visible content"> <img src="/sp-Honjaopseoye/image/gui/i2.jpg"
								width="300px" height="300px" class="hidden content">
						</div>
						<div class="content">
							<a class="header" href="/sp-Honjaopseoye/boardList/babBoard.jsp">평범한 일상</a>
							<div class="meta">
								<span class="date">혼밥 리뷰를 확인해 보세요!</span>
							</div>
						</div>
					</div>

				</div>
				<div class="four wide column">

					<div class="ui card">
						<div class="ui slide masked reveal image"
							style="width: 350px; height: 150px;">
							<img src="/sp-Honjaopseoye/image/gui/i3.jpg" width="300px" height="300px"
								class="visible content"> <img src="/sp-Honjaopseoye/image/gui/i4.jpg"
								width="300px" height="300px" class="hidden content">
						</div>
						<div class="content">
							<a class="header" href="/sp-Honjaopseoye/boardList/sulBoard.jsp">감성을 자극하는 밤</a>
							<div class="meta">
								<span class="date">혼술 리뷰를 확인해 보세요!</span>
							</div>
						</div>
					</div>
				</div>
				<div class="four wide column">


					<div class="ui card">
						<div class="ui slide masked reveal image"
							style="width: 350px; height: 150px;">
							<img src="/sp-Honjaopseoye/image/gui/i5.jpg" width="300px" height="300px"
								class="visible content"> <img src="/sp-Honjaopseoye/image/gui/i6.jpg"
								width="300px" height="300px" class="hidden content">
						</div>
						<div class="content">
							<a class="header" href="/sp-Honjaopseoye/boardList/nolBoard.jsp">혼자만의 여가 생활</a>
							<div class="meta">
								<span class="date">혼놀 리뷰를 확인해 보세요!</span>
							</div>
						</div>
					</div>


				</div>
				<div class="four wide column">

					<div class="ui card">
						<div class="ui slide masked reveal image"
							style="width: 350px; height: 150px;">
							<img src="/sp-Honjaopseoye/image/gui/i7.jpg" width="300px" height="300px"
								class="visible content"> <img src="/sp-Honjaopseoye/image/gui/i8.jpg"
								width="300px" height="300px" class="hidden content">
						</div>
						<div class="content">
							<a class="header" href="/sp-Honjaopseoye/boardList/nolBoard.jsp">우리들은 하나</a>
							<div class="meta">
								<span class="date">혼족들이 모여 소통할 수 있는 공간</span>
							</div>
						</div>
					</div>

				</div>

				<div class="four wide column" style="padding-top: 5px;">
					<div class="content" style="text-align: left">
						<strong>검증된 혼족들의 맛있는 리뷰</strong> 
						<p></p>
						<div class="meta" style="text-align: left;">
							혼밥이 일상이된 시대 지금
							당신은 혼밥을 즐겨 하시나요?
						</div>
					</div>
				</div>
				<div class="four wide column" style="padding-top: 5px;">
					<div class="content" style="text-align: left">
						<strong>분위기 작살 오늘의 감성 리뷰</strong> 
						<p></p>
						<div class="meta" style="text-align: left;">
							감성을 자극하는 밤!!
							오늘 혼술 한잔 어떠신가요?
						</div>
					</div>
				</div>
				<div class="four wide column" style="padding-top: 5px;">
					<div class="content" style="text-align: left">
						<strong>내가 바로 혼자 놀기의 달인</strong> 
						<p></p>
						<div class="meta" style="text-align: left;">
							심심하신가요? 혼자 놀기의 달인들이
							알려주는 재밌는 꿀팁!!
						</div>
					</div>
				</div>
				<div class="four wide column" style="padding-top: 5px;">
					<div class="content" style="text-align: left">
						<strong>혼밥이 지겨운 그들의 이야기</strong> 
						<p></p>
						<div class="meta" style="text-align: left;">
							혼자하는 생활이 많이 외롭죠?
							이젠 같이 즐기세요~
						</div>
					</div>
				</div>
			</div>
			<!--리뷰들 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
		
		
		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
		
			<div class="ui container" style="margin-top: 50px;">
				<h4 class="ui horizontal divider header" >
 				  <i class="paper plane outline icon"></i>
  					최고의 리뷰
				</h4>
				<p style="text-align: center;margin-bottom: 50px;">
					<font color="red">최고중에 최고만 뽑은 최고 조회수의 리뷰!!!</font><br>
					지금 당장 확인해 보세요!! 당신의 무료했던 일상을 재밌게 바꿔 드릴 수 있습니다.<br>
					<br>
					<strong>“Time crumbles things! everything grows old under the power of Time and is forgotten through the lapse of Time.”</strong>
				</p>
				
				<!-- 최고 리뷰 시작 -->
				<div class="ui grid" align="center" style="text-align: center;padding-left: 35px;">
				<!-- 부분 리뷰  -->
				
				
				<br>
				<br>
				<br>
				
				<h4 class="ui horizontal divider header" >
 				  <i class="thumbs up outline icon"></i>
  					혼밥 Top4 best Review
				</h4>
				<p style="text-align: center;margin-bottom: 50px;">
					<font color="red"> </font><br>
					 <br>
					<br>
				</p>
				
				<!-- 혼밥 for문 -->
				
				<div class="ui four cards"> 

			<%
		List<Map<String, Object>> conBoardBabHitMax = (List<Map<String, Object>>)request.getAttribute("conBoardBabHitMax");
	    for(int i = 0; i < conBoardBabHitMax.size(); i++){
	     	bab_title = conBoardBabHitMax.get(i).get("BAB_TITLE").toString();
		    bab_category = conBoardBabHitMax.get(i).get("BAB_CATEGORY").toString();
		    bab_text = conBoardBabHitMax.get(i).get("BAB_TEXT").toString();
		    bab_hit = conBoardBabHitMax.get(i).get("BAB_HIT").toString();  
		   %>

						<div class="ui card">
							<div class="image">
								<img src="/sp-Honjaopseoye/image/gui/rb<%=i %>.jpg" width="260px" height="170px">
							</div>
							<div class="content">
								<a class="header">제목:&nbsp;<%=bab_title %></a>
								<div class="meta">
									<span class="date">카테고리:&nbsp;<%=bab_category %></span>
								</div>
									<div class="description">
									내용:&nbsp;<%=bab_text %>
									</div>
								</div>
							<div class="extra content">
								<a><i class="heart icon"style="color: red;"></i>
								조회수:&nbsp;<%=bab_hit %>
								</a>
							</div>
						</div>


						<%
							}
						%>

					</div>
				<!-- 혼밥 for문 끝  -->
					
					
				<br>
				<br>
				<br>
				
				<h4 class="ui horizontal divider header" >
 				  <i class="thumbs up outline icon"></i>
  					혼술 Top4 best Review
				</h4>
				<p style="text-align: center;margin-bottom: 50px;">
					<font color="red"> </font><br>
					 <br>
					<br>
				</p>
				
							<!-- 혼술 for문 -->
				
				<div class="ui four cards"> 

			<%
			List<Map<String, Object>> conBoardSulHitMax = (List<Map<String, Object>>)request.getAttribute("conBoardSulHitMax");
			    
			for(int i = 0; i < conBoardSulHitMax.size(); i++){
				
				sul_title = conBoardSulHitMax.get(i).get("SUL_TITLE").toString();
			    sul_category = conBoardSulHitMax.get(i).get("SUL_CATEGORY").toString();
			    sul_text = conBoardSulHitMax.get(i).get("SUL_TEXT").toString();
			    sul_hit = conBoardSulHitMax.get(i).get("SUL_HIT").toString();
			    
		    %>

						<div class="ui card">
							<div class="image">
								<img src="/sp-Honjaopseoye/image/gui/rs<%=i %>.jpg" width="260px" height="170px">
							</div>
							<div class="content">
								<a class="header">제목:&nbsp;<%=sul_title %></a>
								<div class="meta">
									<span class="date">카테고리:&nbsp;<%=sul_category %></span>
								</div>
									<div class="description">
									내용:&nbsp;<%=sul_text %>
									</div>
								</div>
							<div class="extra content">
								<a><i class="heart icon"style="color: red;"></i>
								조회수:&nbsp;<%=sul_hit %>
								</a>
							</div>
						</div>

						<%
							}
						%>

					</div>
				<!-- 혼술 for문 끝  -->
				
				<h4 class="ui horizontal divider header" style="margin-bottom:10px">
 				  <i class="thumbs up outline icon"></i>
  					혼놀 Top4 best Review
				</h4>
				<p style="text-align: center; margin-bottom:50px;">
					<font color="red"> </font><br>
					 <br>
					<br>
				</p>
							<!-- 혼놀 for문 -->
				
				<div class="ui four cards"> 

			<%
		List<Map<String, Object>> conBoardNolHitMax = (List<Map<String, Object>>)request.getAttribute("conBoardNolHitMax");
			    
	    for(int i = 0; i < conBoardNolHitMax.size(); i++){
	    	
	    	nol_title = conBoardNolHitMax.get(i).get("NOL_TITLE").toString();
		    nol_category = conBoardNolHitMax.get(i).get("NOL_CATEGORY").toString();
		    nol_text = conBoardNolHitMax.get(i).get("NOL_TEXT").toString();
		    nol_hit = conBoardNolHitMax.get(i).get("NOL_HIT").toString();
		    %>
						<div class="ui card">
							<div class="image">
								<img src="/sp-Honjaopseoye/image/gui/rn<%=i %>.jpg" width="260px" height="170px">
							</div>
							
							<div class="content">
								<a class="header">제목:&nbsp;<%=nol_title %></a>
								<div class="meta">
									<span class="date">카테고리:&nbsp;<%=nol_category %></span>
								</div>
									<div class="description">
									내용:&nbsp;<%=nol_text %>
									</div>
								</div>
							<div class="extra content">
								<a><i class="heart icon"style="color: red;"></i>
								조회수:&nbsp;<%=nol_hit %>
								</a>
							</div>
						</div>


						<%
							}
						%>

					</div>
				<!-- 혼놀 for문 끝  -->
			
	</div>
	</div>
</div>
</div>
<%@ include file="/include/include/bottom.jsp" %>
</body>
</html>