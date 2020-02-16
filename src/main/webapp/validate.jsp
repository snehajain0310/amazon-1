<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" errorPage="MyErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!
	Connection con=null;
    public Connection getConnection() throws Exception
    {
    	
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//step-2
		 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb", 
				"student", "student");
		
    	return con;
    }

%>

Connection is <%=getConnection() %>
<%
	con=getConnection();

	PreparedStatement ps=con.prepareStatement("insert into passwd values(?,?)");
	ps.setString(1,request.getParameter("username"));
	ps.setString(2,request.getParameter("password"));
	int i=ps.executeUpdate();
	System.out.println("No of record inserted are "+i);
%>
	
</body>
</html>
