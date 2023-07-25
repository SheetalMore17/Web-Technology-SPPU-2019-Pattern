<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="javax.websocket.Session"%>
<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.io.*"
    import="java.sql.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String uname,pass;
uname=request.getParameter("uname");
pass=request.getParameter("pass");
try{
Class.forName("com.mysql.cj.jdbc.Driver");
//Class.forName("com.mysql.jdbc.Driver");  
//Connection con=DriverManager.getConnection("jdbc:mysql://10.10.10.54/TE3217db","TE3217","TE3217");
Connection con = null;
	con = DriverManager.getConnection("jdbc:mysql://localhost/test?useSSL=false","root","ac21");
   Statement st =  con.createStatement();
   
  
   
   
   ResultSet rs = null;
   String query="Select *,count(*) as cnt from login where id='"+uname+"' and pass='"+pass+"'";
   
    rs=st.executeQuery(query);
   rs.next();
   if(rs.getInt("cnt")==1){
       out.print("<h1>Login Successful.</h1>");
       session.setAttribute("uname", uname);
       session.setAttribute("pass", pass);
       response.sendRedirect("Home.jsp");
   }
   else
   {
	   out.println("<script>alert('Login Unsuccessful'); window.location.href = 'Login.html';</script>");
	   
	   //response.sendRedirect("Login.html");
	   //out.println("Login-Unsuccessful");
	   //RequestDispatcher rd=request.getRequestDispatcher("/Login.html");  
       //rd.include(request, response);  
   }
   					con.close();			
}
catch(Exception e){
   e.printStackTrace();
}
%>


</body>
</html>