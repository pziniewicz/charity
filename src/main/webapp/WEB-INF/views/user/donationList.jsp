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
    <a href="/user/donation">+ złóż nowy dar</a><br/>
    <table>
        <tr>
            <th>Id</th>
            <th>Organizacja</th>
            <th>Ilość</th>
            <th>Data</th>
            <th>Godzina</th>
            <th>Komentarz</th>
            <th>Odebrany?</th>
            <th><spring:message code="admin.action"/></th>
        </tr>
        <c:forEach items="${donations}" var="d">
            <tr>
                <td>${d.id}</td>
                <td>${d.institution.name}<br>${d.institution.description}</td>
                <td>${d.quantity}</td>
                <td>${d.pickUpDate}</td>
                <td>${d.pickUpTime}</td>
                <td>${d.pickUpComment}</td>
                <td>${d.isPickedUp}</td>
                <td><a href="/admin/institutions/create?id=${u.id}">oznacz<br> odebrane</a></td>
                <td><a href="/admin/institutions/delete/${u.id}">szczegóły</a></td>
            </tr>
        </c:forEach>
    </table>
</section>

<jsp:include page="../components/footer.jsp"/>
</body>
</html>