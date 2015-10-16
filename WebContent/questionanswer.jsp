<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<title>Student's Site</title>
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
	
	.qvote{
		display:block;
		float:left;
		height:75;
		width:25;
		text-align:center;
	}
	.qtext{
		font-family:Arial, Helvetica, sans-serif;
		font-size:100%;
		line-height:1em;
		margin:5px 0px 0px 20px;
		font-weight:bold;
		display:block;
		float:left;
		width:600;
		text-align:center;
	}
	.atext{
		font-family:Arial, Helvetica, sans-serif;
		font-size:100%;
		line-height:1em;
		margin:-25px 0px 0px 20px;	
		display:block;
		float:left;
	//	height:75;
		width:600;
		text-align:center;
	}
	.atext1{
		font-family:Arial, Helvetica, sans-serif;
		font-size:100%;
		line-height:1em;
		margin:-25px 0px 0px 20px;
		display:block;
		float:left;
		width:600;
		text-align:center;
	}
	
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

<body>
<%@ page import="java.sql.*,java.io.*,java.util.*, javax.servlet.*,java.text.*"%>
<div class="wrap">
  <header>
    <div class="container">
      <h1><a href="#">Student's site</a></h1>
      <form action="#" id="search-form">
        <fieldset>
          <div class="rowElem">
            <input type="text">
            <a href="#">Search</a></div>
        </fieldset>
      </form>
      <label for="username">Hello <%=session.getAttribute("userid")%> </label>
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
    <p><h3>Question</h3></p>
 
<% 
String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
Connection conn = null;
Statement stmt = null;
ResultSet rs =null;
String user ="system" ;
String passwd ="9422046995";
int qid=Integer.parseInt(request.getParameter("qid"));
int guestflag=0;
if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "" || session.getAttribute("userid").equals("guest"))) 
guestflag=1;
try {
 Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
 conn = DriverManager.getConnection(jdbcURL,user,passwd);
 stmt = conn.createStatement();

	rs=stmt.executeQuery("select * from question where qid="+qid);
	%><div id="list" >
	<% 
	while(rs.next())
    {
    	%>
    	<table>
    	<tr>
    	<td>
    	<div class="qvote">
    	<% if(guestflag==0){%>
    	<a href="vote.jsp?type=question&id=<%=rs.getInt("qid") %>&vote=up" >
    	<img alt="up" src="images/up.ico" height=25 width=25/>
    	</a>
    	<%} %>
    	<br>
    	<label>
    	<%=rs.getInt("qrating") %>
    	</label>
    	<br>
    	<% if(guestflag==0) {%>
    	<a href="vote.jsp?type=question&id=<%=rs.getInt("qid") %>&vote=down" >
    	<img alt="down" src="images/down.ico" height=25 width=25/>
    	</a>
    	</div>
    	<%} %>
    	</td>
    	<td>
    	<pre><span class="qtext"><%=rs.getString("qtext") %></span></pre>
    	</td>
    	</tr>
    	</table>
    	<br>
    	<br>
    	<p><h3>Answers</h3></p>
    	<table>
    	<%
    }
    rs.close();
    rs=stmt.executeQuery("select * from answer where qid="+qid+"order by arating desc ");
    while(rs.next())
    {
    	%>
    	<tr>
    	<td> 
    	<div class="qvote">
    	<%if(guestflag==0) {%>
    	<a href="vote.jsp?type=answer&id=<%=rs.getInt("aid") %>&vote=up" >
    	<img alt="up" src="images/up.ico" height=25 width=25/>
    	</a>
    	<%} %>
    	<br>
    	<label>
    	<%=rs.getInt("arating") %>
    	</label>
    	<br>
    	<%if(guestflag==0) {%>
    	<a href="vote.jsp?type=answer&id=<%=rs.getInt("aid") %>&vote=down" >
    	<img alt="down" src="images/down.ico" height=25 width=25/>
    	</a>
    	<%} %>
    	</div>
    	</td>
    	<td width="500px">
    	<pre>
    	<%if(guestflag==1)
			{%><span class="atext1"> <br>
		<%}else{%>
    	<span class="atext">
		<%} %>
		<%=rs.getString("atext") %></span></pre>
		</td>
		<td style="padding-top: 15px">
		<%=rs.getString("email") %>
		</td>
		</tr>
    	<%
    }
    %>
    </table>
    <br>
    <br>
    <%
		   if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "" || session.getAttribute("userid").equals("guest"))) 
		   {
			   		%><div class="button">
			   		<a href="login1.html"> To add New Answer login</a>
					</div>
			<%
		   }
		   else
		   {
			%><p>Add new answer</p>
    			<form action="answer.jsp?qid=<%=qid %>" method="post">
    			<textarea rows="5" cols="100" name="answer"></textarea>
    			<input type="submit" value="submit">
    			</form>
			<%
		   }
		%>
    
    
    <%
} catch(Exception ex)	
{
	ex.printStackTrace();
}
finally{
		conn.close();
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