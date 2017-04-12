<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 11.04.2017
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="authhref">
<form action="login" method="post" id="idForm" style="float: right">

    <c:choose>
        <c:when test="${sessionScope.user.surname !=  null}">
            <div class="auth">
                Добро пожаловать, ${sessionScope.user.surname}&nbsp;${sessionScope.user.name}&nbsp;(${sessionScope.user.login})&nbsp;
                <img src="<c:url value="/resources/images/bg_status.gif" />" alt="Картинка">&nbsp;&nbsp;
                <button name="auth"   class ="href" value="logout" onClick="document.getElementById(' idForm').submit()" >Выход в системы</button>
            </div>

        </c:when>
        <c:otherwise>
            <div class="auth">
                <img src="<c:url value="/resources/images/bg_status.gif" />"alt="Картинка">&nbsp;&nbsp;
                <button name="auth"    class ="href" value="login" onClick="document.getElementById(' idForm').submit()" >Вход в систему</button>|
                <button name="auth"    class ="href" value="registration" onClick="document.getElementById(' idForm').submit()" >Регистрация</button>
            </div>
        </c:otherwise>
    </c:choose>
</form>
</div>