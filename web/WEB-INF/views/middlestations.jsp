<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 16.03.2017
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <html>
    <head>
        <title>Промежуточные станции</title>
    </head>
<body>

<table>
    <th>Номер поезда</th>
    <th>Станция</th>
    <th>Время прибытия</th>
    <th>Время отправления</th>
    <th>Время стоянки</th>
    <th>Расстояние</th>
    <c:forEach var="middlestations" items="${stations}" varStatus="status">
    <tr>
        <td> <c:out value="${ middlestations.numberTrain }" /></td>
        <td> <c:out value="${ middlestations.name }" /></td>
        <td> <c:out value="${ middlestations.timeDeparture }" /></td>
        <td> <c:out value="${ middlestations.timeArrive }" /></td>
        <td> <c:out value="${ middlestations.timeStanding }" /></td>
        <td> <c:out value="${ middlestations.distance }" /></td>
        </c:forEach>
    </tr>
</table>
</body>
</html>
