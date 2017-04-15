<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 13.04.2017
  Time: 02:18
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
    <title>Регистрация</title>
    <link rel='stylesheet' type='text/css' href="<c:url value="/resources/css/style.css"/> ">
</head>
<body>

<jsp:include page="locales.jsp"></jsp:include>
<jsp:include page="login.jsp"></jsp:include>

<form:form method="post"  modelAttribute="user"  name="form_reg" action="places_after_reg">
    <span class="necessar"> * Фамилия:</span> <br />
    <form:input path="surname"  size="25" maxlength="30" value="" /> <br />
    <form:errors path="surname" cssClass="error"/>
    <br />
    <span class="necessar"> * Имя:</span> <br />
    <form:input path="name" size="25" maxlength="30" value="" /> <br />
    <form:errors path="name" cssClass="error"/>
    <br />
    Отчество: <br />
    <form:input path="lastname"  size="25" maxlength="30" value="" /> <br />
    <span class="necessar"> * Контактный телефон:</span> <br />
    <form:input path="phone"  size="25" maxlength="30" value="" /> <br />
    <form:errors path="phone" cssClass="error"/>
    <br />
    <span class="necessar"> * Адрес электоронной почты:</span> <br />
    <form:input path="email"  size="25" maxlength="30" value="" /> <br />
    <form:errors path="email" cssClass="error"/>
    <br />
    <span class="necessar"> * Пол:</span> <br />
    <form:radiobutton path="gender"   checked="checked" value="мужской"/>мужской<br />
    <form:radiobutton path="gender"   value="женский"/>женский<br />
    <span class="necessar"> * Логин пользователя:</span> <br />
    <form:input path="login"  value=""/><br />
    <form:errors path="login" cssClass="error"/>
    <br />
    <span class="necessar"> * Пароль:</span> <br />
    <form:password path="password"   value=""/><br />
    <form:errors path="password" cssClass="error"/>
    <br />
    <span class="necessar"> * Подтверждение пароля:</span> <br />
    <input name="pass_repeat" type="password"  value=""/><br />


    <br />
    <input type="submit" name="register" value="Зарегистрировать" />
</form:form>
</body>
</html>
