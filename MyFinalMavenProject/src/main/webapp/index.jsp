<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

* {
    font-family: 'Poppins', sans-serif;
}

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    background: #111;
    color: #eee;
    font-family: Arial, Helvetica, sans-serif;
    padding: 40px 20px;
}


form {
    width: 90%;
    max-width: 850px;
    margin: 30px auto;
}


fieldset {
    border: 1px solid #444;
    border-radius: 12px;
    padding: 30px;
    background: #1c1c1c;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.5);
}


legend {
    padding: 0 15px;
    font-size: 24px;
    font-weight: bold;
    color: #00bfff;
}


h1 {
    text-align: center;
    font-size: 26px;
    margin-bottom: 25px;
    color: #00bfff;
}


table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 15px;
    background: transparent;
    color: #eee;
    font-size: 18px;
}

td {
    padding: 8px;
    vertical-align: middle;
}


label {
    font-weight: bold;
    color: #ddd;
}


input[type="text"],
input[type="datetime-local"],
select {
    width: 100%;
    padding: 12px 14px;
    border: 1px solid #555;
    border-radius: 7px;
    background: #292929;
    color: white;
    font-size: 16px;
    outline: none;
    transition: 0.3s;
}

input[type="text"]:focus,
input[type="datetime-local"]:focus,
select:focus {
    border-color: #00bfff;
    box-shadow: 0 0 8px rgba(0, 191, 255, 0.3);
}


select {
    cursor: pointer;
}


input[type="submit"] {
    background: #00bfff;
    color: white;
    border: none;
    padding: 12px 30px;
    border-radius: 7px;
    font-size: 17px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
}


input[type="submit"]:hover {
    background: #008fcc;
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(0, 191, 255, 0.3);
}
input[type="checkbox"] {
    width: 17px;
    height: 17px;
    accent-color: #00bfff;
    cursor: pointer;
    margin-right: 8px;
}


#t2 {
    background: transparent;
    color: #eee;
}


#t2 table {
    background: transparent;
}


form + form {
    margin-top: 35px;
}




}
</style>
</head>
<body>

<sql:setDataSource var="myDB" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/Javaschema" user="root" password="sHarmila@11"/>
<sql:query dataSource="${myDB}" var="ids">
select id from employees
</sql:query>
<form action="insert.jsp" method="GET">
<fieldset>
<legend>INSERT EMPLOYEE RECORDS:</legend>

<table>
<label>INSERT EMPOLYEE DETAILS:</label>
<tr><td><lable>First Name:</lable></td><td><input type="text" name="firstname" ></td></tr>
<tr><td><lable>Last Name:</lable></td><td><input type="text" name="lastname"></td></tr>
<tr><td><label>Phone Number:</label></td><td><input type="text" name="phonenumber" ></td></tr>
<tr><td><label>age:</label></td><td><input type="text" name="age"></td></tr>
<tr><td><label>Join Date:</label></td><td><input type="datetime-local" name="Join_date"></td></tr>
<tr><td><label>Department</label></td><td><input type="text" name="department"></td></tr>
<tr><td><input type="submit" value="submit"></td></tr>
</table>
</fieldset>

</form>


<form action="update.jsp" method="GET">
<fieldset>
<H1>Update Employee Records </H1>
<table >
<tr><td><label>Id:</label><select name="id">
<c:forEach var="myId" items="${ids.rows}">
<option value="${myId.id}">${myId.id}</option>
</c:forEach>
</select></td></tr>

<tr><td><label>Field:</label></td><td><input type="checkbox" name="myField" value="firstname">firstName</td>
<td><label>Value:</label><input type="text" name="firstnameInput"></td></tr>
<tr><td><label>Field:</label></td><td><input type="checkbox" name="myField" value="lastname">lastName</td>
<td><label>Value:</label><input type="text" name="lastnameInput"></td></tr>
<tr><td><label>Field:</label></td><td><input type="checkbox" name="myField" value="age">age</td>
<td><label>Value:</label><input type="text" name="ageInput"></td></tr>
<tr><td><label>Field:</label></td><td><input type="checkbox" name="myField" value="phonenumber">phone number</td>
<td><label>Value:</label><input type="text" name="phonenumberInput"></td></tr>
<tr><td><label>Field:</label></td><td><input type="checkbox" name="myField" value="Join_date">JoinDate</td>
<td><label>Value</label><input type="datetime-local" name="Join_dateInput"></td></tr>
<tr><td><label>Field:</label></td><td><input type="checkbox" name="myField" value="department">Department</td>
<td><label>Value:</label><input type="text" name="departmentInput"></td></tr>
<tr><td></td><td><input type="submit" value="submit"></td></tr>
</table>
</fieldset>
</form>


<form action="select.jsp" method="POST">
<fieldset>
<H1>Click below button to get employees list:</H1>
<input type="submit" value="submit">
</fieldset>
</form>




<form action="delete.jsp" method="GET">
<fieldset>
<H1>Delete Employee Records </H1>
<table>
<tr><td><label>Id:</label><select name="myDeleteId">
<c:forEach var="myId" items="${ids.rows}">
<option value="${myId.id}">${myId.id}</option>
</c:forEach>
</select></td></tr>

<tr><td></td><td><input type="submit" value="submit"></td></tr>
</table>
</fieldset>
</form>

<br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br>






</body>

</html>