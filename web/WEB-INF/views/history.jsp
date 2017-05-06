<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 04.05.2017
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
    <title>Title</title> <link rel='stylesheet' type='text/css' href="<c:url value="/resources/css/style.css"/> ">
    <script src="<c:url value="/resources/js/script.js"/>"></script>
</head>
<body bgcolor="#EFEFEF">


<jsp:include page="locales.jsp"></jsp:include>
<jsp:include page="login.jsp"></jsp:include>


<ul id="breadcrumbs-one"><!-- Меню-->
    <li>
        <form action="manag" method="post"  name="manag">
            <button name="action"  value="" class="current" onclick="submit ()">
                Управление
            </button>
        </form>
    </li>

    <li>
        <form method="post"   action="form-report">
            <button name = "Submit" onclick="submit ()" value = "">
                Отчётность
            </button>
        </form>
    </li>
</ul>
<br/>
<br/>
<br/>
<br/>
<h4>Логин пользователя: ${login }</h4>

    <table width="90%">
        <th>Дата/Время заказа</th><!--Номер поезда-->
        <th>Дата/Время поездки</th><!--Маршрут-->
        <th>№ Поезда</th><!--Номер поезда-->
        <th>Маршрут следования</th><!--Маршрут-->
        <th>Стоимость(BYN)</th><!--Номер поезда-->
        <c:forEach var="tickets" items="${tickets}" varStatus="status">
        <tr >
            <td style="padding: 8px">  <c:out value=" ${tickets.datetimeCreation }" /></td>
            <td style="padding: 8px">  <c:out value=" ${tickets.dateDeparture}"/></td>
            <td style="padding: 8px">  <c:out value=" ${tickets.trainNumber }" /></td>
            <td style="padding: 8px">  <c:out value=" ${tickets.rout}"/></td>
            <td style="padding: 8px">  <c:out value=" ${tickets.price}"/></td>
        </tr>
            </c:forEach>

    </table>



</body>


</body>
</html>
