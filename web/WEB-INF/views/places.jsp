<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 13.04.2017
  Time: 00:29
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel='stylesheet' type='text/css' href="<c:url value="/resources/css/style.css"/> ">
<html>
<head>
    <title><spring:message code="places.page.title" /></title>
    <link rel='stylesheet' type='text/css' href="<c:url value="/resources/css/style.css"/> ">

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
                <spring:message code="start.page.feedbacks.button" />&nbsp; ${sessionScope.colFeedbacks}
            </button>
        </form>
    </li>
</ul>

<br/>
<div class="submenu">
    <div class="subbox">
        <div class="text" ><a href="#" ><spring:message code="start.page.submenu.rout" /></a></div >
    </div>
    <div class="subbox" >
        <div class="text" ><a href="#" ><spring:message code="start.page.submenu.train" /></a></div>
    </div >
    <div class="subbox">
        <div class="text" ><a href="#" ><spring:message code="start.page.submenu.carriage" /></a></div>
    </div >
    <div class="cursubbox">
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
<spring:message code="places.page.rout.label" />: ${ sessionScope.trainParam.department } - ${ sessionScope.trainParam.arrive }
<br/>
<spring:message code="places.page.dateDeparture.label" />:
${ sessionScope.trainParam.date }
<br/>
<!--${ sessionScope.carriage.idCarriageOfTrain }-->
<spring:message code="places.page.carriageNum.label" />:
${ sessionScope.carriage.number }
<br/>
<spring:message code="places.page.carriageType.label" />:
${ sessionScope.carriage.type }
<br/>
<h3><spring:message code="places.page.passangerData.label" /></h3>


<form method="post" action="bye" id="myForm">

    <label for="id_count"><spring:message code="places.page.passangerCount.label" /></label>
    <select onchange="addPassanger()" name="count" id="id_count">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
    </select>

    <div id="pass1">
    <h4><spring:message code="places.page.passanger.label" />:1</h4>
        <spring:message code="places.page.passangerSurname.label" />:
    <input type="text" name="surname" id="id_surname"  value="">
    <br/>
        <spring:message code="places.page.passangerName.label" />:
    <input type="text" name="name" id="id_name"  value="">
    <br/>
        <spring:message code="places.page.passangerPassport.label" />:
    <input type="text" name="passport" id="id_passport"  value="">
    <br/>
    </div>
    <div id="passN">
    </div>
    <h3> <spring:message code="places.page.choosePlace.label" /></h3>

    <table>
        <!--th>id Места</th-->
        <th><spring:message code="places.page.placeNumber.label" /></th>
        <th><spring:message code="places.page.placeType.label" /></th>
        <!--th>Статус места</th-->
        <th><spring:message code="places.page.costPlace.label" /></th>
        <c:forEach var="places" items="${places}" varStatus="status">
        <tr>
            <!--td>  <c:out value="${ places.idPlace }" /></td-->
            <td><c:out value="${ places.number }" /></td>
            <td> <c:out value="${ places.type }" /></td>
            <!--td> <c:out value="${ places.status }" /></td-->
            <td> <c:out value="${ places.cost }" /></td>
            <td> <input type="checkbox" name="place"  value="${ places.idPlace }/${ places.cost }/${ places.number }" ></td>
            </c:forEach>
        </tr>

    </table>
    <input type = "submit" name = "bye" value = "<spring:message code="places.page.byeTicket.button" />">
    <input type = "submit" name = "book" value = "<spring:message code="places.page.book.button" />">
</form>
<script type="text/javascript" src="<c:url value="/resources/js/script.js"/>"></script>
</body>
</html>
