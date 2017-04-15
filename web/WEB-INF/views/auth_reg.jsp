<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 13.04.2017
  Time: 00:51
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Вход в систему</title>
    <link rel='stylesheet' type='text/css' href="<c:url value="/resources/css/style.css"/> ">
</head>

<jsp:include page="locales.jsp"></jsp:include>
<jsp:include page="login.jsp"></jsp:include>

<form:form modelAttribute="user" id="idForm" name="f1" method="post" action="places_check_auth">

    <c:if test="${requestScope.login_attr!=null}">
        <span class="error">
          <img src="<c:url value="/resources/images/attention_login.png" />"alt="Картинка">&nbsp;
            Заданные логин и пароль пользователя в системе не зарегистрированы. Попробуйте ввести другие данные или пройти регистрацию.
            </span>
    </c:if>
    <br />
    Логин: <br />
    <form:input path="login" size="25" maxlength="30" value="" /> <br />
    <form:errors path="login" cssClass="error"/>
    <br />

    Пароль: <br />
    <form:password path="password"  size="25" maxlength="30" value="" /> <br />
    <form:errors path="password" cssClass="error"/>
    <br />
    <input name="remember" type="checkbox" value="yes" /> Запомнить <br />
    <br />
    <button name="enter"  value="login" onClick="document.getElementById('idForm').submit()" >Войти в систему</button>|
    <button name="enter"   value="registration" onClick="document.getElementById('idForm').submit()" >Регистрация</button>

</form:form>
</body>
</html>
