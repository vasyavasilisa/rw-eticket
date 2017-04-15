<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 15.04.2017
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Номер заказа</title>
</head>
<body>

<jsp:include page="locales.jsp"></jsp:include>
<jsp:include page="login.jsp"></jsp:include>


<h3>Заказ успешно оплачен</h3>

<h2>Номера билетов</h2>

<c:forEach var="resultTickets" items="${sessionScope.resultTickets}" varStatus="status">
    <c:out value="${ resultTickets.ticketNumber }" />
    <br/>
    </c:forEach>
<h3>
    На адрес электронной почты ${ sessionScope.user.email } было выслано письмо с уведомлением об успешной
    электронной регистрации, содержащее реквизиты заказа. Для повторного просмотра зказа перейдите в личный кабинет

<form method="post"   action="private-office">
    <input type = "submit" name = "Submit" value = "Перейти в личный кабинет" >
    </form>
</h3>
</body>
</html>
