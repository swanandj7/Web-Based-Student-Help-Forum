<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forum-SignUp</title>
</head>
<body>
		
		<%@ page import="java.sql.*,java.io.*,java.util.*, javax.servlet.*"%>
	<% 
	String name = request.getParameter("firstname") + " "+request.getParameter("lastname");
	String pass = request.getParameter("pass");
	String email = request.getParameter("email");
	String contact = request.getParameter("contact");
	String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs =null;
	String user ="system" ;
	String passwd ="9422046995";

	try {
	 Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
	 conn = DriverManager.getConnection(jdbcURL,user,passwd);
	 stmt = conn.createStatement();
		stmt.executeQuery("Insert into user1 VALUES ('"+name+"','"+email+"','"+pass+"','"+contact+"',0)");
		session.setAttribute("userid", email);
		 response.sendRedirect("frontpage.jsp");
		
	} catch(Exception ex)
	{
		ex.printStackTrace();
	}
	finally{
		
		conn.close();
	}
	
	%>
</body>
</html>