<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 13.04.2017
  Time: 00:29
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel='stylesheet' type='text/css' href="<c:url value="/resources/css/style.css"/> ">
<html>
<head>
    <title>Места</title>
    <link rel='stylesheet' type='text/css' href="<c:url value="/resources/css/style.css"/> ">

</head>
<body>


<jsp:include page="locales.jsp"></jsp:include>
<jsp:include page="login.jsp"></jsp:include>

Маршрут следования пассажира: ${ sessionScope.trainParam.department } - ${ sessionScope.trainParam.arrive }
<br/>
Дата отправления:
${ sessionScope.trainParam.date }
<br/>
<!--${ sessionScope.carriage.idCarriageOfTrain }-->
Номер вагона:
${ sessionScope.carriage.number }
<br/>
Тип вагона:
${ sessionScope.carriage.type }
<br/>
<h3>Укажите данные о пассажирах</h3>


<form method="post" action="bye" id="myForm">

    <label for="id_count">Количество пассажиров</label>
    <select onchange="addPassanger()" name="count" id="id_count">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
    </select>

    <div id="pass1">
    <h4>Пассажир:1</h4>
   Фамилия:
    <input type="text" name="surname" id="id_surname"  value="">
    <br/>
    Имя:
    <input type="text" name="name" id="id_name"  value="">
    <br/>
    Номер паспорта:
    <input type="text" name="passport" id="id_passport"  value="">
    <br/>
    </div>
    <div id="passN">
    </div>
    <h3>Выбор мест</h3>

    <table>
        <!--th>id Места</th-->
        <th>Номер места</th>
        <th>Тип места</th>
        <th>Статус места</th>
        <th>Стоимость</th>
        <c:forEach var="places" items="${places}" varStatus="status">
        <tr>
            <!--td>  <c:out value="${ places.idPlace }" /></td-->
            <td><c:out value="${ places.number }" /></td>
            <td> <c:out value="${ places.type }" /></td>
            <td> <c:out value="${ places.status }" /></td>
            <td> <c:out value="${ places.cost }" /></td>
            <td> <input type="checkbox" name="place"  value="${ places.idPlace }/${ places.cost }/${ places.number }" ></td>
            </c:forEach>
        </tr>

    </table>
    <input type = "submit" name = "Submit" value = "Купить билет">
</form>
<script type="text/javascript" src="<c:url value="/resources/js/script.js"/>"></script>
</body>
</html>
