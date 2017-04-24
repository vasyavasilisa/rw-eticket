<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 15.04.2017
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
    <title><spring:message code="checkorder.page.title" /></title>
    <link rel='stylesheet' type='text/css' href="<c:url value="/resources/css/style.css"/> ">
</head>


<body>

<jsp:include page="locales.jsp"></jsp:include>
<jsp:include page="login.jsp"></jsp:include>

<ul id="breadcrumbs-one"><!-- Меню-->
    <li>   <form action="main" method="post"  name="startForm">
        <button> <spring:message code="start.page.main.button" /></button>
    </form></li>

    <li>
        <form action="passenger-services" method="post"  name="startForm">
            <button name="action" class="current" value="passenger-services-action" onclick="submit ()">
                <spring:message code="start.page.forpassages.button" />
            </button>
            <!--На  passangerservices.jsp-->
        </form>
    </li>

    <li>
        <form method="post"   action="private-office">
            <button   name = "Submit" onclick="submit ()" value = "">
                <spring:message code="start.page.account.button" />
            </button>
        </form>
    </li>


    <li>
        <form method="post"   action="about-us"><!--О нас-->
            <button name = "Submit"  onclick="submit ()" value = "" >
                <spring:message code="start.page.aboutUs.button" />
            </button>
        </form>
    </li>

    <li>
        <form method="post"   action="feedbacks"><!--Отзывы -->
            <button name = "Submit"  onclick="submit ()" value = "" >
                <spring:message code="start.page.feedbacks.button" />
            </button>
        </form>
    </li>
</ul>

<div class="submenu">
    <div class="subbox">
        <div class="text" ><a href="#" ><spring:message code="start.page.submenu.rout" /></a></div >
    </div>
    <div class="subbox" >
        <div class="text" ><a href="#" ><spring:message code="start.page.submenu.train" /></a></div>
    </div >
    <div class="subbox">
        <div class="text" ><a href="#" ><spring:message code="start.page.submenu.carriage" /></a></div>
    </div >
    <div class="subbox">
        <div class="text" ><a href="#" ><spring:message code="start.page.submenu.passanger" /></a></div>
    </div >
    <div class="cursubbox">
        <div class="text" ><a href="#" ><spring:message code="start.page.submenu.confirm" /></a></div>
    </div >
    <div class="subbox">
        <div class="text"> <a href="#" ><spring:message code="start.page.submenu.order" /></a></div>
    </div >
</div>

<form method="post" action="confirmorder" id="myForm">
<div class="train">
<h3><spring:message code="checkorder.page.checkRecvisits.label" /></h3>
    <table>
    <tr><td><strong><spring:message code="checkorder.page.train.label" />:</strong></td></td> <td>  <c:out value="${ requestScope.singleTicket.trainNumber }" /></td></tr>
    <tr><td><strong><spring:message code="checkorder.page.rout.label" />:</strong></td><td>  <c:out value="${ requestScope.singleTicket.rout }" /></td></tr>
    <tr><td><strong><spring:message code="checkorder.page.departure.label" />:</strong></td><td> <c:out value="${ requestScope.singleTicket.dateDeparture }"  />&nbsp;<c:out value="${ requestScope.singleTicket.timeDeparture }"/></td></tr>
    <tr><td><strong><spring:message code="checkorder.page.arrive.label" />:</strong></td><td><c:out value="${ requestScope.singleTicket.timeArrive }"  /></td></tr>
    <tr><td><strong><spring:message code="checkorder.page.carriage.label" />:</strong></td><td><c:out value="${ requestScope.singleTicket.carriageNumber }"  /></td></tr>
<tr><td><strong><spring:message code="checkorder.page.places.label" />:</strong></td><td>
<c:forEach var="resultTickets" items="${resultTickets}" varStatus="status">
    <c:out value="${ resultTickets.placeNumber}" />&nbsp;
    </c:forEach>
</table>
</div>

<div class="passangers">
<h3><spring:message code="checkorder.page.passangerInfo.label" /></h3>
    <table>
       <th><spring:message code="checkorder.page.passanger.label" /></th>
        <th><spring:message code="checkorder.page.passport.label" /></th>
        <th><spring:message code="checkorder.page.price.label" /></th>
        <th><spring:message code="checkorder.page.currency.label" /></th>
    <c:forEach var="resultTickets" items="${resultTickets}" varStatus="status">
    <tr>
        <td>  <c:out value="${ resultTickets.passangerSurname }" />&nbsp; <c:out value="${ resultTickets.passangerName }" /></td>
        <td>  <c:out value="${ resultTickets.passportNumber }" /></td>
        <td>  <c:out value="${ resultTickets.price }" /></td>
        <td>BYN</td>
        </tr>
        </c:forEach>
</table>
</div>

<input type = "submit" name = "Submit" value = "<spring:message code="checkorder.page.confirmOrder.button" />">
    </form>


<form action="places" method="post">
    <input type="hidden" name="carriage" value="${sessionScope.carriageId}">
<input type = "submit" name = "Submit" value = "<spring:message code="checkorder.page.back.button" />">
</form>
</body>
</html>
