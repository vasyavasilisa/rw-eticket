<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 04.05.2017
  Time: 11:38
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
            <button name="action"  value=""  onclick="submit ()">
                Управление
            </button>
        </form>
    </li>

    <li>
        <form method="post"   action="report">
            <button name = "Submit" class="current" onclick="submit ()" value = "">
                Отчётность
            </button>
        </form>
    </li>
</ul>
<br/>
<br/>
<br/>
<br/>
<form action="report" method="post">
     <span style="color: steelblue">Введите номер поезда, по которому хтите получить отчёт</span><br/>
    <br/>
    <input type="text" name="train"/><br/>
    <br/>
    <span style="color: steelblue"> Введите дату отправления поезда</span><br/>
    <br/>
    <input type="date" name="date"/><br/><br/>
    <button  class="orange" onclick="submit ()">
        Получить отчёт
    </button>
</form>

<c:if test="${requestScope.report!=null}">

<table width="90%">
    <th>Номер поезда</th>
    <th>Номер билета</th><!--Номер поезда-->
    <th>Фамилия пассажира</th><!--Номер поезда-->
    <th>Имя</th><!--Станция-->
    <th>Номер паспорта</th><!--Время прибытия-->
    <th>Вагон</th><!--Время отправления-->
    <th>Место</th><!--Расстояние-->
    <c:forEach var="report" items="${requestScope.report}" varStatus="status">
    <tr>
        <td> <c:out value="${ report.trainNumber }" /></td>
        <td> <c:out value="${ report.ticketNumber }" /></td>
        <td> <c:out value="${ report.passangerSurname }" /></td>
        <td> <c:out value="${ report.passangerName }" /></td>
        <td> <c:out value="${ report.passportNumber}" /></td>
        <td> <c:out value="${ report.carriageNumber }" /></td>
        <td> <c:out value="${ report.placeNumber }" /></td>
    </tr>
        </c:forEach>

</table>
</c:if>
</body>
</html>
