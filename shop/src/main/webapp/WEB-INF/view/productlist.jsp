<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<br>
	<center><h3>Add Product to Cart</h3>
	<c:if test="${!empty productlist}">
		<table border=4>
			<tr>
				<th width="80">Product ID</th>
				<th width="120">Product Name</th>
				<th width="120">Product Amount</th>
				<th width="120">Product Price</th>
				<th width="120">Product Quantity</th>
				<th width="60">Add</th>
			
			</tr>
		<c:forEach items="${productlist}" var="product">
			<form action="addtocart" method="get">
				<tr>
					<td>
					<input type="text" name="id" value="${product.id}" readonly="true"></td>
					<td><input type="text" name="name" value="${product.name}" readonly="true"></td>
					<td><input type="text" name="price" value="${product.price}" readonly="true"></td>
					<td><input type="text" name="amount" value="${product.amount}" readonly="true"></td>
					<td><input type="text" name="quantity" value="1"></td>
					<td><input type="submit" value="AddToCart"></td>
				</tr></center>
				</form>
			</c:forEach>
		
		</table>
	</c:if>


</body>
</html>