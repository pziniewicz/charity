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
    <a href="create"><spring:message code="admin.institutions.addinstitution"/></a><br/>
    <table>
        <tr>
            <th>Id</th>
            <th><spring:message code="admin.institutions.name"/></th>
            <th><spring:message code="admin.institutions.descripton"/></th>
            <th><spring:message code="admin.action"/></th>
        </tr>
        <c:forEach items="${institutions}" var="i">
            <tr>
                <td>${i.id}</td>
                <td>${i.name}</td>
                <td>${i.description}</td>
                <td><a href="/admin/institutions/create?id=${i.id}"><spring:message code="admin.edit"/></a></td>
                <td><a href="/admin/institutions/delete/${i.id}"><spring:message code="admin.edit"/></a></td>
            </tr>
        </c:forEach>
    </table>
</section>

<jsp:include page="../components/footer.jsp"/>
</body>
</html>