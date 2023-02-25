<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<header>
    <h1>Bonjour ${sessionScope.supervisor.firstName} ${sessionScope.supervisor.lastName}</h1>
    <form name='myForm' action='login' method="post">
        <input type="hidden" name="logout" id="logout" value="logout">
        <input type='submit' name='action' value='Se déconnecter'>
    </form>
</header>

