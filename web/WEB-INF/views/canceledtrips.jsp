<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 16.04.2017
  Time: 02:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Возвращённые заказы</title>
    <link rel='stylesheet' type='text/css' href="<c:url value="/resources/css/style.css"/> ">
</head>
<body>

<jsp:include page="locales.jsp"></jsp:include>
<jsp:include page="login.jsp"></jsp:include>

<form method="post" action="private-office" name="futuretrips">
    <input type = "submit" name = "Submit" value = "Совершённые поездки" >
</form>

<form method="post" action="future-trips" name="canceledtrips">
    <input type = "submit" name = "Submit" value = "Предстоящие поездки" >
</form>

<h3>Возвращённые заказы</h3>
<c:if test="${not empty canceledTrips}">
    <table>
        <th>№ Заказа</th>
        <th>Дата/Время заказа</th>
        <th>Дата/Время поездки</th>
        <th>Маршрут</th>
        <th>№ Поезда</th>
        <th>К возврату(BYN)</th>
        <th>Состояние заказа</th>

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
