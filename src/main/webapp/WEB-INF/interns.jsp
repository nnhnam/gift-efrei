<jsp:useBean id="interns" scope="request" type="java.util.List<com.example.giftefrei.model.InternEntity>"/>
<jsp:useBean id="groups" scope="request" type="java.util.List<com.example.giftefrei.model.InternGroupEntity>"/>
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
<jsp:include page="header.jsp"/>

<form name='myForm' action='interns-list' method="post">
    <table>
        <tr>
            <th></th>
            <th>Groupe</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>C.d.c</th>
            <th>Fiche visite</th>
            <th>Fiche éval Ent.</th>
            <th>Sondage Web</th>
            <th>Rapport rendu</th>
            <th>Soutenance</th>
            <th>Visite planifiée</th>
            <th>Visite faite</th>
            <th>Début</th>
            <th>Fin</th>
            <th>Entreprise</th>
            <th>Manager</th>
            <th>Adresse</th>
            <th>Note tech</th>
            <th>Note com</th>
        </tr>
        <c:forEach items="${interns}" var="intern">
            <tr>
                <td>
                    <a href="${pageContext.request.contextPath}/intern?id=${intern.internId}">🖊️</a>
                </td>
                <td>
                    <select name="internGroup_${intern.internId}">
                        <c:forEach items="${groups}" var="group">
                            <option value="${group.groupId}" ${group.groupId == intern.internGroupByGroupId.groupId ? "selected" : ""}>
                                    ${group.name}
                            </option>
                        </c:forEach>
                    </select>
                </td>
                <td><input type="text" name="firstName_${intern.internId}" value="${intern.firstName}"></td>
                <td><input type="text" name="lastName_${intern.internId}" value="${intern.lastName}"></td>
                <td><input type="checkbox" name="hasCdc_${intern.internId}" ${intern.hasCdc ? "checked" : ""}></td>
                <td><input type="checkbox"
                           name="hasVisitSheet_${intern.internId}" ${intern.hasVisitSheet ? "checked" : ""}></td>
                <td><input type="checkbox"
                           name="hasTestSheet_${intern.internId}" ${intern.hasTestSheet ? "checked" : ""}></td>
                <td><input type="checkbox"
                           name="hasOnlineSurvey_${intern.internId}" ${intern.hasOnlineSurvey ? "checked" : ""}></td>
                <td><input type="checkbox"
                           name="isReportDone_${intern.internId}" ${intern.internshipByInternshipId.reportDone ? "checked" : ""}>
                </td>
                <td><input type="checkbox"
                           name="isOralDefenseDone_${intern.internId}" ${intern.internshipByInternshipId.oralDefenseDone ? "checked" : ""}>
                </td>
                <td><input type="checkbox"
                           name="isVisitPlanningDone_${intern.internId}" ${intern.internshipByInternshipId.visitPlanningDone ? "checked" : ""}>
                </td>
                <td><input type="checkbox"
                           name="isVisitDone_${intern.internId}" ${intern.internshipByInternshipId.visitDone ? "checked" : ""}>
                </td>
                <td>${intern.internshipByInternshipId.startDate}</td>
                <td>${intern.internshipByInternshipId.endDate}</td>
                <td>${intern.internshipByInternshipId.companyByCompanyId.name}</td>
                <td>${intern.internshipByInternshipId.managerName}</td>
                <td>${intern.internshipByInternshipId.companyByCompanyId.address}</td>
                <td><input type="number" name="noteTech_${intern.internId}" min="0" max="20" step="0.1"
                           value="${intern.internshipByInternshipId.noteTech}"></td>
                <td><input type="number" name="noteCom_${intern.internId}" min="0" max="20" step="0.1"
                           value="${intern.internshipByInternshipId.noteCom}"></td>
            </tr>
        </c:forEach>
    </table>
    <button type="submit">Valider</button>
    <a href="${pageContext.request.contextPath}/intern">Ajouter</a>
</form>

</body>
</html>