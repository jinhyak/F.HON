
<%
	Cookie[] cookies = request.getCookies();
	System.out.print(cookies);
	if (cookies != null && cookies.length > 0) {
		for (int i = 0; i < cookies.length; i++) {
			if(cookies[i].getName().equals("name")){
				Cookie cookie = new Cookie("name","");
				cookie.setMaxAge(0);
			response.addCookie(cookie);
			}
		}
	}
	session.invalidate();
	response.sendRedirect("../../main/main/main.jsp");
%>
