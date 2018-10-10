<%@page trimDirectiveWhitespaces="true" %>
<%
String result = (String)request.getAttribute("result");
out.print(result);
%>