<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MyCart</title>
</head>
<body>
<center><h3>My Cart</h3>
	<c:if test="${!empty orderDetails}">
		<table border=4>
			<tr>
				<th width="80">Id</th>
				<th width="120">Product Id</th>
				<th width="120">Order Id</th>
				<th width="120">Amount</th>
				<th width="120">Price</th>
				<th width="120">Quantity</th>
				<th width="120">Order Date</th>
				
			
			</tr>
		<c:forEach var="orderDetail"  items="${orderDetails}">
			<form action="" method="get">
				<tr>
					<td>
					<input type="text" name="id" value="${orderDetail.id}" readonly="true"></td>
					<td><input type="text" name="price" value="${orderDetail.price}" readonly="true"></td>
					<td><input type="text" name="amount" value="${orderDetail.amount}" readonly="true"></td>
					<td><input type="text" name="orderdate" value="${orderDetail.date}"readonly="true"></td>
					<td><input type="text" name="quantity" value="${orderDetail.quantity}"></td>
					<td><a href="<c:url value='cart_edit/${orderDetail.id}' />">Edit</a></td>
					
					<td><a href="<c:url value='cart_remove/${orderDetail.id}' />">Delete</a></td>
				</tr></center>
				</form>
			</c:forEach>
		
		</table>
	</c:if>
</body>
</html>