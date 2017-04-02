<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<h2>Add Category</h2>
	<c:url var="addAction" value="/category_add"></c:url>
	<c:url var="addAction" value="/category_edit"></c:url>
	<c:url var="addAction" value="/category_remove"></c:url>
	<form action="${addAction}" method="post">
		<input type="text" value="id"> <input type="text" value="name">
		<input type="text" value="description">
	</form>
	<table border="2">
		<thead>
			<tr>
				<td>Id</td>
				<td>Name</td>
				<td>Description</td>
			</tr>
		</thead>
		<c:forEach var="category" items="${getallCategories}">
			<tr>
				<td>${category.Id}</td>
				<td>${category.Name}</td>
				<td>${category.Description}</td>
				<a href="Edit">Edit</a>>
				<a href="Delete">Delete</a>
			</tr>
		</c:forEach>
	</table>
	</table>
</body>
</html>