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


<form action="byebook" method="post" name="servicesForm">
<button name="action" value="bye-book-action" onclick="submit()">
    <spring:message code="passangerservices.page.byebook.button"/>
</button>     <!--На  byebook.jsp-->
<button name="action"  value="points-sale-action" onclick="submit()">
    <spring:message code="passangerservices.page.pointsforsale.button"/>
</button>
</form>
</body>
</html>
