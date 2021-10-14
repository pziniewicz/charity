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
    <a href="/user/donation/list"><button>--> wróć do listy </button></a><br/>
    <table>
        <tr>
            <th></th>
            <th>Informacje o darze</th>
        </tr>
        <tr>
            <td>Id</td>
            <td>${donationItem.id}</td>
        </tr>
        <tr>
            <td>Organizacja</td>
            <td>${donationItem.institution.name}<br>${donationItem.institution.description}</td>
        </tr>
        <tr>
            <td>Kategorie</td>
            <td>
                <c:forEach var="category" items="${donationItem.categories}">
                ${category.name} <br>
                </c:forEach>
            </td>
        </tr>
        <tr>
            <td>Ilość worków</td>
            <td>${donationItem.quantity}</td>
        </tr>
        <tr>
            <td>Data odbioru</td>
            <td>${donationItem.pickUpDate}</td>
        </tr>
        <tr>
            <td>Godzina odbioru</td>
            <td>${donationItem.pickUpTime}</td>
        </tr>
        <tr>
            <td>Komentarz</td>
            <td>${donationItem.pickUpComment}</td>
        </tr>
        <tr>
            <td>Odebrana?</td>
            <td>${donationItem.isPickedUp}</td>
        </tr>
        <tr>
            <c:if test="${donationItem.isPickedUp==false}">
                <td></td>
                <td><a href="/user/donation/pass/${donationItem.id}"><button>oznacz<br> odebrane</button></a></td>
            </c:if>
        </tr>
    </table>
</section>

<jsp:include page="../components/footer.jsp"/>
</body>
</html>