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
<h2> Add Product</h2>
<c:url var="addAction" value ="/product_add"></c:url>
<c:url var="addAction" value ="/product_edit"></c:url>
<c:url var="addAction" value = "/product_remove"></c:url>
<form action ="${addAction}" method="post">
<input type="text" value="id">
<input type="text" value="name">
<input type ="text" value="amount">
<input type="text" value="quantity">
</form>
<table>
<thead>
<tr>
<td> Id </td>
<td> Name </td>
<td> Amount </td>
<td> Quantity </td>
</tr>
</thead>
<c:forEach var="product" items="${getallProducts}">
<tr>
<td>${product.Id}</td>
<td>${product.Name}</td>
<td>${product.Amount}</td>
<td>${product.Quantity}</td>
<a href="Edit">Edit</a>
<a href="Delete">Delete</a>
</tr>
</c:forEach>
</table>
</body>
</html>