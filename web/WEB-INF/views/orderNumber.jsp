<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 15.04.2017
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
    <title><spring:message code="orderNumber.page.title" /></title>
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
    <div class="subbox">
        <div class="text" ><a href="#" ><spring:message code="start.page.submenu.passanger" /></a></div>
    </div >
    <div class="subbox">
        <div class="text" ><a href="#" ><spring:message code="start.page.submenu.confirm" /></a></div>
    </div >
    <div class="cursubbox1">
        <div class="text"> <a href="#" ><spring:message code="start.page.submenu.order" /></a></div>
    </div >
</div>

<br/>
<br/>
<br/>
<h3><spring:message code="orderNumber.page.successPayment.label" /></h3>

<h2><spring:message code="orderNumber.page.ticketsNumbers.label" /></h2>

<c:forEach var="resultTickets" items="${sessionScope.resultTickets}" varStatus="status">
    <c:out value="${ resultTickets.ticketNumber }" />
    <br/>
    </c:forEach>
<h3>
    <spring:message code="orderNumber.page.text1.label" />&nbsp; ${ sessionScope.user.email }
    <spring:message code="orderNumber.page.text2.label" />

    <br/>
    <br/>
<form method="post"   action="private-office">
    <input type = "submit" class="orange" name = "Submit" value = " <spring:message code="orderNumber.page.goToPrivateCabinet.button" />" >
    </form>
</h3>
</body>
</html>
