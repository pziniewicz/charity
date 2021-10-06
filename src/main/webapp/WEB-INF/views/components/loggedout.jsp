<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<ul class="nav--actions">
    <li><a href="/login" class="btn btn--small btn--without-border"><spring:message code="pages.navbar.button.login"/></a></li>
    <li><a href="/register" class="btn btn--small btn--highlighted"><spring:message code="pages.navbar.button.register"/></a></li>
</ul>