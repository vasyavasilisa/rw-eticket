<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 04.05.2017
  Time: 13:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
    <title>Title</title> <link rel='stylesheet' type='text/css' href="<c:url value="/resources/css/style.css"/> ">
    <script src="<c:url value="/resources/js/script.js"/>"></script>
</head>
<body bgcolor="#EFEFEF">


<jsp:include page="locales.jsp"></jsp:include>
<jsp:include page="login.jsp"></jsp:include>


<ul id="breadcrumbs-one"><!-- Меню-->
    <li>
        <form action="manag" method="post"  name="manag">
            <button name="action"  value="" class="current" onclick="submit ()">
                Управление
            </button>
        </form>
    </li>

    <li>
        <form method="post"   action="form-report">
            <button name = "Submit" onclick="submit ()" value = "">
                Отчётность
            </button>
        </form>
    </li>
</ul>
<br/>
<br/>
<br/>
<br/>
<form action="delete-feedback" method="post">
<table>
    <th>Логин пользователя</th><!--Номер поезда-->
    <th>Отзыв</th><!--Станция-->
<c:forEach var="feedbacks" items="${feedbacks}" varStatus="status">
    <tr>
        <td> <c:out value="${ feedbacks.usersByIdUser.login }" /></td>
        <td> <c:out value="${ feedbacks.text }" /></td>
        <td><input type="image"  src="<c:url value="/resources/images/del.png"/>" name="idFeed" value="${ feedbacks.idFeedback }"></td>
        </tr>
    </c:forEach>

</table>
    </form>
</body>
</html>
