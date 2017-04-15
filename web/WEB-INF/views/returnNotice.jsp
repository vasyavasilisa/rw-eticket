<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 16.04.2017
  Time: 02:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Уведомление о возврате</title>
</head>
<body>
Заказ № ${requestScope.ticketNumber} был успешно отменён.
На адрес электроной почты ${ user.email} было отправлено письмо с уведомлением об успешной отмене заказа
</body>
</html>
