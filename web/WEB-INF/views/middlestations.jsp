<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 16.03.2017
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <html>
    <head>
        <title><spring:message code="middlestations.page.title"/></title>
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
<br/>
<br/>
<br/>
<table>
    <th><spring:message code="middlestations.page.trainnumber.label"/></th><!--Номер поезда-->
    <th><spring:message code="middlestations.page.station.label"/></th><!--Станция-->
    <th><spring:message code="middlestations.page.timearrive.label"/></th><!--Время прибытия-->
    <th><spring:message code="middlestations.page.timedeparture.label"/></th><!--Время отправления-->
    <th><spring:message code="middlestations.page.timestanding.label"/></th><!--Время стоянки-->
    <th><spring:message code="middlestations.page.distance.label"/></th><!--Расстояние-->
    <c:forEach var="middlestations" items="${stations}" varStatus="status">
    <tr>
        <td> <c:out value="${ middlestations.numberTrain }" /></td>
        <td> <c:out value="${ middlestations.name }" /></td>
        <td> <c:out value="${ middlestations.timeArrive }" /></td>
        <td> <c:out value="${ middlestations.timeDeparture }" /></td>
        <td> <c:out value="${ middlestations.timeStanding }" /></td>
        <td> <c:out value="${ middlestations.distance }" /></td>
        </c:forEach>
    </tr>
</table>
</body>
</html>
