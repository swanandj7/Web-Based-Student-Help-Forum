<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String qid=request.getParameter("qid");
%>
<meta http-equiv="refresh" content="0; url=questionanswer.jsp?qid=<%= qid %>">
<title>Question</title>
</head>
<body>
		
		<%@ page import="java.sql.*,java.io.*,java.util.*, javax.servlet.*,java.text.*"%>
	<% 
	 
	
	String answer = request.getParameter("answer"); 
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
	rs=stmt.executeQuery("select count(*) as c from answer");
	int id=1;
	while(rs.next())
	{
	id=rs.getInt("c")+1;
	}
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	Calendar cal = Calendar.getInstance();
	String date=dateFormat.format(cal.getTime());
	stmt.executeQuery("Insert into answer VALUES ("+id+",'"+answer+"',TO_DATE('"+date+"','YYYY/MM/DD HH24:MI:SS'),1,'"+session.getAttribute("userid")+"',"+qid+")");
		
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