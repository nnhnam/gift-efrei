<jsp:useBean id="company" scope="request" class="com.example.giftefrei.model.CompanyEntity"/>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Entreprise</title>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<h2>Entreprise</h2>
<form name='myForm' action='company' method="post">
    <c:if test="${company.companyId != 0}">
        <label>ID: <input type="text" name="companyId" readonly value="${company.companyId}"></label>
    </c:if>
    <label>Nom: <input type="text" name="name" value="${company.name}"></label>
    <label>Adresse: <input type="text" name="address" value="${company.address}"></label>

    <button type="submit">💾</button>
</form>
</body>
</html>