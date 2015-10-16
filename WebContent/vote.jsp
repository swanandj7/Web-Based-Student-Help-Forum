<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="java.sql.*,java.io.*,java.util.*, javax.servlet.*,java.text.*"%>
	
<% 
String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
Connection conn = null;
Statement stmt = null;
Statement stmta = null;
ResultSet rs =null;
ResultSet rsa = null;
String user ="system" ;
String passwd ="9422046995";
int flag=0,count=0;


String vote = request.getParameter("vote");
String email = session.getAttribute("userid").toString();

try {
 Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
 conn = DriverManager.getConnection(jdbcURL,user,passwd);
 stmt = conn.createStatement();
int id=Integer.parseInt(request.getParameter("id"));
int temp=id;
String type = request.getParameter("type");
if(type.equals("answer"))
{
	rs=stmt.executeQuery("select qid from answer where aid="+id);
	rs.next();
	temp=rs.getInt("qid");
}

%>
<meta http-equiv="refresh" content="0; url=questionanswer.jsp?qid=<%= temp %>">
<title>Insert title here</title>
</head>
<body>
<% 
	if(type.equals("question") )
	{
		rs = stmt.executeQuery("select flag from qvote where email='"+email+"' and qid="+id);
		//System.out.println(rs.next());
		while(rs.next())
		{
			flag = rs.getInt("flag");
		}
		rsa = stmt.executeQuery("select count(*) as c from qvote where email='"+email+"' and qid="+id);
		while(rsa.next())
		{
			count = rsa.getInt("c");
		}
		rs.close();
		rsa.close();
		System.out.println(flag);
		System.out.print(count);
		if(vote.equals("up") ) // && rs.next()==false)
		{
			//System.out.println(rs.next());
			if(count == 0)
			{
				//rs.close();
				rs=stmt.executeQuery("insert into qvote values("+id+",'"+email+"',1)");
				rs=stmt.executeQuery("update question set qrating = qrating + 1 where qid="+id);
			}
			else if(flag == -1)
			{
				//rs.close();
				rs=stmt.executeQuery("update qvote set flag = 0 where qid="+id+" and email ='"+email+"'");	
				rs=stmt.executeQuery("update question set qrating = qrating + 1 where qid="+id);
			}
			else if(flag == 0)
			{
				//rs.close();
				rs=stmt.executeQuery("update qvote set flag = 1 where qid="+id+" and email ='"+email+"'");	
				rs=stmt.executeQuery("update question set qrating = qrating + 1 where qid="+id);
			}
		}

		if(vote.equals("down") ) // && rs.next()==false)
		{
			if(count == 0)
			{
				//rs.close();
				rs=stmt.executeQuery("insert into qvote values("+id+",'"+email+"',-1)");
				rs=stmt.executeQuery("update question set qrating = qrating - 1 where qid="+id);
			}
			else if(flag == 1)
			{
				//rs.close();
				rs=stmt.executeQuery("update qvote set flag = 0 where qid="+id+" and email ='"+email+"'");	
				rs=stmt.executeQuery("update question set qrating = qrating - 1 where qid="+id);
			}
			else if(flag == 0)
			{
				//rs.close();
				rs=stmt.executeQuery("update qvote set flag = -1 where qid="+id+" and email ='"+email+"'");	
				rs=stmt.executeQuery("update question set qrating = qrating - 1 where qid="+id);
			}
		}
		rs.close();
	}
	else
	{
		rs = stmt.executeQuery("select flag from avote where email='"+email+"' and aid="+id);
		//System.out.println(rs.next());
		while(rs.next())
		{
			flag = rs.getInt("flag");
		}
		rsa = stmt.executeQuery("select count(*) as c from avote where email='"+email+"' and aid="+id);
		while(rsa.next())
		{
			count = rsa.getInt("c");
		}
		rs.close();
		rsa.close();
		System.out.println(flag);
		System.out.println(count);
		if(vote.equals("up") ) // && rs.next()==false)
		{
			//System.out.println(rs.next());
			if(count == 0)
			{
				//rs.close();
				rs=stmt.executeQuery("insert into avote values("+id+",'"+email+"',1)");
				rs=stmt.executeQuery("update answer set arating = arating + 1 where aid="+id);
			}
			else if(flag == -1)
			{
				//rs.close();
				rs=stmt.executeQuery("update avote set flag = 0 where aid="+id+" and email ='"+email+"'");	
				rs=stmt.executeQuery("update answer set arating = arating + 1 where aid="+id);
			}
			else if(flag == 0)
			{
				//rs.close();
				rs=stmt.executeQuery("update avote set flag = 1 where aid="+id+" and email ='"+email+"'");	
				rs=stmt.executeQuery("update answer set arating = arating + 1 where aid="+id);
			}
		}

		if(vote.equals("down") ) // && rs.next()==false)
		{
			if(count == 0)
			{
				//rs.close();
				rs=stmt.executeQuery("insert into avote values("+id+",'"+email+"',-1)");
				rs=stmt.executeQuery("update answer set arating = arating - 1 where aid="+id);
			}
			else if(flag == 1)
			{
				//rs.close();
				rs=stmt.executeQuery("update avote set flag = 0 where aid="+id+" and email ='"+email+"'");	
				rs=stmt.executeQuery("update answer set arating = arating - 1 where aid="+id);
			}
			else if(flag == 0)
			{
				//rs.close();
				rs=stmt.executeQuery("update avote set flag = -1 where aid="+id+" and email ='"+email+"'");	
				rs=stmt.executeQuery("update answer set arating = arating - 1 where aid="+id);
			}
		}
		rs.close();
		
	}

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