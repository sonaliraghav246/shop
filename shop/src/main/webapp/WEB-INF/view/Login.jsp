<%--  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    
    <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Login Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<form name='loginForm'
		  action="<c:url value='/validate' />" method='POST'>

<h3>
		<center>${msg}</center>
	</h3>
	<h3>
		<center>${successmessage}</center>
	</h3>
	<h3> 
	<center> ${role}</center>
	</h3>
<div class="container">
  <h2>Login Form</h2>
  <form>
    <div class="form-group">
      <label for="userId">UserID:</label>
      <input type="userId" class="form-control" id="userId" placeholder="Enter UserId">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="pwd" class="form-control" id="pwd" placeholder="Enter password">
    </div>
    <div class="checkbox">
      <label><input type="checkbox"> Remember me</label>
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
    <input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
  </form>
</div>

</body>
</html>

 --%>






















<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <sec:csrfInput />
<title>Insert title here</title>
</head>
<body>
This is login page

<form name='loginForm'
		  action="<c:url value='/validate' />" method='POST'>

<h3>
		<center>${msg}</center>
	</h3>
	<h3>
		<center>${successmessage}</center>
	</h3>
	<h3> 
	<center> ${role}</center>
	</h3>
<center>
 <label for="userId">UserID</label>
<input type ="text" name="userId"><br>
<label for="pwd">Password</label>
<input type="password" name="pwd"><br>
<input type="submit"value="Login">
<input type="reset"value="Reset">
 <input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
<c:if test=""></c:if>
</center>
</form>
</body>
</html>


</html>