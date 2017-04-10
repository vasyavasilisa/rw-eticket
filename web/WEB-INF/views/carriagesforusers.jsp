<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 16.03.2017
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="msgs" var="msgs" />
<html>
<head>
    <title>Выбор вагона</title>
</head>
<body>

<form action = "/controller.html" method = "post" name="myFormCarriage" id="myFormCarriage">
    ${ sessionScope.trainParam.department }
    <br>
    ${ sessionScope.trainParam.arrive }
    <br>
    ${ sessionScope.trainParam.date }
        <br>
    ${sessionScope.trainId}
    <table>
        <th>Номер вагона </th>
        <th>Количество свободных мест</th>

        <c:forEach var="carriages" items="${requestScope.carriages}" varStatus="status">
        <tr>
            <td>  <c:out value="${carriages.number}" /></td>
            <td><c:out value="${ carriages.countAvailableseats }" /></td>
            <td>  <button name="carriage" value="${carriages.idCarriage}" class ="href" value="${trains.idTrain}" onClick="document.getElementById('myFormCarriage').submit()">Выбрать</button></td>
            </c:forEach>
        </tr>

    </table>
    <input type="hidden" name="action" value="find-carriages-action" >
</form>

</body>
</html>

