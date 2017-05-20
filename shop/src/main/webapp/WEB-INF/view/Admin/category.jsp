<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>

<body>
${msg}
	<h1>Add a Category</h1>
	<table border=2>
	<tr>
	<td>
	<c:url var="addAction" value="/manage_categories_add"></c:url>
	<form:form action="${addAction}" commandName="category" method="post">
		<table border>
						
			<tr>
				<td><form:label path="id"> <spring:message text="ID" />	</form:label></td>
				
					<td><form:input path="id" value=""/></td>
				
					
				
			<tr>
				<td><form:label path="name">	<spring:message text="Name" /> </form:label></td>
				<td><form:input path="name" required="true" /></td>
			</tr>
			<tr>
				<td><form:label path="description"> <spring:message text="Description"/></form:label></td>
				<td><form:input path="description" required="true" /></td>
			</tr>
			
				
			<tr>
				<td>
						<input type="submit" value="<spring:message text="Add Category"/>" />
						
						
					</td>
			</tr>
		</table>
	</form:form>
	</td>
	<td>
	<c:url var="addAction" value="/manage_categories_update"></c:url>
	<form:form action="${addAction}" commandName="category" method="post">
		<table>
			<tr>
				<td><form:label path="id"> <spring:message text="ID" />	</form:label></td>
				<c:choose>
					<c:when test="${ not empty category.id} ">
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
				<td><form:label path="description"> <spring:message text="Description"/></form:label></td>
				<td><form:input path="description" required="true" /></td>
			</tr>
			
				
			<tr>
				<td>
						<input type="submit" value="<spring:message text="update Category"/>" />
					</td>
			</tr>
		</table>
	</form:form>
	</td>
	</tr>
	</table>
	<br>
	<h3>Category List</h3>
	<c:if test="${!empty categoryList}">
		<table border=4>
			<tr>
				<th width="80">Category ID</th>
				<th width="120">Category Name</th>
				<th width="120">Category Description</th>
				<th width="60">Edit</th>
				<th width="60">Delete</th>
			</tr>
			<c:forEach items="${categoryList}" var="category">
				<tr>
					<td>${category.id}</td>
					<td>${category.name}</td>
					<td>${category.description}</td>
					<td><a href="<c:url value='/manage_categories_edit/${category.id}' />">Edit</a></td>
					
					<td><a href="<c:url value='/manage_categories_remove/${category.id}' />">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<!--  	<h2>Add Category</h2>

	<form action="manage_categories_add" method="post">

		<c:if test="${!empty category.id }">
Id	<input type="text"  name="id"> 
	Name	<input type="text" name="name">
	Description	<input type="text" name="description">
	Name	<input type="text" name="name">
	Description	<input type="text" name="description">
	
		
		<input type="submit" value="Edit">
		</c:if>
		<c:if test="${empty category.id }">
		Id	<input type="text"  name="id"> 
	Name	<input type="text" name="name">
	Description	<input type="text" name="description">
		
		<input type="submit" value="create">
		</c:if>
	</form>
	<table border="2">
		<thead>
			<tr>
				<td>Id</td>
				<td>Name</td>
				<td>Description</td>
			</tr>
		</thead>
		<c:forEach var="category" items="${categoryList}">
			<tr>
				<td>${category.id}</td>
				<td>${category.name}</td>
				<td>${category.description}</td>
				<td><a href="manage_categories_edit/${category.id}">Edit</a></td>
				<td><a href="manage_categories_remove/${category.id}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>--->
</body>
</html>