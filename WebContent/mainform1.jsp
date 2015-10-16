<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	.header {
		background:url(../images/tail-middle.jpg) repeat-y center 194px;
		min-width:940px;
	}
	.header .container {
		height:194px;
		position:relative;
		padding:0;
	}
	#list
	{
		display: block;
		width : 400;
		float: right;
		margin: 100px 0px 0px 350 px;
	}
	.menu
	{
		display : block;
		float: left;
		width: 50px;
	}
	a:link{
           color: blue;
       }
       a:hover{
           color:green;
       }
       a:active{
           color:gray;
       }
       label{
       		float:right;
       }
      body {
				font-family: Arial, Verdana, sans-serif;
				font-size: 90%;
				color: #666;
				//background-color: #f8f8f8;}
			li {
				list-style-image: url("images/icon-plus.png");
				line-height: 1.6em;}
			table {
				border-spacing: 0px;}
			th, td {
				padding: 5px 30px 5px 10px;
				border-spacing: 0px;
				font-size: 90%;
				margin: 0px;}
			th, td {
				text-align: left;
				background-color: #e0e9f0;
				border-top: 1px solid #f1f8fe;
				border-bottom: 1px solid #cbd2d8;
				border-right: 1px solid #cbd2d8;}
			tr.head th {
				color: #fff;
				background-color: #90b4d6;
				border-bottom: 2px solid #547ca0;
				border-right: 1px solid #749abe;
				border-top: 1px solid #90b4d6;
				text-align: center;
				text-shadow: -1px -1px 1px #666666;
				letter-spacing: 0.15em;}
			td {
				text-shadow: 1px 1px 1px #ffffff;}
			tr.even td, tr.even th {
				background-color: #e8eff5;}
			tr.head th:first-child {
				-webkit-border-top-left-radius: 5px;
				-moz-border-radius-topleft: 5px;
				border-top-left-radius: 5px;}
			tr.head th:last-child {
				-webkit-border-top-right-radius: 5px;
				-moz-border-radius-topright: 5px;
				border-top-right-radius: 5px;}
			fieldset {
				width: 310px;
				margin-top: 20px;
				border: 1px solid #d6d6d6;
				background-color: #ffffff;
				line-height: 1.6em;}
			legend {
				font-style: italic;
				color: #666666;}
			input[type="text"] {
				width: 120px;
				border: 1px solid #d6d6d6;
				padding: 2px;
				outline: none;}
			input[type="text"]:focus,
			input[type="text"]:hover {
				background-color: #d0e2f0;
				border: 1px solid #999999;}
			input[type="submit"] {
				border: 1px solid #006633;
				background-color: #009966;
				color: #ffffff;
				border-radius: 5px;
				padding: 5px;
				margin-top: 10px;}
			input[type="submit"]:hover {
				border: 1px solid #006633;
				background-color: #00CC33;
				color: #ffffff;
				cursor: pointer;}
			.title {
				float: left;
				width: 160px;
				clear: left;}
			.submit {
				width: 310px;
				text-align: right;}
</style>

</head>
<body>
			<%@ page import="java.sql.*,java.io.*,java.util.*, javax.servlet.*,java.text.*"%>
	
	<div class="header" >
	
	<a href="frontpage.jsp">
	<img src="images/logo.jpg" alt="Students site" width="456" height="80" />
	</a>
	<label for="username">Hello <%=session.getAttribute("userid")%> </label>
	<%
	if(session.getAttribute("userid").equals("guest") || session.getAttribute("userid") == null);
	else 
	{
		%>
			<a href="logout.jsp"><button>Logout</button></a>
	<%
	}
	%>
	
	</div>
	<div class="menu">
	<table width="340" border="0">
				<tr class="head">
				<th>Categories</th>
				</tr>
				<tr>
				<td><a href="frontpage.jsp">Home</a> </td>
				</tr>
				
				<tr>
				<td><a href="mainform.jsp?myVar=admissions&page=1 "> Admissions</a> </td>
				</tr>
				<tr>
				<td><a href="mainform.jsp?myVar=campus&page=1"> Campus</a> </td>
				</tr>
				<tr>
				<td><a href="mainform.jsp?myVar=academics&page=1"> Academics</a> </td>
				</tr>
				<tr>
				<td><a href="mainform.jsp?myVar=placements&page=1"> Placement</a> </td>
				</tr>
				<tr>
				<td><a href="mainform.jsp?myVar=programming&page=1"> Programming</a> </td>
				</tr>
				<tr>
				<td><a href="mainform.jsp?myVar=exams&page=1"> Examinations</a> </td>
				</tr>
				<tr>
				<td><a href="mainform.jsp?myVar=information tech&page=1"> Information Technology</a> </td>
				</tr>
				<tr>
				<td><a href="mainform.jsp?myVar=entc&page=1"> E &amp; TC</a> </td>
				</tr>
				<tr>
				<td><a href="mainform.jsp?myVar=comp&page=1"> Computer Science</a> </td>
				</tr>
				
				
	</table>			
	</div>
	
	
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

	rs=stmt.executeQuery("select * from ( select qid,qtext,qtimestamp,qrating,email,cname,rownum as rn from question where cname='"+myvar+"') where rn > ("+pageno+"-1) * 10 and rn <= "+pageno+" * 10");

	//int[] qid;
	
	
	%>
	<div id="list" >
	
	<table  width=800 >
	 	<tr class="head">
	 	<th>ID</th>
	 	<th>Question</th>
	 	<th>Date</th>
	 	<th>Rating</th>
	 	<th>Email</th>
	 	</tr>
	<%
	for(int i=0;rs.next();i++)
	 {
		
		int qid=rs.getInt("qid");
		String choice="even";
		 String qtext = rs.getString("qtext");
		 String qtimestamp = rs.getString("qtimestamp");
		 String qrating = rs.getString("qrating");
		 String email = rs.getString("email");
		 String cname = rs.getString("cname");
		 
		if(i%2==0){
		 %>
		 <tr class="even">
		 <%
		}else{
		 %>
		 <tr>
		 <%} %>
		
		 <td>
		 <a href="questionanswer.jsp?qid=<%=qid%>"><% out.print(qid); %> 
		 </a>
		 </td>
		 <td><% out.print(qtext); %></td>
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
	<a  href="mainform.jsp?myVar=<%=myvar%>&page=<%=pageno-1%>">prev</a>
	<%} %>
<a  href="mainform.jsp?myVar=<%=myvar%>&page=<%=pageno+1%>">Next</a>

	<%
		   if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "" || session.getAttribute("userid").equals("guest"))) 
		   {
			   		%><a href="login.html"><button>Add Question</button></a>
			<%
		   }
		   else
		   {
			%><a href="question.jsp?myVar=<%=myvar%>"><button>Add Question</button></a>
			<%
		   }
		%>

</div>


</body>
</html>