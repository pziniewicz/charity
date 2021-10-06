<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<ul class="nav--actions">
    
    <security:authorize access="hasRole('ROLE_USER')">
        <li><spring:message code="user.welcome"/>,  <b><a href="/register" class="btn btn--small btn--without-border">
                ${loggedUser.fullName}</a></b></li>
    </security:authorize>
    <li><a href="/logout" class="btn btn--small btn--highlighted"><spring:message code="pages.navbar.button.logout"/></a></li>
</ul>