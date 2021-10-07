<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <jsp:include page="components/head.jsp"/>
    <title>Document</title>
</head>

<body>
<header class="header">
    <nav class="container container--70">
        <jsp:include page="components/navuser.jsp"/>
        <jsp:include page="components/header.jsp"/>
    </nav>
</header>
    <section class="login-page">
        <h2><spring:message code="pages.navbar.button.login"/></h2>
        <form method="post" action="/login">
            <div class="form-group">
                <c:if test="${param.error != null}">
                <h3><spring:message code="login.error"/></h3>
                </c:if>

                <div class="form-group">
                    <input type="text" name="email" placeholder="<spring:message code="user.email"/>"/>
                    <form:errors path="email"/>
                </div>
                <div class="form-group">
                    <input type="password" name="password" placeholder="<spring:message code="user.password"/>"/>
                </div>

                <div class="form-group form-group--buttons">
                    <button class="btn" type="submit"><spring:message code="pages.navbar.button.login"/></button>
                    <a href="/register" class="btn btn--without-border"><spring:message code="pages.navbar.button.register"/></a>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </section>


<jsp:include page="components/footer.jsp"/>
</body>
</html>
