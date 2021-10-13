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
    <a href="/admin/users/create"><spring:message code="admin.users.addUser"/></a><br/>
    <table>
        <tr>
            <th>Id</th>
            <th><spring:message code="admin.users.name"/></th>
            <th><spring:message code="admin.users.surname"/></th>
            <th>Email</th>
            <th><spring:message code="admin.users.role"/></th>
            <th><spring:message code="admin.users.active"/></th>
            <th><spring:message code="admin.action"/></th>
        </tr>
        <c:forEach items="${users}" var="u">
            <tr>
                <td>${u.id}</td>
                <td>${u.firstName}</td>
                <td>${u.lastName}</td>
                <td>${u.email}</td>
                <td>${u.role}</td>
                <td>${u.enabled}</td>
                <td><a href="/admin/users/create?id=${u.id}"><spring:message code="admin.edit"/></a></td>
                <c:if test="${loggedUser.id != u.id}">
                <td><a href="/admin/users/delete/${u.id}"><spring:message code="admin.delete"/></a></td>
                <c:if test="${u.enabled==true}">
                    <td><a href="/admin/users/deactivate/${u.id}"><spring:message code="admin.deactivate"/></a></td>
                </c:if>
                <c:if test="${u.enabled==false}">
                    <td><a href="/admin/users/activate/${u.id}"><spring:message code="admin.activate"/></a></td>
                </c:if>
                <c:if test="${u.role=='ROLE_USER'}">
                    <td><a href="/admin/users/toAdmin/${u.id}">-->ADMIN</a></td>
                </c:if>
                <c:if test="${u.role=='ROLE_ADMIN'}">
                    <td><a href="/admin/users/toUser/${u.id}">-->USER</a></td>
                </c:if>
                </c:if>
            </tr>
        </c:forEach>
    </table>
</section>

<jsp:include page="../components/footer.jsp"/>
</body>
</html>