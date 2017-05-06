<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 04.05.2017
  Time: 14:28
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

    <table width="99%">
        <th>Фамилия пользователя</th><!--Номер поезда-->
        <th>Имя</th><!--Станция-->
        <th>Отчество</th><!--Станция-->
        <th>Пол</th><!--Станция-->
        <th>Телефон</th><!--Станция-->
        <th>E-mail</th><!--Станция-->
        <th>Логин</th><!--Станция-->
        <th>Пароль</th><!--Станция-->
        <th>Роль</th><!--Станция-->
        <c:forEach var="users" items="${users}" varStatus="status">
            <tr>
                <td> <c:out value="${ users.surname }" /></td>
                <td> <c:out value="${ users.name }" /></td>
                <td><c:out value="${ users.lastname}" /></td>
                <td> <c:out value="${ users.gender}" /></td>
                <td> <c:out value="${ users.phone }" /></td>
                <td> <c:out value="${ users.email }" /></td>
                <td> <c:out value="${ users.login }" /></td>
                <td> <c:out value="${ users.password }" /></td>
                <td> <c:out value="${ users.role }" /></td>
                <td>
                    <form action="delete-user" method="post">
                        <input type="image"  width="40px"  height="40px" src="<c:url value="/resources/images/del.png"/>" name="idUser" value="${ users.idUser }">
                    </form>
                </td>
                <td>
                    <form action="show-history" method="post">
                        <input type="hidden" name="login" value="${ users.login }">
                        <button name = "idUser"  class="orange" onclick="submit()" value = "${ users.idUser }">
                         История заказов
                        </button>
                    </form>
                </td>
            </tr>
        </c:forEach>

    </table>

</body>
</html>
