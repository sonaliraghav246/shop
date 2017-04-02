<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1> Add Supplier</h1>
<c:url var="addAction" value="/supplier_add"></c:url>
<c:url var="addAction" value="/supplier-edit"></c:url>
<c:url var="addAction" value="/supplier_remove"></c:url>
<form action="${addAction}" method="post">
<input type="text" value="id">
<inout type="text" value="name">
<input type ="text" value="Address">
<input type ="text"value="contact">
</form> 
<table>
<thead>
<tr>
<td>Id</td>
<td> Name</td>
<td> Address</td>
<td> Contact</td>
</tr>
</thead>
</table>
</body>
</html>