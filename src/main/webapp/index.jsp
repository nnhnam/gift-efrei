<%@ page import="com.example.giftefrei.model.SupervisorEntity" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello ${sessionScope.supervisor.firstName}</a>
<form name='myForm' action='login' method="post">
    <input type="hidden" name="logout" id="logout" value="logout">
    <input type='submit' name='action' value='Logout'>
</form>
</body>
</html>