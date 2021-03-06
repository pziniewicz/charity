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
        <form:form method="post" modelAttribute="institution">
            <tr>
                <td><form:label path="name"><spring:message code="admin.institutions.name"/>:</form:label></td>
                <td><form:input path="name"/></td>
                <td><form:errors path="name" cssClass="error" element="div" /></td>
            </tr>
            <tr>
                <td><form:label path="description"><spring:message code="admin.institutions.descripton"/>:</form:label></td>
                <td><form:textarea path="description"/></td>
                <td><form:errors path="description" cssClass="error" element="div" /></td>
            </tr>
            <tr>
                <td><input type="submit" value="save"></td>
            </tr>
        </form:form>
    </table>
</section>

<jsp:include page="../components/footer.jsp"/>
</body>
</html>