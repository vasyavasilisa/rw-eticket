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


<form:form modelAttribute="user"  name="f1" method="post" action="authorisation">

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
    <input type="submit" name="enter" value="Войти в систему" />
    </form:form>
</body>
</html>
