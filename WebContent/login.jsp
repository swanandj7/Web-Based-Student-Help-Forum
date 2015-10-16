<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("username");    
    String pwd = request.getParameter("password");
    String answer = request.getParameter("answer"); 
	String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs =null;
	String user ="system" ;
	String passwd ="9422046995";

	try{
	 Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
	 conn = DriverManager.getConnection(jdbcURL,user,passwd);
	 stmt = conn.createStatement();
    
    rs = stmt.executeQuery("select * from user1 where email='" + userid + "' and password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
       %>
       <script type="text/javascript">
       alert("hello");
       </script>
       <%
       response.sendRedirect("frontpage.jsp");

    } else {
        out.println("Invalid password <a href='login1.html'>try again</a>");
    }
	}catch ( Exception ex)
	{
		ex.printStackTrace();
	}
	finally
	{
		
		conn.close();
	}
%>
</body>
</html>