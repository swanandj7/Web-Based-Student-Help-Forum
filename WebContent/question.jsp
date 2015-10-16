<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Question</title>
<script type="text/javascript">
function validateForm()
{
	var x = document.forms["myform"]["question"].value;
	if(x==null||x=="")
	{
		alert("Question must be filled out.");
		return false;
	}	
}
</script>
</head>
<body>
		<%String myvar=request.getParameter("myVar"); %>
		<form action="questionhandler.jsp?myVar=<%=myvar%>" name="myform" method="post" onsubmit="return validateForm()">
		<textarea rows="5" cols="100" name="question"></textarea>
		<input type="submit" value="submit">
		</form>
</body>
</html>