<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product List</title>
</head>
<body>
<h1>Add Product</h1>

<table border=2>
	<tr>
	<td>
	<c:url var="addAction" value="/manage_products_add"></c:url>
	<form:form action="${addAction}" commandName="product" method="post">
		<table border>
			<tr>
				<td><form:label path="id"> <spring:message text="ID" />	</form:label></td>
				
					
				
						<td><form:input path="id" value=""/></td>
					
				
			<tr>
				<td><form:label path="name">	<spring:message text="Name" /> </form:label></td>
				<td><form:input path="name" required="true" /></td>
			</tr>
			<tr>
				<td><form:label path="amount"> <spring:message text="Amount"/></form:label></td>
				<td><form:input path="amount" required="true" /></td>
			</tr>
			
			<tr>
				<td><form:label path="quantity"> <spring:message text="Quantity"/></form:label></td>
				<td><form:input path="quantity" required="true" /></td>
			</tr>
			<tr>
				<td><form:label path="price"> <spring:message text="Price"/></form:label></td>
				<td><form:input path="price" required="true" /></td>
			</tr>
			
				
			<tr>
				<td>
						<input type="submit" value="<spring:message text="Add Product"/>" />
					</td>
			</tr>
		</table>
	</form:form>
	</td>
	<td>
	<c:url var="addAction" value="/manage_products_update"></c:url>
	<form:form action="${addAction}" commandName="product" method="post">
		<table>
			<tr>
				<td><form:label path="id"> <spring:message text="ID" />	</form:label></td>
				<c:choose>
					<c:when test="${ not empty product.id} ">
						<td><form:input path="id"  readonly="true" /></td>
					</c:when>
					<c:otherwise>
						<td><form:input path="id"/></td>
					</c:otherwise>
				</c:choose>
			<tr>
				<td><form:label path="name">	<spring:message text="Name" /> </form:label></td>
				<td><form:input path="name" required="true" /></td>
			</tr>
			<tr>
				<td><form:label path="amount"> <spring:message text="Amount"/></form:label></td>
				<td><form:input path="amount" required="true" /></td>
			</tr>
			<tr>
				<td><form:label path="quantity"> <spring:message text="Quantity"/></form:label></td>
				<td><form:input path="quantity" required="true" /></td>
			</tr>
			<tr>
				<td><form:label path="price"> <spring:message text="Price"/></form:label></td>
				<td><form:input path="price" required="true" /></td>
			</tr>
				
			<tr>
				<td>
						<input type="submit" value="<spring:message text="update Product"/>" />
					</td>
			</tr>
		</table>
	</form:form>
	</td>
	</tr>
	</table>
	<br>
	<h3>Product List</h3>
	<c:if test="${!empty productlist}">
		<table border=4>
			<tr>
				<th width="80">Product ID</th>
				<th width="120">Product Name</th>
				<th width="120">Product Amount</th>
				<th width="120">Product Quantity</th>
				<th width="120">Product List</th>
				<th width="60">Edit</th>
				<th width="60">Delete</th>
			</tr>
			<c:forEach items="${productlist}" var="product">
				<tr>
					<td>${product.id}</td>
					<td>${product.name}</td>
					<td>${product.amount}</td>
					<td>${product.quantity}</td>
					<td>${product.price}</td>
					<td><a href="<c:url value='manage_products_edit/${product.id}' />">Edit</a></td>
					
					<td><a href="<c:url value='manage_products_remove/${product.id}' />">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<!-- <form action="manage_products_add" method="post">
ID<input type="text" name="id">
Name<input type="text" name="name">
Amount<input type ="text" name="amount">
Quantity<input type ="text"name="quantity">
<input type="submit" value="create">
<table>
<thead>
<tr>
<td>Id</td>
<td> Name</td>
<td> Amount</td>
<td> Quantity</td>
</tr>
</thead>

<c:forEach var="product" items="${productlist}">
<tr>
<td>${product.id}</td>
<td>${product.name}</td>
<td>${product.amount}</td>
<td>${product.quantity}</td>
<a href="manage_products_update/${product.id}">Edit</a>
<a href="manage_products_remove/${product.id}">Delete</a>
</tr>
</c:forEach>
</table>
</form>----> 
</body>
</html>