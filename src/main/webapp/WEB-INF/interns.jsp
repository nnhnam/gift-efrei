<jsp:useBean id="interns" scope="request" type="java.util.List<com.example.giftefrei.model.InternEntity>"/>
<jsp:useBean id="groups" scope="request" type="java.util.List<com.example.giftefrei.model.InternGroupEntity>"/>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.3/flowbite.min.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300&display=swap" rel="stylesheet">
    <title>JSP - Etudiants</title>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<jsp:include page="nav.jsp"/>
<header class="flex justify-center items-center bg-white pt-8 dark:bg-gray-900">
    <h1 class="text-5xl dark:text-white font-bold"> Vos Etudiants</h1>
</header>
<section class="dark:bg-gray-900 px-6 py-24">
<form name='myForm' action='interns-list' method="post">
<div class="flex justify-center bg-gray-50 dark:bg-gray-900 p-8">
<div class="relative overflow-x-auto shadow-md sm:rounded-lg">
    <table class="overflow-hidden min-w-max text-sm text-left text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
        <tr>
            <th scope="col" class="px-6 py-3">
                Edit Intern
            </th>
            <th scope="col" class="px-6 py-3">
                Group
            </th>
            <th scope="col" class="px-6 py-3">
                Last Name
            </th>
            <th scope="col" class="px-6 py-3">
                First Name
            </th>
            <th scope="col" class="px-6 py-3">
                C.d.C
            </th>
            <th scope="col" class="px-6 py-3">
                Visit Sheet
            </th>
            <th scope="col" class="px-6 py-3">
                Test Sheet
            </th>
            <th scope="col" class="px-6 py-3">
                Online Survey
            </th>
            <th scope="col" class="px-6 py-3">
                Report Done
            </th>
            <th scope="col" class="px-6 py-3">
                Oral Defense Done
            </th>

            <th scope="col" class="px-6 py-3">
                Visit Planning Done
            </th>
            <th scope="col" class="px-6 py-3">
                Visit Done
            </th>
            <th scope="col" class="px-6 py-3">
                Start Date
            </th><th scope="col" class="px-6 py-3">
                End Date
            </th>
            <th scope="col" class="px-6 py-3">
                Company
            </th>
            <th scope="col" class="px-6 py-3">
                Manager
            </th>
            <th scope="col" class="px-6 py-3">
                Grade tech
            </th>
            <th scope="col" class="px-6 py-3">
                Grade com
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${interns}" var="intern">
            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                <td class="w-4 p-4">
                    <div class="flex items-center">
                        <a href="${pageContext.request.contextPath}/intern?id=${intern.internId}" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">
                            Edit ✏️
                        </a>
                    </div>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/intern-group?id=${intern.internGroupByGroupId.groupId}" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit ✏️</a>
                    <select name="internGroup_${intern.internId}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        <c:forEach items="${groups}" var="group">
                            <option value="${group.groupId}" ${group.groupId == intern.internGroupByGroupId.groupId ? "selected" : ""}>
                                    ${group.name}
                            </option>
                        </c:forEach>
                    </select>
                </td>
                <td class="px-6 py-4">
                    <input type="text" name="firstName_${intern.internId}" value="${intern.firstName}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" >
                </td>
                <td class="px-6 py-4">
                    <input type="text" name="lastName_${intern.internId}" value="${intern.lastName}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                </td>
                <td class="px-6 py-4">
                    <label class="relative inline-flex items-center cursor-pointer">
                        <input type="checkbox" name="hasCdc_${intern.internId}" ${intern.hasCdc ? "checked" : ""} class="sr-only peer">
                        <div class="w-9 h-5 bg-gray-200 peer-focus:outline-none peer-focus:ring-4 peer-focus:ring-blue-300 dark:peer-focus:ring-blue-800 rounded-full peer dark:bg-gray-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-4 after:w-4 after:transition-all dark:border-gray-600 peer-checked:bg-blue-600"></div>
                    </label>
                </td>
                <td class="px-6 py-4">
                    <label class="relative inline-flex items-center cursor-pointer">
                        <input type="checkbox" name="hasVisitSheet_${intern.internId}" ${intern.hasVisitSheet ? "checked" : ""} class="sr-only peer">
                        <div class="w-9 h-5 bg-gray-200 peer-focus:outline-none peer-focus:ring-4 peer-focus:ring-blue-300 dark:peer-focus:ring-blue-800 rounded-full peer dark:bg-gray-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-4 after:w-4 after:transition-all dark:border-gray-600 peer-checked:bg-blue-600"></div>
                    </label>
                </td>
                <td class="px-6 py-4">
                    <label class="relative inline-flex items-center cursor-pointer">
                        <input type="checkbox"
                               name="hasTestSheet_${intern.internId}" ${intern.hasTestSheet ? "checked" : ""} class="sr-only peer">
                        <div class="w-9 h-5 bg-gray-200 peer-focus:outline-none peer-focus:ring-4 peer-focus:ring-blue-300 dark:peer-focus:ring-blue-800 rounded-full peer dark:bg-gray-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-4 after:w-4 after:transition-all dark:border-gray-600 peer-checked:bg-blue-600"></div>
                    </label>
                </td>
                <td class="px-6 py-4">
                    <label class="relative inline-flex items-center cursor-pointer">
                        <input type="checkbox"
                               name="hasOnlineSurvey_${intern.internId}" ${intern.hasOnlineSurvey ? "checked" : ""} class="sr-only peer">
                        <div class="w-9 h-5 bg-gray-200 peer-focus:outline-none peer-focus:ring-4 peer-focus:ring-blue-300 dark:peer-focus:ring-blue-800 rounded-full peer dark:bg-gray-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-4 after:w-4 after:transition-all dark:border-gray-600 peer-checked:bg-blue-600"></div>
                    </label>
                </td>
                <td class="px-6 py-4">
                    <label class="relative inline-flex items-center cursor-pointer">
                        <input type="checkbox"
                               name="isReportDone_${intern.internId}" ${intern.internshipByInternshipId.reportDone ? "checked" : ""} class="sr-only peer">
                        <div class="w-9 h-5 bg-gray-200 peer-focus:outline-none peer-focus:ring-4 peer-focus:ring-blue-300 dark:peer-focus:ring-blue-800 rounded-full peer dark:bg-gray-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-4 after:w-4 after:transition-all dark:border-gray-600 peer-checked:bg-blue-600"></div>
                    </label>
                </td>
                <td class="px-6 py-4">
                    <label class="relative inline-flex items-center cursor-pointer">
                        <input type="checkbox"
                               name="isOralDefenseDone_${intern.internId}" ${intern.internshipByInternshipId.oralDefenseDone ? "checked" : ""} class="sr-only peer">
                        <div class="w-9 h-5 bg-gray-200 peer-focus:outline-none peer-focus:ring-4 peer-focus:ring-blue-300 dark:peer-focus:ring-blue-800 rounded-full peer dark:bg-gray-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-4 after:w-4 after:transition-all dark:border-gray-600 peer-checked:bg-blue-600"></div>
                    </label>
                </td>
                <td class="px-6 py-4">
                    <label class="relative inline-flex items-center cursor-pointer">
                        <input type="checkbox"
                               name="isVisitPlanningDone_${intern.internId}" ${intern.internshipByInternshipId.visitPlanningDone ? "checked" : ""} class="sr-only peer">
                        <div class="w-9 h-5 bg-gray-200 peer-focus:outline-none peer-focus:ring-4 peer-focus:ring-blue-300 dark:peer-focus:ring-blue-800 rounded-full peer dark:bg-gray-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-4 after:w-4 after:transition-all dark:border-gray-600 peer-checked:bg-blue-600"></div>
                    </label>
                </td>
                <td class="px-6 py-4">
                    <label class="relative inline-flex items-center cursor-pointer">
                        <input type="checkbox"
                               name="isVisitDone_${intern.internId}" ${intern.internshipByInternshipId.visitDone ? "checked" : ""} class="sr-only peer">
                        <div class="w-9 h-5 bg-gray-200 peer-focus:outline-none peer-focus:ring-4 peer-focus:ring-blue-300 dark:peer-focus:ring-blue-800 rounded-full peer dark:bg-gray-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-4 after:w-4 after:transition-all dark:border-gray-600 peer-checked:bg-blue-600"></div>
                    </label>
                </td>
                <td class="px-6 py-4">
                    <input type="date" name="startDate_${intern.internId}"  value="${intern.internshipByInternshipId.startDate}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                </td>
                <td class="px-6 py-4">
                    <input type="date" name="endDate_${intern.internId}"  value="${intern.internshipByInternshipId.endDate}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                </td>
                <td class="px-6 py-4">
                    <a href="${pageContext.request.contextPath}/company?id=${intern.internshipByInternshipId.companyByCompanyId.companyId}" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit ✏️</a>
                    <select name="company_${intern.internId}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        <c:forEach items="${companies}" var="company">
                            <option value="${company.companyId}" ${company.companyId == intern.internshipByInternshipId.companyByCompanyId.companyId ? "selected" : ""}>
                                    ${company.name}
                            </option>
                        </c:forEach>
                    </select>
                </td>
                <td class="px-6 py-4">
                    <input type="text" name="managerName_${intern.internId}"   value="${intern.internshipByInternshipId.managerName}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                </td>
                <td class="px-6 py-4">
                    <input type="number" name="noteTech_${intern.internId}" min="0" max="20" step="0.1"
                           value="${intern.internshipByInternshipId.noteTech}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                </td>
                <td class="px-6 py-4">
                    <input type="number" name="noteCom_${intern.internId}" min="0" max="20" step="0.1"
                           value="${intern.internshipByInternshipId.noteCom}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="0">
                <a href="${pageContext.request.contextPath}/intern" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">➕ Add a Student</a>
            </td>
        </tr>
        </tbody>
    </table>
</div>
</div>
    <div class="flex justify-center items-center bg-gray-50  dark:bg-gray-900">
<button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300 font-medium rounded-full text-sm px-5 py-2.5 text-center mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
    Save changes 💾</button>

<a href="${pageContext.request.contextPath}/intern-group" class="text-white bg-green-700 hover:bg-green-800 focus:outline-none focus:ring-4 focus:ring-green-300 font-medium rounded-full text-sm px-5 py-2.5 text-center mr-2 mb-2 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800">👨‍💻 Add Group</a>
<a href="${pageContext.request.contextPath}/company" class="text-white bg-purple-700 hover:bg-purple-800 focus:outline-none focus:ring-4 focus:ring-purple-300 font-medium rounded-full text-sm px-5 py-2.5 text-center mr-2 mb-2 dark:bg-purple-600 dark:hover:bg-purple-700 dark:focus:ring-purple-800">💼 Add Company</a>
    </div>
</form>

</section>
<jsp:include page="footer.jsp"/>
<script>
    tailwind.config = {
        darkMode: 'class',
        // ...
    }
</script>

<script>
    // On page load or when changing themes, best to add inline in `head` to avoid FOUC
    if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
        document.documentElement.classList.add('dark');
    } else {
        document.documentElement.classList.remove('dark')
    }


    var themeToggleDarkIcon = document.getElementById('theme-toggle-dark-icon');
    var themeToggleLightIcon = document.getElementById('theme-toggle-light-icon');

    // Change the icons inside the button based on previous settings
    if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
        themeToggleLightIcon.classList.remove('hidden');
    } else {
        themeToggleDarkIcon.classList.remove('hidden');
    }

    var themeToggleBtn = document.getElementById('theme-toggle');

    themeToggleBtn.addEventListener('click', function() {

        // toggle icons inside button
        themeToggleDarkIcon.classList.toggle('hidden');
        themeToggleLightIcon.classList.toggle('hidden');

        // if set via local storage previously
        if (localStorage.getItem('color-theme')) {
            if (localStorage.getItem('color-theme') === 'light') {
                document.documentElement.classList.add('dark');
                localStorage.setItem('color-theme', 'dark');
            } else {
                document.documentElement.classList.remove('dark');
                localStorage.setItem('color-theme', 'light');
            }

            // if NOT set via local storage previously
        } else {
            if (document.documentElement.classList.contains('dark')) {
                document.documentElement.classList.remove('dark');
                localStorage.setItem('color-theme', 'light');
            } else {
                document.documentElement.classList.add('dark');
                localStorage.setItem('color-theme', 'dark');
            }
        }

    });
</script>
<style>
    *{
        font-family: 'Raleway', sans-serif;
        scrollbar-width: thin;
        scrollbar-color: #98c5e5;
    }

    *::-webkit-scrollbar {
        width: 6px;
    }

    *::-webkit-scrollbar-track {
        background: transparent;
    }

    *::-webkit-scrollbar-thumb {
        background-color: #4375ff;
        border-radius: 50px;
        border: transparent;
    }

</style>
</body>
</html>