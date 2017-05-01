<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 16.04.2017
  Time: 00:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<html>
<head>
    <title><spring:message code="futuretrips.page.title" /></title>
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
            <button name="action"  value="passenger-services-action" onclick="submit ()">
                <spring:message code="start.page.forpassages.button" />
            </button>
            <!--На  passangerservices.jsp-->
        </form>
    </li>

    <li>
        <form method="post"   action="private-office">
            <button  class="current" name = "Submit" onclick="submit ()" value = "">
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
                <spring:message code="start.page.feedbacks.button" />&nbsp; ${sessionScope.colFeedbacks}
            </button>
        </form>
    </li>
</ul>


<br/>
<br/>
<br/>
<br/>
<form method="post" action="private-office" name="futuretrips">
    <input type = "submit" name = "Submit" value = "<spring:message code="futuretrips.page.completedTrips.button" />" >
</form>

<form method="post" action="canceled-orders" name="canceledtrips">
    <input type = "submit" name = "Submit" value = "<spring:message code="futuretrips.page.canceledTrips.button" />" >
</form>

<form method="post"   action="cancel-order" id="formForCancel">
<h3><spring:message code="futuretrips.page.title" /></h3>
<c:if test="${not empty futureTrips}">
    <table>
        <th><spring:message code="futuretrips.page.orderNumber.label" /></th>
        <th><spring:message code="futuretrips.page.dateTimeOrder.label" /></th>
        <th><spring:message code="futuretrips.page.dateTimeTrip.label" /></th>
        <th><spring:message code="futuretrips.page.dateTimeCancel.label" /></th>
        <th><spring:message code="futuretrips.page.rout.label" /></th>
        <th><spring:message code="futuretrips.page.trainNumber.label" /></th>
        <th><spring:message code="futuretrips.page.carNumber.label" /></th>
        <th><spring:message code="futuretrips.page.placeNumber.label" /></th>
        <th><spring:message code="futuretrips.page.price.label" /></th>
        <th><spring:message code="futuretrips.page.surname.label" /></th>
        <th><spring:message code="futuretrips.page.name.label" /></th>
        <th><spring:message code="futuretrips.page.orderStatus.label" /></th>
        <th><spring:message code="futuretrips.page.title" /></th>

        <c:forEach var="futureTrips" items="${futureTrips}" varStatus="status">
            <tr>
                <td><c:out value="${ futureTrips.ticketNumber}" /></td>
                <td><c:out value="${ futureTrips.datetimeCreation}" /></td>
                <td><c:out value="${ futureTrips.dateDeparture}" />&nbsp;<c:out value="${ futureTrips.timeDeparture}" /></td>
                <td><c:out value="${ futureTrips.datetimeCancel}" /></td>
                <td><c:out value="${ futureTrips.rout}" /></td>
                <td><c:out value="${ futureTrips.trainNumber}" /></td>
                <td><c:out value="${ futureTrips.carriageNumber}" /></td>
                <td><c:out value="${ futureTrips.placeNumber}" /></td>
                <td><c:out value="${ futureTrips.price}" /></td>
                <td><c:out value="${ futureTrips.passangerSurname}" /></td>
                <td><c:out value="${ futureTrips.passangerName}" /></td>
                <td><c:out value="${ futureTrips.status}" /></td>
                <td> <button name="cancel" value="${futureTrips.idTicket}"  onClick="document.getElementById('formForCancel').submit()">
                    <spring:message code="futuretrips.page.cancelOrder.button" />
                </button> </td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<c:if test="${empty futureTrips}">
    <h3> <spring:message code="futuretrips.page.noInfo.label" /></h3>
</c:if>
</form>
</body>
</html>
