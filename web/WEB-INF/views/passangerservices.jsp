<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 12.03.2017
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Пассажирские услуги</title>
    <link rel='stylesheet' type='text/css' href='/css/style.css'>
</head>
<body>



<form action="byebook" method="post" name="servicesForm">
<button name="action" value="bye-book-action" onclick="submit()">
   Покупка билетов онлайн
</button>     <!--На  byebook.jsp-->
<button name="action"  value="points-sale-action" onclick="submit()">
   Пункты продажи проездных документов
</button>
</form>
</body>
</html>
