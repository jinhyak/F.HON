<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

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
<%@include file="../../include/include/commonUI.jsp" %>
<title>메인</title>
</head>
<body>
		<% 
			if(smem_name==null || smem_name=="" ){
		%>	
			<%@ include file="../../include/include/logout_top.jsp" %>
		<% 	
			}else {
		%>
			<%@ include file="../../include/include/top.jsp" %>
		<% 	
			}
		%>
<div class="ui two column stackable grid" style="height:850px">
    <div class="column">
		<a  id="btn1" href="../honja/honja_main.jsp" style="width:100%; height:100%;"><img src="../../image/person.PNG" style="width:100%; height:100%;"></a>
    </div>
    <div class="column">
 		 <a id="btn2" href="../together/together_main.jsp" style="width:100%; height:100%;"><img src="../../image/with.jpg"style="width:100%; height:100%;"></a>
    </div>
</div>
<!--  -->

<%@ include file="../../include/include/bottom.jsp" %>
</body>
</html>