<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 26.04.2017
  Time: 01:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
    <title>Title</title>
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
            <button name="action" value="passenger-services-action" onclick="submit ()">
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
            <button name = "Submit" class="current"  onclick="submit ()" value = "" >
                <spring:message code="start.page.feedbacks.button" />
            </button>
        </form>
    </li>
</ul>


<br/>
<br/>
<c:forEach var="feedbacks" items="${feedbacks}" varStatus="status">
<div class="feedbacks">
  <img src="<c:url value="/resources/images/ic_info.gif" />">&nbsp; <span class="login"> <c:out value="${ feedbacks.usersByIdUser.login }" /></span>
   <br/>
    <c:out value="${ feedbacks.text }" />
</div>
    </c:forEach>

</body>
</html>
