<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

    <ul>
        <li><a href="/" class="btn btn--without-border active"><spring:message code="pages.navbar.button.start"/></a></li>
        <security:authorize access="hasRole('ROLE_ADMIN')">
            <li><a href="/admin/institutions" class="btn btn--without-border active" style="background: cadetblue"><spring:message code="pages.institutions"/></a></li>
        </security:authorize>
        <security:authorize access="hasRole('ROLE_ADMIN')">
            <li><a href="/admin/users" class="btn btn--without-border active" style="background: cadetblue"><spring:message code="pages.users"/></a></li>
        </security:authorize>
        <security:authorize access="hasRole('ROLE_USER')">
            <li><a href="/user/donation/list" class="btn btn--without-border active"><spring:message code="user.yourdonations"/> </a></li>
        </security:authorize>
        <li><a href="#stats" class="btn btn--without-border"><spring:message code="pages.navbar.button.project_description"/></a></li>
        <li><a href="#about-us" class="btn btn--without-border"><spring:message code="pages.navbar.button.about"/></a></li>
        <li><a href="#help" class="btn btn--without-border"><spring:message code="pages.navbar.button.fundations"/></a></li>
        <li><a href="#contact" class="btn btn--without-border"><spring:message code="pages.navbar.button.contact"/></a></li>
    </ul>
