<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Student's Site</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<style type="text/css">
.button  a {
	text-transform:uppercase;
	color:#fff;
	text-decoration:none;
	float:left;
	background-color:#0087c1;
	padding:5px 5px 0 5px;
	height:22px;
}
.button a:hover {
	background-color:#47b6e5;
}

</style>

</head>
<body id="page1">
<%@ page import="java.sql.*,java.io.*,java.util.*, javax.servlet.*,java.text.*"%>
	
	
<!-- START PAGE SOURCE -->
<div class="wrap">
  <header>
    <div class="container">
      <h1><a href="#">Student's site</a></h1>
      <form action="#" id="search-form">
        <fieldset>
          <div class="rowElem">
            <label for="username">Hello <%=session.getAttribute("userid")%> </label>
			 <%
	         if(session.getAttribute("userid").equals("guest") || session.getAttribute("userid") == null)
            		{
			%>
			<a href="login1.html">Login</a>
			<%
            		}else 
			{
				%>
			<a href="logout.jsp">Logout</a>
			<%
			}
		%>
        </fieldset>
      </form>
     
    </div>
  </header>
  <div class="container">
    <aside>
      <h3>Categories</h3>
      <ul class="categories">
         <li><span><a href="frontpage.jsp">Home</a></span></li>
        <li><span><a href="mainform.jsp?myVar=admissions&page=1">Admissions</a></span></li>
        <li><span><a href="mainform.jsp?myVar=campus&page=1">Campus</a></span></li>
        <li><span><a href="mainform.jsp?myVar=academics&page=1">Academics</a></span></li>
        <li><span><a href="mainform.jsp?myVar=placements&page=1">Placements</a></span></li>
        <li><span><a href="mainform.jsp?myVar=programming&page=1">Programming</a></span></li>
        <li><span><a href="mainform.jsp?myVar=exams&page=1">Examinations</a></span></li>
        <li><span><a href="mainform.jsp?myVar=it&page=1">Information Technology</a></span></li>
        <li><span><a href="mainform.jsp?myVar=entc&page=1"> E &amp; TC</a></span></li>
        
        <li class="last"><span><a href="mainform.jsp?myVar=comp&page=1">Computer Science</a></span></li>
      </ul>
 
    </aside>
    
    <section id="content">
    
        		
<% 
String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
Connection conn = null;
Statement stmt = null;
ResultSet rs =null;
String user ="system" ;
String passwd ="9422046995";
String myvar=request.getParameter("myVar");
int pageno=Integer.parseInt(request.getParameter("page"));
try {
 Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
 conn = DriverManager.getConnection(jdbcURL,user,passwd);
 stmt = conn.createStatement();

	rs=stmt.executeQuery("select * from ( select qid,qtext,qtimestamp,qrating,email,cname,rownum as rn from question where cname='"+myvar+"' order by qtimestamp desc) where rn > ("+pageno+"-1) * 10 and rn <= "+pageno+" * 10");

	//int[] qid;
	
	
	%>
	<div id="list" >
	
	<table  style="width:100%" >
		<col width="500">
		<col width="1000">
		<col width="100">
		<col width="300">
	 	<tr class="head" height=50>
	 	<td><b>QUESTION</b></td>
	 	<td><b>DATE</b></td>
	 	<td><b>RATING</b></td>
	 	<td><b>EMAIL</b></td>
	 	</tr>
	<%
	for(int i=0;rs.next();i++)
	 {
		
		int qid=rs.getInt("qid");
		String choice="even";
		 String qtext = rs.getString("qtext");
		 String qtimestamp = rs.getString("qtimestamp").substring(0, 19);
		 String qrating = rs.getString("qrating");
		 String email = rs.getString("email");
		 String cname = rs.getString("cname");
		 if(qtext.length()>28)
			 qtext=qtext.substring(0, 28);
		if(i%2==0){
		 %>
		 <tr class="even" height=50>
		 <%
		}else{
		 %>
		 <tr height=50>
		 <%} %>
		
		 <td>
		 <a href="questionanswer.jsp?qid=<%=qid%>">  <% out.print(qtext); %></a></td>
		 <td><% out.print(qtimestamp); %></td>
		 <td><% out.print(qrating); %></td>
		 <td><% out.print(email); %></td>
		 </tr>
		 <%
		
	 }

} catch(Exception ex)	
{
	ex.printStackTrace();
}
finally{
		conn.close();
}

%>
</table>
<% if(pageno>1)
	{%>
	<div class="button">
	<a  href="mainform.jsp?myVar=<%=myvar%>&page=<%=pageno-1%>">&lt; &lt; </a>
	</div>
	<label width="5px"></label>
	<%} %>
<div class="button">
<a  href="mainform.jsp?myVar=<%=myvar%>&page=<%=pageno+1%>">&gt; &gt;</a>
</div>
<br>
<br>
	<%
		   if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "" || session.getAttribute("userid").equals("guest"))) 
		   {
			   		%><div class="button">
			   		<a href="login1.html">Add Question</a>
			   		</div>
			<%
		   }
		   else
		   {
			%><div class="button">
			<a href="question.jsp?myVar=<%=myvar%>">Add Question</a>
			</div>
			<%
		   }
		%>

</div>

    </section>
  </div>
</div>
<footer>
  <div class="footerlink">
<div style="clear:both;"></div>
  </div>
</footer>
<script type="text/javascript"> Cufon.now(); </script>
<!-- END PAGE SOURCE -->
<div align=center></div></body>
</html>
