<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.text.*" isELIgnored="false"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Successful Page</title>
<style> @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap'); * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Poppins', sans-serif; } body { min-height: 100vh; background: #111; color: white; display: flex; justify-content: center; align-items: center; } /* Success Card */ div { width: 90%; max-width: 600px; background: #1c1c1c; padding: 50px 40px; border-radius: 18px; text-align: center; border: 1px solid #333; box-shadow: 0 15px 40px rgba(0, 0, 0, 0.6); } /* Success Heading */ h1 { color: #00bfff; font-size: 28px; font-weight: 600; letter-spacing: 1px; margin-bottom: 30px; } /* Button */ button { background: #00bfff; color: white; border: none; padding: 13px 30px; border-radius: 8px; font-size: 16px; font-weight: 500; cursor: pointer; transition: all 0.3s ease; } /* Button Hover */ button:hover { background: #008fcc; transform: translateY(-2px); box-shadow: 0 8px 20px rgba(0, 191, 255, 0.3); } /* Button Click */ button:active { transform: translateY(0); } </style>

</head>
<body>

 
<% String fName=request.getParameter("firstname");
String lName=request.getParameter("lastname");
String age=request.getParameter("age");
String dept=request.getParameter("department");
String phNo=request.getParameter("phonenumber");
String Join_date=request.getParameter("Join_date");

Date jDate=null;
	Date d=null;
	SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd'T'hh:mm"); 
	try
	{
		d=formatter.parse(Join_date);
		jDate=d;
	}
	catch(ParseException e)
	{
		e.printStackTrace();
	}

%>

<c:set var="jDate" value="<%=jDate%>"></c:set>
<c:set var="fName" value="<%=fName %>"/>
<c:set var="lName" value="<%=lName%>"/>
<c:set var="phNo" value="<%=phNo%>"/>
<c:set var="age" value="<%=Integer.parseInt(age) %>"></c:set>
<c:set var="department" value="<%=Integer.parseInt(dept) %>"></c:set>




<sql:setDataSource var="myDB" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/Javaschema" user="root" password="sHarmila@11"/>
<sql:update dataSource="${myDB}" var="count">


insert into employees (firstName,lastName,age,phonenumber,Join_date,department) values (?,?,?,?,?,?);



<sql:param value="${fName}"/>
<sql:param value="${lName}"/>
<sql:param value="${age}"/>
<sql:param value="${phNo}"/>
<sql:param value="${jDate}"/>
<sql:param value="${department}"/>

</sql:update>
<div> 
<H1>Record inserted successfully!!!!!</H1>
<button onclick = "history.back()">Go Back</button>
</div>
</body>
</html>