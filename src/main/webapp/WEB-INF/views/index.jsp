<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <jsp:include page="components/head.jsp"/>
    <title><spring:message code="pages.index.title"/></title>
</head>
<body>
<header class="header--main-page">
    <nav class="container container--70">
        <jsp:include page="components/navuser.jsp"/>
        <jsp:include page="components/header.jsp"/>
    </nav>
    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                <spring:message code="landingpage.slogan.part1"/><br>
                <spring:message code="landingpage.slogan.part2"/>
            </h1>
        </div>
    </div>
</header>

<section class="stats" id="stats">
    <div class="container container--85">
        <div class="stats--item">
            <em>${nrOfBags}</em>

            <h3><spring:message code="pages.bagsgivenaway"/></h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eius est beatae, quod accusamus illum
                tempora!</p>
        </div>

        <div class="stats--item">
            <em>${nrOfDonations}</em>
            <h3><spring:message code="pages.donations"/></h3>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Laboriosam magnam, sint nihil cupiditate quas
                quam.</p>
        </div>

    </div>
</section>

<section class="steps">
    <h2><spring:message code="pages.itsonlyfoursteps"/></h2>

    <div class="steps--container">
        <div class="steps--item">
            <span class="icon icon--hands"></span>
            <h3><spring:message code="pages.chooseitems"/></h3>
            <p><spring:message code="pages.exampleitems"/> </p>
        </div>
        <div class="steps--item">
            <span class="icon icon--arrow"></span>
            <h3><spring:message code="pages.packthem"/></h3>
            <p><spring:message code="pages.usetrashbags"/></p>
        </div>
        <div class="steps--item">
            <span class="icon icon--glasses"></span>
            <h3><spring:message code="pages.doecidewho"/></h3>
            <p><spring:message code="pages.chooseplace"/></p>
        </div>
        <div class="steps--item">
            <span class="icon icon--courier"></span>
            <h3><spring:message code="pages.ordercurrier"/></h3>
            <p><spring:message code="pages.curriercomes"/></p>
        </div>
    </div>

    <c:if test="${not empty loggedUser}">
        <security:authorize access="hasRole('ROLE_USER')">
            <a href="/user/donation" class="btn btn--large"><spring:message code="pages.giveaway"/></a>
        </security:authorize>
    </c:if>
    <c:if test="${empty loggedUser}">
        <a href="/register" class="btn btn--large"><spring:message code="pages.navbar.button.register"/></a>
    </c:if></section>

<section class="about-us" id="about-us">
    <div class="about-us--text">
        <h2><spring:message code="pages.navbar.button.about"/></h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptas vitae animi rem pariatur incidunt libero
            optio esse quisquam illo omnis.</p>
        <img src="<c:url value="/resources/images/signature.svg"/>" class="about-us--text-signature" alt="Signature"/>
    </div>
    <div class="about-us--image"><img src="<c:url value="/resources/images/about-us.jpg"/>" alt="People in circle"/>
    </div>
</section>

<section class="help" id="help">
    <h2><spring:message code="pages.whodowegiveourhelp"/></h2>

    <!-- SLIDE 1 -->
    <div class="help--slides active" data-id="1">
        <p><spring:message code="pages.whowehelp"/></p>
        <ul class="help--slides-items">
            <c:forEach items="${institutions}" varStatus="loop" var="institution">
                <c:if test="${loop.index % 2 == 0}">
                    <li>
                    <div class="col">
                        <div class="title">${institution.name}</div>
                        <div class="subtitle">${institution.description}</div>
                    </div>
                </c:if>
                <c:if test="${loop.index % 2 == 1}">
                    <div class="col">
                        <div class="title">${institution.name}</div>
                        <div class="subtitle">${institution.description}</div>
                    </div>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>

</section>

<jsp:include page="components/footer.jsp"/>
</body>
</html>
