<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <jsp:include page="/components/head.jsp"/>
    <title>Document</title>
</head>

<body>
<header class="header--main-page">
    <nav class="container container--70">
        <jsp:include page="/omponents/loggedout.jsp"/>
        <jsp:include page="/components/header.jsp"/>
    </nav>
    <section class="login-page">
        <h2><spring:message code="pages.navbar.button.register"/> </h2>
        <form:form modelAttribute="user" method="post" htmlEscape="true">
            <div class="form-group">
                <form:label path="firstName"><spring:message code="user.firstName"/> </form:label>
                <form:input path="firstName" placeholder="Imię"/>
                <form:errors path="firstName"/>
            </div>
            <div class="form-group">
                <form:label path="lastName"><spring:message code="user.lastName"/> </form:label>
                <form:input path="lastName" placeholder="Nazwisko"/>
                <form:errors path="lastName"/>
            </div>
            <div class="form-group">
                <form:label path="email"><spring:message code="user.email"/> </form:label>
                <form:input path="email" placeholder="Email"/>
                <form:errors path="email"/>
            </div>
            <div class="form-group">
                <form:label path="password"><spring:message code="user.password"/> </form:label>
                <form:input type="password" path="password" placeholder="Hasło" htmlEscape="true"/>
                <form:errors path="password"/>
            </div>

            <div class="form-group form-group--buttons">
                <button class="btn" type="submit">Zarejestruj</button>
                <a href="/login" class="btn btn--without-border">Zaloguj się</a>
            </div>
        </form:form>
    </section>
</header>

<jsp:include page="/components/footer.jsp"/>
</body>
</html>
