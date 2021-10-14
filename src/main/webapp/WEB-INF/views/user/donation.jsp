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
    <a href="/user/donation/list">--> wróć do listy </a><br/>
    <table>
        <tr>
            <th></th>
            <th>Informacje o darze</th>
        </tr>
        <c:forEach items="${donation}" var="d">
            <tr>
                <td>Id</td>
                <td>${donation.id}</td>
            </tr>
            <tr>
                <td>Organizacja</td>
                <td>${donation.institution.name}<br>${donation.institution.description}</td>
            </tr>
            <tr>
                <td>Ilość worków</td>
                <td>${donation.quantity}</td>
            </tr>
            <tr>
                <td>Data odbioru</td>
                <td>${donation.pickUpDate}</td>
            </tr>
            <tr>
                <td>Godzina odbioru</td>
                <td>${donation.pickUpTime}</td>
            </tr>
            <tr>
                <td>Komentarz</td>
                <td>${donation.pickUpComment}</td>
            </tr>
            <tr>
                <td>Odebrana?</td>
                <td>${donation.isPickedUp}</td>
            </tr>
            <tr>
                <td>Oznacz odebrane</td>
                <c:if test="${donation.isPickedUp==false}">
                    <td><a href="/user/donation/pass/${donation.id}">oznacz<br> odebrane</a></td>
                </c:if>
            </tr>
        </c:forEach>
    </table>
</section>

<jsp:include page="../components/footer.jsp"/>
</body>
</html>