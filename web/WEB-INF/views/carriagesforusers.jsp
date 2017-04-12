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
</head>
<body>
<span style="float: right">
     <a href="?lang=ru"> <spring:message code="application.rusLocale" /></a>
     <a href="?lang=en">  <spring:message code="application.enLocale" /></a>

    </span>
<form action = "/controller.html" method = "post" name="myFormCarriage" id="myFormCarriage">
    ${ sessionScope.trainParam.department }
    <br>
    ${ sessionScope.trainParam.arrive }
    <br>
    ${ sessionScope.trainParam.date }
        <br>
    ${sessionScope.trainId}
    <table>
        <th><spring:message code="carriagesforusers.page.carnum.label"/> </th><!--Номер вагона-->
        <th><spring:message code="carriagesforusers.page.countsears.label"/> </th><!--количество свободных мест-->

        <c:forEach var="carriages" items="${requestScope.carriages}" varStatus="status">
        <tr>
            <td>  <c:out value="${carriages.number}" /></td>
            <td><c:out value="${ carriages.countAvailableseats }" /></td>
            <td>  <button name="carriage" value="${carriages.idCarriage}" class ="href" value="${trains.idTrain}" onClick="document.getElementById('myFormCarriage').submit()">
            <spring:message code="carriagesforusers.page.choose.button"/>
            </button></td>
            </c:forEach>
        </tr>

    </table>
    <input type="hidden" name="action" value="find-carriages-action" >
</form>

</body>
</html>

