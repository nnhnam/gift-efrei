<jsp:useBean id="internGroup" scope="request" class="com.example.giftefrei.model.InternGroupEntity"/>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Groupe</title>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<h2>Groupe</h2>
<form name='myForm' action='intern-group' method="post">
    <c:if test="${internGroup.groupId != 0}">
        <label>ID: <input type="text" name="internGroupId" readonly value="${internGroup.groupId}"></label>
    </c:if>
    <label>Nom: <input type="text" name="name" value="${internGroup.name}"></label>

    <button type="submit">💾</button>
</form>
</body>
</html>