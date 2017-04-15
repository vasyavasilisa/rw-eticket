<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 15.04.2017
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Проверка реквизитов заказа</title>
</head>

<jsp:include page="locales.jsp"></jsp:include>
<jsp:include page="login.jsp"></jsp:include>

<body>
<form method="post" action="confirmorder" id="myForm">
<div class="train">
<h3>Проверка реквизитов поездки</h3>
    <table>
    <tr><td><strong>Поезд:</strong></td></td> <td>  <c:out value="${ requestScope.singleTicket.trainNumber }" /></td></tr>
    <tr><td><strong>Маршрут:</strong></td><td>  <c:out value="${ requestScope.singleTicket.rout }" /></td></tr>
    <tr><td><strong>Отправление:</strong></td><td> <c:out value="${ requestScope.singleTicket.dateDeparture }"  />&nbsp;<c:out value="${ requestScope.singleTicket.timeDeparture }"/></td></tr>
    <tr><td><strong>Прибытие:</strong></td><td><c:out value="${ requestScope.singleTicket.timeArrive }"  /></td></tr>
    <tr><td><strong>Номер вагона:</strong></td><td><c:out value="${ requestScope.singleTicket.carriageNumber }"  /></td></tr>
<tr><td><strong>Места:</strong></td><td>
<c:forEach var="resultTickets" items="${resultTickets}" varStatus="status">
    <c:out value="${ resultTickets.placeNumber}" />&nbsp;
    </c:forEach>
</table>
</div>

<div class="passangers">
<h3>Информация о пассажирах</h3>
    <table>
       <th>Пассажир</th>
        <th>№ Паспорта</th>
        <th>К оплате</th>
        <th>Валюта</th>
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

<input type = "submit" name = "Submit" value = "Подтвердить заказ">
    </form>
</body>
</html>
