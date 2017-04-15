<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 16.04.2017
  Time: 00:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Предстоящие поездки</title>
    <link rel='stylesheet' type='text/css' href="<c:url value="/resources/css/style.css"/> ">
</head>
<body>
<jsp:include page="locales.jsp"></jsp:include>
<jsp:include page="login.jsp"></jsp:include>


<form method="post" action="private-office" name="futuretrips">
    <input type = "submit" name = "Submit" value = "Совершённые поездки" >
</form>

<form method="post" action="canceled-orders" name="canceledtrips">
    <input type = "submit" name = "Submit" value = "Возвращённые заказы" >
</form>

<form method="post"   action="cancel-order" id="formForCancel">
<h3>Предстоящие поездки</h3>
<c:if test="${not empty futureTrips}">
    <table>
        <th>№ Заказа</th>
        <th>Дата/Время заказа</th>
        <th>Дата/Время поездки</th>
        <th>Дата/Время отмены заказа</th>
        <th>Маршрут</th>
        <th>№ Поезда</th>
        <th>№ Вагона</th>
        <th>№ Места</th>
        <th>Стоимость(BYN)</th>
        <th>Фамилия</th>
        <th>Имя</th>
        <th>Состояние заказа</th>

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
                    Отменить заказ
                </button> </td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<c:if test="${empty futureTrips}">
    <h3>Нет информации по предстоящим поездкам</h3>
</c:if>
</form>
</body>
</html>
