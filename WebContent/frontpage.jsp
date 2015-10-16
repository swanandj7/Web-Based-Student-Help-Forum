<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<%
		   if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) 
		   {
				session.setAttribute("userid","guest");
		   }
		%>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Home</title>
		<style type="text/css">
			body{
				 //  height:100%;
				 //  width:100%;
   				background-image:url(images/pictback.jpg);/*your background image*/  
   				background-repeat:no-repeat;/*we want to have one single image not a repeated one*/  
   				background-size:cover;/*this sets the image to fullscreen covering the whole screen*/  

				color: #665544;
				font-family: Georgia, "Times New Roman", serif;
				text-align: center;}
			.wrapper {
				width: 720px;
				margin: 0px auto;}
			.header {	
			margin: 40px 0px 20px 0px;}
			.entry {
				
				width: 220px;
				float: left;
				margin: 10px;
				height: 198px;
				//background-image: url("images/shadow.png");
				background-repeat: no-repeat;
				background-position: bottom;}
			figure {
				display: block;
				width: 202px;
				height: 170px;
				background-color: black;
				padding: 9px;
				text-align: left;}
			figure img {
				width: 200px;
				height: 150px;
				border: 1px solid #d6d6d6;}
			figcaption {
				background-image: url("images/icon.png");
				padding-left: 20px;
				background-repeat: no-repeat;}
		</style>
	</head>
	<body>
		<p> Hello <%=session.getAttribute("userid") %>,</p>
		<a href="login1.html"><button>Log in</button></a>
		<a href="signup.html"><button>Sign up</button></a>
		<div class="wrapper">
			
			<div class="entry">
				<figure>
				<a href="mainform.jsp?myVar=admissions&page=1">
				<img src="images/print.jpg" alt="admissions" />
				</a>	
				<figcaption>Admissions</figcaption>
				</figure>
			</div>
			
			<div class="entry">
				<figure>
				<a href="mainform.jsp?myVar=campus&page=1">
				<img src="images/campus.jpg" alt="campus" />
				</a>
					<figcaption>Campus Life</figcaption>
				</figure>
			</div>
			<div class="entry">
				<figure>
				<a href="mainform.jsp?myVar=academics&page=1">
				<img src="images/academics.jpg" alt="academics " />
				</a>	
					<figcaption>Academics</figcaption>
				</figure>
			</div>
			<div class="entry">
				<figure>
				<a href="mainform.jsp?myVar=placements&page=1">
				<img src="images/placement.png" alt="placement" />
				</a>
					<figcaption>Placements</figcaption>
				</figure>
			</div>
			<div class="entry">
				<figure>
				<a href="mainform.jsp?myVar=programming&page=1">
				<img src="images/pl.jpg" alt="Programming" />
				</a>	
					<figcaption>Programming Languages</figcaption>
				</figure>
			</div>
			<div class="entry">
				<figure>
				<a href="mainform.jsp?myVar=exams&page=1">
				<img src="images/exam.jpg" alt="exams" />
				</a>	
					<figcaption>Examination</figcaption>
				</figure>
			</div>
			<div class="entry">
				<figure>
				<a href="mainform.jsp?myVar=it&page=1">
				<img src="images/it.jpg" alt="Information Tech" />
				</a>	
					<figcaption>Information Technology</figcaption>
				</figure>
			</div>
				<div class="entry">
				<figure>
				<a href="mainform.jsp?myVar=entc&page=1">
				<img src="images/entc.jpg" alt="entc" />
				</a>	
					<figcaption>E &amp; TC</figcaption>
				</figure>
			</div>
			<div class="entry">
				<figure>
				<a href="mainform.jsp?myVar=comp&page=1">
				<img src="images/cs.jpg" alt="comp" />
				</a>	
					<figcaption>Computer</figcaption>
				</figure>
			</div>
			
		</div>
	</body>
</html>
