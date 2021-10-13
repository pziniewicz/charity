<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <jsp:include page="../components/head.jsp"/>
    <title>Document</title>
</head>

<body>
<header class="header">
    <nav class="container container--70">
        <jsp:include page="../components/navuser.jsp"/>
        <jsp:include page="../components/header.jsp"/>
    </nav>
</header>
<section class="login-page">
    <table>
        <form:form method="post" modelAttribute="userNewPassDTO" action="/user/changePassword">
            <form:hidden path="id"/>
            <tr>
                <td><form:label path="newPassword"><spring:message code="user.newpassword"/>:</form:label></td>
                <td><form:input path="newPassword"/></td>
                <td><form:errors path="newPassword" cssClass="error" element="div" /></td>
            </tr>
            <tr>
                <td><input type="submit" value="Save"></td>
            </tr>
        </form:form>
    </table>
</section>

<jsp:include page="../components/footer.jsp"/>
</body>
</html>
