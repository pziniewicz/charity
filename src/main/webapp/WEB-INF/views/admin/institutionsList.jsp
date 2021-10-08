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
  <style>
    table {
      display: table;
      border-collapse: separate;
      box-sizing: border-box;
      text-indent: initial;
      border-spacing: 2px;
      border-color: grey;
    }
    td, th {
      text-align: left;
      padding: 8px;
    }
    tr:nth-child(even) {
      background-color: #dddddd;
    }
  </style>
</head>

<body>
<header class="header">
  <nav class="container container--70">
    <jsp:include page="../components/navuser.jsp"/>
    <jsp:include page="../components/header.jsp"/>
  </nav>
</header>
<section class="login-page">
  <a href="create">+ dodaj Organizacje</a><br/>
  <table>
    <tr>
      <th>Id</th>
      <th>Nazwa</th>
      <th>Opis</th>
      <th>Action</th>
    </tr>
    <c:forEach items="${institutions}" var="i">
      <tr>
        <td>${i.id}</td>
        <td>${i.name}</td>
        <td>${i.description}</td>
        <td><a href="/admin/institution/create?id=${i.id}">edytuj</a></td>
        <td><a href="/admin/institution/delete/${i.id}">kasuj</a></td>
      </tr>
    </c:forEach>
  </table>
</section>

<jsp:include page="../components/footer.jsp"/>
</body>
</html>