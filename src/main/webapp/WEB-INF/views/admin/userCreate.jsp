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
        <form:form method="post" modelAttribute="user">
            <tr>
                <td><form:label path="firstName"><spring:message code="admin.users.name"/>:</form:label></td>
                <td><form:input path="firstName"/></td>
                <td><form:errors path="firstName" cssClass="error" element="div" /></td>
            </tr>
            <tr>
                <td><form:label path="lastName"><spring:message code="admin.users.surname"/>:</form:label></td>
                <td><form:textarea path="lastName"/></td>
                <td><form:errors path="lastName" cssClass="error" element="div" /></td>
            </tr>
            <tr>
                <td><form:label path="email">Email:</form:label></td>
                <td><form:textarea path="email"/></td>
                <td><form:errors path="email" cssClass="error" element="div" /></td>
            </tr>
            <tr>
                <td><form:label path="password">Hasło:</form:label></td>
                <td><form:password path="password"/></td>
                <td><form:errors path="password" cssClass="error" element="div" /></td>
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