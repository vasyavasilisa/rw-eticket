<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 04.05.2017
  Time: 01:56
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
<form method="post" action="delete-station" id="myForm">

    <table>
        <th><spring:message code="middlestations.page.trainnumber.label"/></th><!--Номер поезда-->
        <th><spring:message code="middlestations.page.station.label"/></th><!--Станция-->
        <th><spring:message code="middlestations.page.timearrive.label"/></th><!--Время прибытия-->
        <th><spring:message code="middlestations.page.timedeparture.label"/></th><!--Время отправления-->
        <th><spring:message code="middlestations.page.distance.label"/></th><!--Расстояние-->
        <c:forEach var="middlestations" items="${midstations}" varStatus="status">
        <tr>
            <td> <c:out value="${ middlestations.numberTrain }" /></td>
            <td> <c:out value="${ middlestations.name }" /></td>
            <td> <c:out value="${ middlestations.timeArrive }" /></td>
            <td> <c:out value="${ middlestations.timeDeparture }" /></td>
            <td> <c:out value="${ middlestations.distance }" /></td>
            </c:forEach>
        </tr>
    </table>


</form>

<div class="add-station">
    <h4 style="color: steelblue">Добавление новой станции поезда</h4>
    <form method="post" action="add-station">
        <span style="color: steelblue">Номер поезда:</span> <span style="color: #BA0000; font-family: Verdana; font-size: 16px; font-weight: bold;"> *</span><br/>
        <select name="train" >
<c:forEach var="trains" items="${trains}" varStatus="status">
            <option value="${ trains.number }"> <c:out value="${ trains.number }" /></option>
    </c:forEach>
        </select>
        <!--input type="text" name ="number" value=""-->
        <br/>
        <span style="color: steelblue">Станция:</span> <span style="color: #BA0000; font-family: Verdana; font-size: 16px; font-weight: bold;"> *</span><br/>
    <select name="station" >
    <c:forEach var="stations" items="${stations}" varStatus="status">
        <option value="${ stations.name }"> <c:out value="${ stations.name }" /></option>
    </c:forEach>
    </select>
        <!--input type="text" name ="station" value=""-->
        <br/>
        <br/>
        <span style="color: steelblue">Время прибытия:</span> <br/>
        <input type="time" name ="timeArr" value="">
        <br/>
        <br/>
        <span style="color: steelblue">Время отправления:</span> <br/>
        <input type="time" name ="timeDep" value="">
        <br/>
        <br/>
        <span style="color: steelblue">Расстояние (м):</span> <br/>
        <input type="text" name ="distance" value="">
        <br/>
        <br/>
        <button  class="orange" onclick="submit ()">

            Добавить
        </button>
    </form>
</div>
</body>
</html>

