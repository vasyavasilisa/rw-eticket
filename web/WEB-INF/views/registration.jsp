
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

<ul id="breadcrumbs-one"><!-- Меню-->
    <li>   <form action="main" method="post"  name="startForm">
        <button> <spring:message code="start.page.main.button" /></button>
    </form></li>

    <li>
        <form action="passenger-services" method="post"  name="startForm">
            <button  name="action"  value="passenger-services-action" onclick="submit ()">
                <spring:message code="start.page.forpassages.button" />
            </button>
            <!--На  passangerservices.jsp-->
        </form>
    </li>

    <li>
        <form method="post"   action="private-office">
            <button name = "Submit" onclick="submit ()" value = "">
                <spring:message code="start.page.account.button" />
            </button>
        </form>
    </li>


    <li>
        <form method="post"   action="about-us"><!--О нас-->
            <button name = "Submit"  onclick="submit ()" value = "" >
                <spring:message code="start.page.aboutUs.button" />
            </button>
        </form>
    </li>

    <li>
        <form method="post"   action="feedbacks"><!--Отзывы -->
            <button name = "Submit"  onclick="submit ()" value = "" >
                <spring:message code="start.page.feedbacks.button" />&nbsp; ${sessionScope.colFeedbacks}
            </button>
        </form>
    </li>
</ul>


<br/>
<br/>
<br/>
<br/>

<form:form method="post"  modelAttribute="user"  name="form_reg" action="registration">
    <span class="necessar"> *  <spring:message code="registration.page.surname" />:</span> <br />
    <form:input path="surname"  size="25" maxlength="30" value="" /> <br />
    <form:errors path="surname" cssClass="error"/>
    <br />
    <span class="necessar"> * <spring:message code="registration.page.name" />:</span> <br />
    <form:input path="name" size="25" maxlength="30" value="" /> <br />
    <form:errors path="name" cssClass="error"/>
    <br />
    <spring:message code="registration.page.lastname" />: <br />
    <form:input path="lastname"  size="25" maxlength="30" value="" /> <br />
    <span class="necessar"> * <spring:message code="registration.page.phone" />:</span> <br />
    <form:input path="phone"  size="25" maxlength="30" value="" /> <br />
    <form:errors path="phone" cssClass="error"/>
    <br />
    <span class="necessar"> * <spring:message code="registration.page.email" />:</span> <br />
    <form:input path="email"  size="25" maxlength="30" value="" /> <br />
    <form:errors path="email" cssClass="error"/>
    <br />
    <span class="necessar"> *  <spring:message code="registration.page.gender" />:</span> <br />
    <form:radiobutton path="gender"   checked="checked" value="мужской"/> <spring:message code="registration.page.male" /><br />
    <form:radiobutton path="gender"   value="женский"/> <spring:message code="registration.page.female" /><br />
    <span class="necessar"> *  <spring:message code="registration.page.login" />:</span> <br />
    <form:input path="login"  value=""/><br />
    <form:errors path="login" cssClass="error"/>
    <br />
    <span class="necessar"> *  <spring:message code="registration.page.pass" />:</span> <br />
    <form:password path="password"   value=""/><br />
    <form:errors path="password" cssClass="error"/>
    <br />
    <span class="necessar"> *  <spring:message code="registration.page.passConfirm" />:</span> <br />
    <input name="pass_repeat" type="password"  value=""/><br />


    <br />
    <input type="submit" name="register" value=" <spring:message code="registration.page.reg.button" />" />
</form:form>
</body>
</html>
