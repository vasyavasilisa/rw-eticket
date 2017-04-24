<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 14.03.2017
  Time: 00:36
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title><spring:message code="findtrains.page.title" /></title>
    <link rel='stylesheet' type='text/css' href="<c:url value="/resources/css/style.css"/> ">
    <script src="js/main.js"></script>
    <script>
        window.onload=function(){
            if(document.getElementsByName("sort")[0].disabled==true){
                document.getElementsByName("sort")[0].checked=true;
            }
            else if(document.getElementsByName("sort")[1].disabled==true){
                document.getElementsByName("sort")[1].checked=true;
            }
        }
    </script>
</head>
<body>

<jsp:include page="locales.jsp"></jsp:include>
<jsp:include page="login.jsp"></jsp:include>

<ul id="breadcrumbs-one"><!-- Меню-->
    <li>   <form action="main" method="post"  name="startForm">
        <button> <spring:message code="start.page.main.button" /></button>
    </form></li>

    <li>
        <form action="passenger-services" method="post"  name="startForm">
            <button name="action" class="current" value="passenger-services-action" onclick="submit ()">
                <spring:message code="start.page.forpassages.button" />
            </button>
            <!--На  passangerservices.jsp-->
        </form>
    </li>

    <li>
        <form method="post"   action="private-office">
            <button   name = "Submit" onclick="submit ()" value = "">
                <spring:message code="start.page.account.button" />
            </button>
        </form>
    </li>


    <li>
        <form method="post"   action="about-us"><!--О нас-->
            <button name = "Submit"  onclick="submit ()" value = "" >
                <spring:message code="start.page.aboutUs.button" />
            </button>
        </form>
    </li>

    <li>
        <form method="post"   action="feedbacks"><!--Отзывы -->
            <button name = "Submit"  onclick="submit ()" value = "" >
                <spring:message code="start.page.feedbacks.button" />
            </button>
        </form>
    </li>
</ul>

<div class="submenu">
    <div class="subbox">
        <div class="text" ><a href="#" ><spring:message code="start.page.submenu.rout" /></a></div >
    </div>
    <div class="cursubbox" >
        <div class="text" ><a href="#" ><spring:message code="start.page.submenu.train" /></a></div>
    </div >
    <div class="subbox">
        <div class="text" ><a href="#" ><spring:message code="start.page.submenu.carriage" /></a></div>
    </div >
    <div class="subbox">
        <div class="text" ><a href="#" ><spring:message code="start.page.submenu.passanger" /></a></div>
    </div >
    <div class="subbox">
        <div class="text" ><a href="#" ><spring:message code="start.page.submenu.confirm" /></a></div>
    </div >

    <div class="subbox">
        <div class="text"> <a href="#" ><spring:message code="start.page.submenu.order" /></a></div>
    </div >
</div>

<br/>
<form method="post" action="trains-info" id="myForm">

    ${ sessionScope.trainParam.department }
    <br>
    ${ sessionScope.trainParam.arrive }
        <br>
        ${ sessionScope.trainParam.date }

    <table>
        <th><spring:message code="findtrains.page.numbertrain.label" /></th><!--Номер поезда-->
        <th><spring:message code="findtrains.page.rout.label" /></th><!--Маршрут-->
        <th><spring:message code="findtrains.page.timedep.label" /></th><!--Время отправления-->
        <th><spring:message code="findtrains.page.timearr.label" /></th><!--Время прибытия-->
        <th><spring:message code="findtrains.page.timetravel.label" /></th><!--Время ов пути-->
        <th><spring:message code="findtrains.page.countseats.label" /></th><!--Количество свободных мест-->
        <c:forEach var="trains" items="${trains}" varStatus="status">
        <tr>
            <td>  <c:out value="${ trains.number }" /></td>
            <td>  <button name="middlestations"    class ="href" value="${trains.idTrain}" onClick="document.getElementById('myForm').submit()" >${trains.nameTrain}</button></td>
            <td><c:out value="${ trains.timeDeparture }" /></td>
            <td> <c:out value="${ trains.timeArrive }" /></td>
            <td> <c:out value="${ trains.travelTime }" /></td>
            <td> <c:out value="${ trains.numberOfAvailSeats }" /></td>
            <td > <input type="radio" onclick="javascript: submit()" name="idTrain"  value="${trains.idTrain}" /> </td>
            </c:forEach>
        </tr>

    </table>
    <input type="hidden" name="action" value="find-carriages-action" >
</form>

<form action="trains-sort" method="post">
<c:choose>
    <c:when test="${requestScope.checkbox != null}">
    <c:choose>
        <c:when test="${requestScope.checkbox=='sortTimeDep'}">
            <input type="radio"  name="sort"  value="sorttimetravel" onclick="javascript: submit()" >
            <spring:message code="findtrains.page.sorttimetravel.label" />
            <input type="radio" name="sort" disabled value="sorttimedeparture" onclick="javascript: submit()" >
            <spring:message code="findtrains.page.sorttimedep.label" />
        </c:when>
        <c:when test="${requestScope.checkbox=='sortTimeTravel'}">
            <input type="radio"  name="sort" disabled value="sorttimetravel" onclick="javascript: submit()" >
            <spring:message code="findtrains.page.sorttimetravel.label" />
            <input type="radio" name="sort"  value="sorttimedeparture" onclick="javascript: submit()" >
            <spring:message code="findtrains.page.sorttimedep.label" />
        </c:when>
    </c:choose>
    </c:when>
    <c:otherwise>
        <input type="radio"  name="sort"  value="sorttimetravel" onclick="javascript: submit()" >
        <spring:message code="findtrains.page.sorttimetravel.label" />
        <input type="radio" name="sort"  value="sorttimedeparture" onclick="javascript: submit()" >
        <spring:message code="findtrains.page.sorttimedep.label" />
    </c:otherwise>
</c:choose>


<input type="hidden"  name="action"  value="sotr-trains-action">
    <input type="hidden"   name="date" value="${sessionScope.trainParam.date}">
    <input type="hidden" name="stationdeparture" value="${sessionScope.trainParam.department}">
    <input type="hidden" name="stationarrive" value="${sessionScope.trainParam.arrive}">
    <!--INPUT TYPE="RESET" onclick="resetform()" VALUE ="Сбросить"-->
</form>

</body>
</html>
