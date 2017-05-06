<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 16.03.2017
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="msgs" var="msgs" />
<html>
<head>
    <title><spring:message code="carriagesforusers.page.title" /></title>
    <link rel='stylesheet' type='text/css' href="<c:url value="/resources/css/style.css"/> ">
</head>
<body bgcolor="#EFEFEF">

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
    <div class="cursubbox">
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
<br/>
<br/>
<br/>
<form action = "places" method = "post" name="myFormCarriage" id="myFormCarriage">
  <span style="font-style: italic"> Станция отправления:</span> ${ sessionScope.trainParam.department }
    <br>
  <span style="font-style: italic">Станция назначения: </span> ${ sessionScope.trainParam.arrive }
    <br>
   <span style="font-style: italic"> Дата отправления: </span> ${ sessionScope.trainParam.date }

    <table class="table_col">
        <th><spring:message code="carriagesforusers.page.carnum.label"/> </th><!--Номер вагона-->
        <th><spring:message code="carriagesforusers.page.type.label"/> </th><!--Тип вагона-->
        <th><spring:message code="carriagesforusers.page.countsears.label"/> </th><!--количество свободных мест-->

        <c:forEach var="carriages" items="${requestScope.carriages}" varStatus="status">
        <tr>
            <td>  <c:out value="${carriages.number}" /></td>
            <td>  <c:out value="${carriages.type}" /></td>
            <td><c:out value="${ carriages.countAvailableseats }" /></td>
            <td>  <button name="carriage" value="${carriages.idCarriage}" class ="href"  onClick="document.getElementById('myFormCarriage').submit()">
            <spring:message code="carriagesforusers.page.choose.button"/>
            </button></td>
            </c:forEach>
        </tr>

    </table>
    <input type="hidden" name="action" value="find-carriages-action" >
</form>

</body>
</html>

