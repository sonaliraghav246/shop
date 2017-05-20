<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<a href="manage_categories">Manage Category </a>
	<a href="manage_products">Manage Product </a>
	<a href="manage_suppliers">Manage Supplier</a>
	<c:if test="${isUserClickedCateogories==true}">
		<jsp:include page="category.jsp"></jsp:include>
	</c:if>
	<c:if test="${isUserClickedProducts==true}">
		<jsp:include page="product.jsp"></jsp:include>
	</c:if>
	<c:if test="${isUserClickedSupplier==true}">
		<jsp:include page="supplier.jsp"></jsp:include>
	</c:if>
	
</body>
</html>