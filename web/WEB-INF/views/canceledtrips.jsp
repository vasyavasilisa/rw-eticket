<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 16.04.2017
  Time: 02:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
    <title><spring:message code="canceledtrips.page.title" /></title>
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
    <input type = "submit" name = "Submit" value = "<spring:message code="canceledtrips.page.completedTrips.label" />" >
</form>

<form method="post" action="future-trips" name="canceledtrips">
    <input type = "submit" name = "Submit" value = "<spring:message code="canceledtrips.page.futureTrips.label" />" >
</form>

<h3><spring:message code="canceledtrips.page.title" /></h3>
<c:if test="${not empty canceledTrips}">
    <table>
        <th><spring:message code="canceledtrips.page.orderNumber.label" /></th>
        <th><spring:message code="canceledtrips.page.dateTimeOrder.label" /></th>
        <th><spring:message code="canceledtrips.page.dateTimeTrip.label" /></th>
        <th><spring:message code="canceledtrips.page.rout.label" /></th>
        <th><spring:message code="canceledtrips.page.trainNumber.label" /></th>
        <th><spring:message code="canceledtrips.page.toReturn.label" /></th>
        <th><spring:message code="canceledtrips.page.orderStatus.label" /></th>

        <c:forEach var="canceledTrips" items="${canceledTrips}" varStatus="status">
            <tr>
                <td><c:out value="${ canceledTrips.ticketNumber}" /></td>
                <td><c:out value="${ canceledTrips.datetimeCreation}" /></td>
                <td><c:out value="${ canceledTrips.dateDeparture}" />&nbsp;<c:out value="${ canceledTrips.timeDeparture}" /></td>
                <td><c:out value="${ canceledTrips.rout}" /></td>
                <td><c:out value="${ canceledTrips.trainNumber}" /></td>
                <td><c:out value="${ canceledTrips.price}" /></td>
                <td><c:out value="${ canceledTrips.status}" /></td>

            </tr>
        </c:forEach>
    </table>
</c:if>
<c:if test="${empty canceledTrips}">
    <h3>Нет информации по возвращённым заказам</h3>
</c:if>

</body>
</html>
