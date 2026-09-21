<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="data.MyClasses.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    background: #111;
    color: #eee;
    font-family: Arial, Helvetica, sans-serif;
    padding: 40px 20px;
}

table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 15px;
    background: transparent;
    color: #eee;
    font-size: 18px;
    border:3px, #00bfff;
}

td {
    padding: 8px;
    vertical-align: middle;
}


#back 
{
width:200px;
margin:auto;
}
</style>
</head>
<body>
<H1>The following are the list of employees:</H1>
<%Data d=(Data)application.getAttribute("data");
ResultSet rs=d.rs;%>
<table>  
<tr>
<th>ID</th>
<th>FirstName</th>
<th>LastName</th>
<th>Phone Number</th>
<th>Age</th>
<th>Join Date</th>
<th>Department</th>
</tr>
<tr>
<%
while(rs.next())
{
%>
<tr>
<td><%=rs.getInt(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getInt(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getDate(6)%></td>
<td><%=rs.getInt(7)%></td>
</tr>
<%}%>
</table>

<div id="back"><button onclick="history.back();">Go back</button></div>

</body>
</html>