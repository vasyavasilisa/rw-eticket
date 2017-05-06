<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 03.05.2017
  Time: 22:52
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
<form method="post" action="delete-train" id="myForm">

    <table>
        <th><spring:message code="findtrains.page.numbertrain.label" /></th><!--Номер поезда-->
        <th><spring:message code="findtrains.page.rout.label" /></th><!--Маршрут-->
        <c:forEach var="trains" items="${trains}" varStatus="status">
        <tr>
            <td>  <c:out value="${ trains.number }" /></td>
            <td>  <c:out value=" ${trains.nameTrain}"/></td>
            <td >  <button class="orange" name ="idTrain" value="${trains.idTrain}" onclick="submit ()">
                Удалить
            </button></td>
            </c:forEach>
        </tr>

    </table>

</form>

<div class="add-train">
    <h4 style="color: steelblue">Добавление нового поезда</h4>
    <form method="post" action="add-train">
        <span style="color: steelblue">Номер поезда:</span> <br/>
        <input type="text" name ="number" value="">
        <br/>
        <br/>
        <span style="color: steelblue"> Маршрут:</span> <br/>
        <input type="text" name ="rout" value="">
        <br/>
        <br/>
        <button  class="orange" onclick="submit ()">
           Добавить
        </button>
    </form>
</div>
</body>
</html>
