<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<nav class="container container--70">
    <ul class="nav--actions">
        <li><a href="" class="btn btn--small btn--without-border"><spring:message code="pages.navbar.button.login"/></a></li>
        <li><a href="#" class="btn btn--small btn--highlighted"><spring:message code="pages.navbar.button.register"/></a></li>
    </ul>

    <ul>
        <li><a href="#" class="btn btn--without-border active"><spring:message code="pages.navbar.button.start"/></a></li>
        <li><a href="#" class="btn btn--without-border"><spring:message code="pages.navbar.button.project_description"/></a></li>
        <li><a href="#" class="btn btn--without-border"><spring:message code="pages.navbar.button.about"/></a></li>
        <li><a href="#" class="btn btn--without-border"><spring:message code="pages.navbar.button.fundations"/></a></li>
        <li><a href="#" class="btn btn--without-border"><spring:message code="pages.navbar.button.contact"/></a></li>
    </ul>
</nav>