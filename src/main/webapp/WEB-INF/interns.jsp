<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Etudiants</title>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<h1>Bonjour ${sessionScope.supervisor.firstName}</h1>
<br/>
<form name='myForm' action='login' method="post">
    <input type="hidden" name="logout" id="logout" value="logout">
    <input type='submit' name='action' value='Se déconnecter'>
</form>
<br/>
<table>
    <tr>
        <th>Nom</th>
        <th>C.d.c</th>
        <th>Fiche visite</th>
        <th>Fiche éval Ent.</th>
        <th>Sondage Web</th>
    </tr>
    <c:forEach items="${interns}" var="intern">
        <tr>
            <td>${intern.firstName} ${intern.lastName}</td>
            <td><input type="checkbox" id="hasCdc" ${intern.hasCdc ? "checked" : ""}></td>
            <td><input type="checkbox" id="hasVisitSheet" ${intern.hasVisitSheet ? "checked" : ""}></td>
            <td><input type="checkbox" id="hasTestSheet" ${intern.hasTestSheet ? "checked" : ""}></td>
            <td><input type="checkbox" id="hasOnlineSurvey" ${intern.hasOnlineSurvey ? "checked" : ""}></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>