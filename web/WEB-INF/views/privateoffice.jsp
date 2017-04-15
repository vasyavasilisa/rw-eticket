<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 15.04.2017
  Time: 22:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Личный кабинет</title>
    <link rel='stylesheet' type='text/css' href="<c:url value="/resources/css/style.css"/> ">
</head>
<body>
<jsp:include page="locales.jsp"></jsp:include>
<jsp:include page="login.jsp"></jsp:include>


<form method="post" action="future-trips" name="futuretrips">
    <input type = "submit" name = "Submit" value = "Предстоящие поездки" >
    </form>

    <form method="post" action="canceled-orders" name="canceledtrips">
        <input type = "submit" name = "Submit" value = "Возвращённые заказы" >
        </form>
<h3>Совершённые поездки</h3>
<c:if test="${not empty completedTrips}">
 <table>
     <th>№ Заказа</th>
     <th>Дата/Время заказа</th>
     <th>Дата/Время поездки</th>
     <th>Маршрут</th>
     <th>№ Поезда</th>
     <th>Стоимость(BYN)</th>
     <th>Состояние заказа</th>

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
    <h3>Нет информации по совершённым поездкам</h3>
</c:if>
</body>
</html>
