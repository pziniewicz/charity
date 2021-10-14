<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <jsp:include page="../components/head.jsp"/>
    <title>Document</title>
    <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
            crossorigin="anonymous"></script>

</head>
<body>
<header class="header--form-page">
    <nav class="container container--70">
        <jsp:include page="../components/navuser.jsp"/>
        <jsp:include page="../components/header.jsp"/>
    </nav>

    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                Oddaj rzeczy, których już nie chcesz<br/>
                <span class="uppercase">potrzebującym</span>
            </h1>

            <div class="slogan--steps">
                <div class="slogan--steps-title">Wystarczą 4 proste kroki:</div>
                <ul class="slogan--steps-boxes">
                    <li>
                        <div><em>1</em><span>Wybierz rzeczy</span></div>
                    </li>
                    <li>
                        <div><em>2</em><span>Spakuj je w worki</span></div>
                    </li>
                    <li>
                        <div><em>3</em><span>Wybierz fundację</span></div>
                    </li>
                    <li>
                        <div><em>4</em><span>Zamów kuriera</span></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">
        <c:if test="${errors == true}">
            <div class="error">
                <h3>Popraw błędy w formularzu </h3>
            </div>
        </c:if>
        <div class="form--steps-counter">Krok <span>1</span>/5</div>

        <form:form modelAttribute="donation" action="/user/donation" method="post" id="form" htmlEscape="true">
            <!-- STEP 1: class .active is switching steps -->
            <div data-step="1" class="active">
                <h3>Zaznacz co chcesz oddać:</h3>
                <div class="error">
                    <form:errors path="categories"/>
                </div>

                <div class="form-group form-group--checkbox">
                    <form:checkboxes cssClass="checkbox" path="categories" items="${categories}" itemValue="id" itemLabel="name" />
                </div>

                <c:forEach items="${categories}" var="category">
                    <div class="form-group form-group--checkbox">
                        <label>
                            <input type="checkbox" name="category" value="${category.name}"/>
                            <span class="checkbox"></span>
                            <span class="description" >${category.name}</span>
                            <input type="hidden" class="categoriesList" value="${category.name}">
                        </label>
                    </div>
                </c:forEach>


                <div class="form-group form-group--buttons">
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 2 -->
            <div data-step="2">
                <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

                <div class="form-group form-group--inline">
                    <form:label path="quantity">Liczba 60l worków:</form:label>
                    <form:input type="number" min="1" path="quantity" id="bags"/>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>


            <!-- STEP 3 -->
            <div data-step="3">
                <h3>Wybierz organizacje, której chcesz pomóc:</h3>
                <div class="error">
                    <form:errors path="institution"/>
                </div>

                <c:forEach items="${institutions}" var="institution">
                    <div class="form-group form-group--checkbox">
                        <label>
                            <input type="radio" name="institutions"  value="${institution.id}" />
                            <span class="checkbox radio"></span>
                            <span class="description">
                                  <div class="title">${institution.name}</div>
                                  <div class="subtitle">${institution.description}</div>
                            </span>
                            <input type="hidden" class="institutionsList" value="${institution.id}">
                        </label>
                    </div>
                </c:forEach>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 4 -->
            <div data-step="4">
                <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4>Adres odbioru</h4>
                        <div class="form-group form-group--inline">
                            <div class="error"><form:errors path="street"/></div>
                            <label> Ulica <form:input type="text" name="street" path="street"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <div class="error"><form:errors path="city"/></div>
                            <label> Miasto <form:input type="text" name="city" path="city"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <div class="error"><form:errors path="zipcode"/></div>
                            <label>Kod pocztowy <form:input type="text" name="zipcode" path="zipcode"/></label>
                        </div>

                        <div class="form-group form-group--inline">
                            <div class="error"><form:errors path="phone"/></div>
                            <label>Telefon<form:input type="phone" name="phone" path="phone"/></label>
                        </div>
                    </div>

                    <div class="form-section--column">
                        <h4>Termin odbioru</h4>
                        <div class="form-group form-group--inline">
                            <div class="error"><form:errors path="pickUpDate"/></div>
                            <label> Data <form:input type="date" name="pickUpDate" path="pickUpDate"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <div class="error"><form:errors path="pickUpTime"/></div>
                            <label> Godzina <form:input type="time" name="pickUpTime" path="pickUpTime"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Uwagi dla kuriera <form:textarea name="more_info" rows="5" path="pickUpComment"/>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step" onclick="data()">Dalej</button>
                </div>
            </div>

            <!-- STEP 5 -->
            <div data-step="5">
                <h3>Podsumowanie Twojej darowizny</h3>

                <div class="summary">
                    <div class="form-section">
                        <h4>Oddajesz:</h4>
                        <ul>
                            <li>
                                <span class="icon icon-bag"></span>
                                <span class="summary--text" id="bagNumber"></span>&nbsp
                                <span class="summary--text"></span>
                                <span class="summary--text" id="categoryToDisplay"></span>
                            </li>

                            <li>
                                <span class="icon icon-hand"></span>
                                <span class="summary--text">Dla fundacji:&nbsp</span>
                                <span class="summary--text" id="institutionSelected"></span>
                            </li>
                        </ul>
                    </div>

                    <div class="form-section form-section--columns">
                        <div class="form-section--column">
                            <h4>Adres odbioru:</h4>
                            <ul id="fullAddress">
                            </ul>
                        </div>

                        <div class="form-section--column">
                            <h4>Termin odbioru:</h4>
                            <ul id="fullDetails">
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="submit" class="btn">Potwierdzam</button>
                </div>
            </div>
        </form:form>
    </div>
</section>

<jsp:include page="../components/footer.jsp"/>

</body>
</html>
