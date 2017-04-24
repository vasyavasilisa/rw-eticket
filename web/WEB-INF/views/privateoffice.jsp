<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 15.04.2017
  Time: 22:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
    <title><spring:message code="privateOffice.page.title" /></title>
    <link rel='stylesheet' type='text/css' href="<c:url value="/resources/css/style.css"/> ">
</head>
<body>
<jsp:include page="locales.jsp"></jsp:include>
<jsp:include page="login.jsp"></jsp:include>


<ul id="breadcrumbs-one"><!-- Меню-->
    <li>
        <form action="main" method="post"  name="startForm">
            <button> <spring:message code="start.page.main.button" /></button>
    </form></li>

    <li>
        <form action="passenger-services" method="post"  name="startForm">
            <button  name="action"  value="passenger-services-action" onclick="submit ()">
                <spring:message code="start.page.forpassages.button" />
            </button>
            <!--На  passangerservices.jsp-->
        </form>
    </li>

    <li>
        <form method="post"   action="private-office">
            <button class="current" name = "Submit" onclick="submit ()" value = "">
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



<form method="post" action="future-trips" name="futuretrips">
    <input type = "submit" name = "Submit" value = "<spring:message code="privateOffice.page.futureTrips.button" />" >
    </form>

    <form method="post" action="canceled-orders" name="canceledtrips">
        <input type = "submit" name = "Submit" value = "<spring:message code="privateOffice.page.canceledTrips.button" />" >
        </form>
<h3><spring:message code="privateOffice.page.completedTrips.label" /></h3>
<c:if test="${not empty completedTrips}">
 <table>
     <th><spring:message code="privateOffice.page.orderNumber.label" /></th>
     <th><spring:message code="privateOffice.page.dateTimeOrder.label" /></th>
     <th><spring:message code="privateOffice.page.dateTimeTrip.label" /></th>
     <th><spring:message code="privateOffice.page.rout.label" /></th>
     <th><spring:message code="privateOffice.page.trainNumber.label" /></th>
     <th><spring:message code="privateOffice.page.price.label" /></th>
     <th><spring:message code="privateOffice.page.orderStatus.label" /></th>

<c:forEach var="completedTrips" items="${completedTrips}" varStatus="status">
    <tr>
        <td><c:out value="${ completedTrips.ticketNumber}" /></td>
        <td><c:out value="${ completedTrips.datetimeCreation}" /></td>
        <td><c:out value="${ completedTrips.dateDeparture}" />&nbsp;<c:out value="${ completedTrips.timeDeparture}" /></td>
        <td><c:out value="${ completedTrips.rout}" /></td>
        <td><c:out value="${ completedTrips.trainNumber}" /></td>
        <td><c:out value="${ completedTrips.price}" /></td>
        <td><c:out value="${ completedTrips.status}" /></td>

</tr>
    </c:forEach>
    </table>
</c:if>
<c:if test="${empty completedTrips}">
    <h3><spring:message code="privateOffice.page.onoInfo.label" /></h3>
</c:if>
</body>
</html>
