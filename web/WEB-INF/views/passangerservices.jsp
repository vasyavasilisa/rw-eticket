<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 12.03.2017
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title><spring:message code="passangerservices.page.title"/></title>
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
            <button  class="current" name="action"  value="passenger-services-action" onclick="submit ()">
                <spring:message code="start.page.forpassages.button" />
            </button>
            <!--На  passangerservices.jsp-->
        </form>
    </li>

    <li>
        <form method="post"   action="private-office">
            <button name = "Submit" onclick="submit ()" value = "">
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
<br/>
<br/>
<br/>

<div class="train-im">
</div>
<div class="side">
    <img src="<c:url value="/resources/images/pass1.png" />"alt="Картинка">
<form action="byebook" method="post" name="servicesForm">
<button name="action" value="bye-book-action" onclick="submit()">
    <spring:message code="passangerservices.page.byebook.button"/>
</button>     <!--На  byebook.jsp-->
    </form>
    <img src="<c:url value="/resources/images/dp3_20141.png" />"alt="Картинка">
<form action="byebook" method="post" name="servicesForm">
<button name="action"  value="points-sale-action" onclick="submit()">
    <spring:message code="passangerservices.page.pointsforsale.button"/>
</button>
</form>
    <img src="<c:url value="/resources/images/tea.png" />"alt="Картинка">
    <form action="fill-feedback" method="post" name="servicesForm"><!--Кнопка отзываов-->
    <button name="action"  value="points-sale-action" onclick="submit()">
        <spring:message code="passangerservices.page.feedback.button"/>
    </button>
</form>
</div>
</body>
</html>
