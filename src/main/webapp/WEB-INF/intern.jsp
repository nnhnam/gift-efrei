<jsp:useBean id="intern" scope="request" class="com.example.giftefrei.model.InternEntity"/>
<jsp:useBean id="groups" scope="request" type="java.util.List<com.example.giftefrei.model.InternGroupEntity>"/>
<jsp:useBean id="companies" scope="request" type="java.util.List<com.example.giftefrei.model.CompanyEntity>"/>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Etudiant</title>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
</head>
<script>
    function deleteIntern(id) {
        // Send a DELETE request to the server
        fetch('${pageContext.request.contextPath}/intern?internId=' + id, {
            method: 'DELETE',
        })
            .then(response => {
                window.location.replace('${pageContext.request.contextPath}/interns-list');
            })
            .catch(error => {
                console.error(error);
            });
    }
</script>
<body>
<jsp:include page="header.jsp"/>
<form name='myForm' action='intern' method="post">
    <c:if test="${intern.internId != 0}">
        <label>ID: <input type="text" name="internId" readonly value="${intern.internId}"></label>
    </c:if>
    <label>Nom: <input type="text" name="firstName" value="${intern.firstName}"></label>
    <label>Prénom: <input type="text" name="lastName" value="${intern.lastName}"></label>
    <label>
        Groupe
        <select name="internGroup">
            <c:forEach items="${groups}" var="group">
                <option value="${group.groupId}" ${group.groupId == intern.internGroupByGroupId.groupId ? "selected" : ""}>
                        ${group.name}
                </option>
            </c:forEach>
        </select>
    </label>
    <fieldset>
        Entreprise
        <br/>
        <select name="company">
            <c:forEach items="${companies}" var="company">
                <option value="${company.companyId}" ${company.companyId == intern.internshipByInternshipId.companyByCompanyId.companyId ? "selected" : ""}>
                        ${company.name}
                </option>
            </c:forEach>
        </select>
    </fieldset>
    <fieldset>
        Stage
        <br/>
        <label>Début: <input type="date" name="startDate" value="${intern.internshipByInternshipId.startDate}"></label>
        <label>Fin: <input type="date" name="endDate" value="${intern.internshipByInternshipId.endDate}"></label>
        <label>Maître de stage: <input type="text" name="managerName"
                                       value="${intern.internshipByInternshipId.managerName}"></label>
        <label>Description: <input type="text" name="description"
                                   value="${intern.internshipByInternshipId.description}"></label>
        <label>Commentaire: <input type="text" name="comment"
                                   value="${intern.internshipByInternshipId.comment}"></label>
    </fieldset>

    <button type="submit">💾</button>
</form>
<br/>
<button onclick="deleteIntern(${intern.internId})">🗑️</button>

</body>
</html>