<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String myvar=request.getParameter("myVar");
%>
<meta http-equiv="refresh" content="0,url=mainform.jsp?myVar=<%= myvar %>&page=1">
<title>Question</title>
</head>
<body>
		
		<%@ page import="java.sql.*,java.io.*,java.util.*, javax.servlet.*,java.text.*"%>
	<% 
	String userid= session.getAttribute("userid").toString();
	String question = request.getParameter("question"); 
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
	rs=stmt.executeQuery("select count(*) as c from question");
	int id=9;
	while(rs.next())
	{
	id=rs.getInt("c")+1;
	}
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss ");
	Calendar cal = Calendar.getInstance();
	String date=dateFormat.format(cal.getTime());
	if (userid == null || userid.equals("")|| userid.equals("guest"))
	{
	       %>
	       <script type="text/javascript">
	       alert("Error man pls get login from main form");
	       </script>
	       <a href="login1.html"><button>Login</button></a>
	       <%
	}
	else
	   stmt.executeQuery("Insert into question VALUES ("+id+",'"+question+"',TO_DATE('"+date+"','YYYY/MM/DD HH24/MI/ss'),1,'"+userid+"','"+myvar+"')");
		
	} catch(Exception ex)
	{
		ex.printStackTrace();
	}
	finally{
		conn.close();
	}
	
	%>
	<a href="mainform.jsp?myVar=<%=myvar%>&page=1"><button>Home</button></a>
</body>
</html>