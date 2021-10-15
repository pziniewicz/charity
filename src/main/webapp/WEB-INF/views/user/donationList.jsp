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
    <a href="/user/donation#form--steps"><button><spring:message code="user.newdonation"/></button></a><br/>
    <table>
        <tr>
            <th>Id</th>
            <th><spring:message code="pages.institution"/></th>
            <th><spring:message code="pages.category"/></th>
            <th><spring:message code="pages.quantity"/></th>
            <th><spring:message code="pages.date"/></th>
            <th><spring:message code="pages.time"/></th>
            <th><spring:message code="pages.comment"/></th>
            <th><spring:message code="pages.pickedup"/></th>
            <th><spring:message code="admin.action"/></th>
        </tr>
        <c:forEach items="${donations}" var="d">
            <tr>
                <td>${d.id}</td>
                <td>${d.institution.name}<br>${d.institution.description}</td>
                <td>
                    <c:forEach var="category" items="${d.categories}">
                        ${category.name} <br>
                    </c:forEach>
                </td>
                <td>${d.quantity}</td>
                <td>${d.pickUpDate}</td>
                <td>${d.pickUpTime}</td>
                <td>${d.pickUpComment}</td>
                <td>${d.isPickedUp}</td>
                <td><a href="/user/donation/item/${d.id}"><button><spring:message code="pages.details"/></button></a></td>
                <c:if test="${d.isPickedUp==false}">
                <td><a href="/user/donation/pass/${d.id}"><button><spring:message code="pages.markpickedup"/></button></a></td>
                </c:if>
            </tr>
        </c:forEach>
    </table>
</section>

<jsp:include page="../components/footer.jsp"/>
</body>
</html>