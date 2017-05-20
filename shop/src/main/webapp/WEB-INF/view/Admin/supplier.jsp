<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Supplier List</title>
</head>
<body>
<h1> Add Supplier</h1>

<table border=2>
	<tr>
	<td>
	<c:url var="addAction" value="/manage_suppliers_add"></c:url>
	<form:form action="${addAction}" commandName="supplier" method="post">
		<table border>
			<tr>
				<td><form:label path="id"> <spring:message text="ID" />	</form:label></td>
						<td><form:input path="id" value=""/></td>
					
				
			<tr>
				<td><form:label path="name">	<spring:message text="Name" /> </form:label></td>
				<td><form:input path="name" required="true" /></td>
			</tr>
			<tr>
				<td><form:label path="address"> <spring:message text="Address"/></form:label></td>
				<td><form:input path="address" required="true" /></td>
			</tr>
			
			<tr>
				<td><form:label path="contact"> <spring:message text="Contact"/></form:label></td>
				<td><form:input path="contact" required="true" /></td>
			</tr>
			
				
			<tr>
				<td>
						<input type="submit" value="<spring:message text="Add Supplier"/>" />
					</td>
			</tr>
		</table>
	</form:form>
	</td>
	<td>
	<c:url var="addAction" value="/manage_suppliers_update"></c:url>
	<form:form action="${addAction}" commandName="supplier" method="post">
		<table>
			<tr>
				<td><form:label path="id"> <spring:message text="ID" />	</form:label></td>
				<c:choose>
					<c:when test="${ not empty supplier.id} ">
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
				<td><form:label path="address"> <spring:message text="Address"/></form:label></td>
				<td><form:input path="address" required="true" /></td>
			</tr>
			<tr>
				<td><form:label path="contact"> <spring:message text="Contact"/></form:label></td>
				<td><form:input path="contact" required="true" /></td>
			</tr>
			
				
			<tr>
				<td>
						<input type="submit" value="<spring:message text="update Supplier"/>" />
					</td>
			</tr>
		</table>
	</form:form>
	</td>
	</tr>
	</table>
	<br>
	<h3>Supplier List</h3>
	<c:if test="${!empty supplierlist}">
		<table border=4>
			<tr>
				<th width="80">Supplier ID</th>
				<th width="120">Supplier Name</th>
				<th width="120">Supplier Address</th>
				<th width="120">Supplier Contact</th>
				<th width="60">Edit</th>
				<th width="60">Delete</th>
			</tr>
			<c:forEach items="${supplierlist}" var="supplier">
				<tr>
					<td>${supplier.id}</td>
					<td>${supplier.name}</td>
					<td>${supplier.address}</td>
					<td>${supplier.contact}</td>
					<td><a href="<c:url value='manage_suppliers_edit/${supplier.id}'/>">Edit</a></td>
					
					<td><a href="<c:url value='manage_suppliers_remove/{id}/${supplier.id}'/>">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>

</body>
</html>


<!--  
<form action="manage_suppliers_add" method="post">
ID<input type="text" name="id">
Name<input type="text" name="name">
Address<input type ="text" name="address">
Contact<input type ="text"name="contact">
<input type="submit" value="create">
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
<c:forEach var="supplier" items="${supplierlist}">
<tr>
<td>${supplier.Id}</td>
<td>${supplier.Name}</td>
<td>${supplier.Address}</td>
<td>${supplier.Contact}</td>
<a href="manage_suppliers_update/${supplier.Id}">Edit</a>
<a href="manage_suppliers_remove/${supplier.Id}">Delete</a>
</tr>
</c:forEach>
</table>---->
