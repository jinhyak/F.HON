<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%
	  	String smem_name = null;
		List<Map<String, Object>> memList2 = (List<Map<String, Object>>) session.getAttribute("memList");
	if (session.getAttribute("memList") != null) {
		smem_name = memList2.get(0).get("MEM_NAME").toString();
	}
%>
<% 
	String clientId = "rMQSr12DQcrxNQeItZQ5"; //애플리케이션 클라이언트 아이디값";
	String clientSecret = "uu3M2Y2xdg"; //애플리케이션 클라이언트 시크릿값";
	String code = request.getParameter("code"); // 코드
	String state = request.getParameter("state"); // 네이버 상태코드 로그인 성공 / 실패
	String redirectURI = URLEncoder.encode("http://localhost:9100/sp-Honjaopseoye/member/naverLoginCallback.hon", "UTF-8");
	String apiURL;
	apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	apiURL += "client_id=" + clientId;
	apiURL += "&client_secret=" + clientSecret;
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&code=" + code;
	apiURL += "&state=" + state;
	
	String access_token = ""; // 입력한 네이버 아이디가 같으면(로그인 성공시)... 토큰 값을 가져온다
	String refresh_token = ""; // ?ㅇㅋ
	System.out.println("apiURL="+apiURL);
	
		try {
			
		  URL url = new URL(apiURL);
		  HttpURLConnection con = (HttpURLConnection)url.openConnection(); // 네이버 홈페이지 데이터 연결
		  con.setRequestMethod("GET"); // 정보를 get방식으로 가져옴 해당 page에 데이터를 뿌려줄 데이터 저장 set
		  
		  int responseCode = con.getResponseCode(); // page에 데이터를 뿌려줄 연결 데이터 반환 get
		  BufferedReader br; // 알겠어 ㅇㅇ
		  System.out.print("\n");
		  System.out.print("responseCode="+responseCode); // 현재 상태 코드 성공했을때: 200(프로토콜) 404(에러 프로토콜)
		  
		  if(responseCode==200) { // 정상 호출
			  
		    br = new BufferedReader(new InputStreamReader(con.getInputStream())); // 네이버 정보를 받아옴
		    
		  } else {  // 에러 발생
			  
		    br = new BufferedReader(new InputStreamReader(con.getErrorStream())); // 에러 출력
		  
		  }
		  
		  String inputLine; 
		  StringBuffer res = new StringBuffer();
		  
		  while ((inputLine = br.readLine()) != null) { // 바꾸지마라 
			  
		    res.append(inputLine);
		    
		  }
		  
		  br.close();
		  
		  if(responseCode==200) {
			  
		    System.out.println(res.toString());
		    
		  }
		  
		} catch (Exception e) {
			
		  System.out.println(e);
		  
		}
		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
var smem_name = '<%=smem_name%>'
</script>
<%@include file="../../include/include/commonUI.jsp"%>
<title>메인</title>
<style type="text/css">
#titles {
	font-family: Helvetica, sans-serif;
}

#pinkTitles {
   font-family: Malgun Gothic, sans-serif;
   font-weight: bold;
   margin-top: 15px;
   margin-bottom: 15px;
   font-size: 50px;
   color:white;
   text-shadow: 2px 1px 0px #6E6E6E;
}

img {
	margin-bottom: 25px;
}

#geuls {
	font-family: Malgun Gothic, sans-serif;
	font-weight: bold;
	margin-top: 15px;
	margin-bottom: 15px;
	font-size: 12px;
}

#hon {
	font-size: 27px;
	font-weight: bold;
}
</style>

</head>
<% 
			if(smem_name==null || smem_name=="" ){
		%>
<%@ include file="../../include/include/logout_top.jsp"%>
<% 	
			}else {
		%>
<jsp:include page="../../include/include/top.jsp" />
<% 	
			}
		%>
<div style="margin-bottom: 0px;"></div>

<!-- start description -->
<diV>
	<table class="ui table" style="background-color:#e2e2e2; border: 0px; height: 300px;">
		<tbody>
			<tr>
				<td align="center">
					<div class="center aligned">
						<img src="../../image/bg/restaurant.png" width="25px;" height="25px;">
					</div>
					<div align="center" id="hon">혼밥</div>
					<div style="text-align: center" id="geuls" style="font-weight:bold">
						혼밥은 혼자 먹는 밥 또는 그런 행위를 말합니다.<br> 이제는 혼밥이라는 단어가 고유명사화되다시피 했습니다.<br> 혼밥에 관련된 조사를 보면 20대는 특히나 혼밥을 친숙하게 느끼는 것을<br> 확인할 수 있습니다.
					</div>

				</td>
				<td align="center">
					<div class="center aligned">
						<img src="../../image/bg/beer.png" width="35px;" height="35px;">
					</div>
					<div align="center" id="hon">혼술</div>
					<div style="text-align: center" id="geuls" style="font-weight:bold">
						혼술은 혼자 먹는 술 또는 그런 행위를 말합니다.<br> 이제는 혼술이라는 단어가 고유명사화되다시피 했습니다.<br> 혼술에 관련된 조사를 보면 20대는 특히나 혼술을 친숙하게 느끼는 것을<br> 확인할 수 있습니다.
					</div>

				</td>
				<td align="center">
					<div class="center aligned">
						<img src="../../image/bg/happy-children.png" width="35px;" height="35px;">
					</div>
					<div align="center" id="hon">혼놀</div>
					<div style="text-align: center" id="geuls" style="font-weight:bold">
						혼놀은 혼자 노는 것 또는 그런 행위를 말합니다.<br> 이제는 혼놀이라는 단어가 고유명사화되다시피 했습니다.<br> 혼놀에 관련된 조사를 보면 20대는 특히나 혼놀을 친숙하게 느끼는 것을<br> 확인할 수 있습니다.
					</div>

				</td>
			</tr>
		</tbody>
	</table>
</div>

<div style="padding: 50px;"></div>

<div style="background-color:#E0C8C8">
<div align="center" id="pinkTitles" style="padding-top:50px;">What do you Want?</div>
<div class="ui two column grid container" style="padding-top:50px; padding-bottom:100px" >
   <div class="column">
      <div class="ui segment">
         <div class="ui special cards">
            <!-- 카드 1 -->
            <div class="card" style="width: 100%; height: 100%;">
               <div class="blurring dimmable image" style="width: 100%; height: 100%;">
                  <div class="ui dimmer">
                     <div class="content">
                        <div class="center">
                           <div align="center" class="ui inverted button" style="width: 140px; height: 50px; text-align: center" onClick="alone()">혼자 페이지</div>
                        </div>
                     </div>
                  </div>
                  <img src="../../image/bg/honjaPage.jpg" style="width: 100%; height: 100%;">
               </div>
            </div>
            <!-- 카드 1 끝 -->
         </div>
      </div>
   </div>
   <div class="column">
      <div class="ui segment">
         <div class="ui special cards">
            <!-- 카드 2 -->
            <div class="card" style="width: 100%; height: 100%;">
               <div class="blurring dimmable image" style="width:100%; height: 100%;">
                  <div class="ui dimmer">
                     <div class="content">
                        <div class="center">
                           <div align="center" class="ui inverted button" style="width: 140px; height: 50px; text-align: center" onClick="together()">같이 페이지</div>
                        </div>
                     </div>
                  </div>
                  <img src="../../image/bg/modu.jpg" style="width:100%; height: 100%;">
               </div>
            </div>
            <!-- 카드2 끝 -->
         </div>
      </div>
   </div>
</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
   
$('.special.cards .image').dimmer({
     on: 'hover'
   });
   
})


</script>
<script>
var mem_id = '<%=smem_name %>';
	if(mem_id=="null"){
		mem_id = "비회원";
	}
	function alone(){
		location.href="../honja/honja_main.jsp";
	}
</script>

<div style="margin-top:0px;"></div>


<%@ include file="../../include/include/bottom.jsp"%>
</body>
</html>