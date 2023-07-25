<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires",0);
if(session.getAttribute("uname")==null)
{
	response.sendRedirect("Login.html");	
}
else
{
	out.println("<h1>Hello "+session.getAttribute("uname")+"</h1>");
}
//String uname=(String)session.getAttribute("uname");
//out.println("hello "+uname);
%>
<a href="logout.jsp">Log OUT!</a>

</body>
</html>
