<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

    <ul>
        <li><a href="#" class="btn btn--without-border active"><spring:message code="pages.navbar.button.start"/></a></li>
        <li><a href="#" class="btn btn--without-border"><spring:message code="pages.navbar.button.project_description"/></a></li>
        <li><a href="#" class="btn btn--without-border"><spring:message code="pages.navbar.button.about"/></a></li>
        <li><a href="#" class="btn btn--without-border"><spring:message code="pages.navbar.button.fundations"/></a></li>
        <li><a href="#" class="btn btn--without-border"><spring:message code="pages.navbar.button.contact"/></a></li>
    </ul>
