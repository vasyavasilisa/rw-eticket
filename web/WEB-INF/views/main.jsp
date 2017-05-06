<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 12.03.2017
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><spring:message code="start.page.title"/></title>
    <link rel='stylesheet' type='text/css' href="<c:url value="/resources/css/style.css"/> ">
    <script src="<c:url value="/resources/js/script.js"/>"></script>
</head>
<body  bgcolor="#EFEFEF">


<jsp:include page="locales.jsp"></jsp:include>
<jsp:include page="login.jsp"></jsp:include>


<ul id="breadcrumbs-one"><!-- Меню-->
    <form action="main" method="post"  name="startForm">
          <li>  <button class="current" onclick="submit ()"> <spring:message code="start.page.main.button" /></button></li>
</form>
    <li>
<form action="passenger-services" method="post"  name="startForm">
<button name="action"  value="passenger-services-action" onclick="submit ()">
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

<div class="myfon">
</div>

<!--form method="post" action="show-video" id="video">
    <img src="<c:url value="/resources/images/tv.png" />"> &nbsp;
    <button name="video" class ="href"  onClick="document.getElementById('video').submit()" > <spring:message code="start.page.video.ref" /></button>
</form-->


<br/>
<br/>
<form:form method="post"  modelAttribute="trainParam" action="findtrains-from-start">

<div class="container" >
    <div class="box">
        <div class="fieldstart" >
            <label for="id_department" >
                <spring:message code="start.page.from.button" />
            </label >
            <c:choose>
                <c:when test="${requestScope.errorRout!=null}">
                    <input type = "text" name = "department" id = "id_department" value = "${sessionScope.trainParam.department}" >
                </c:when>
                <c:otherwise>
                    <form:input path="department" id = "id_department"/>
                </c:otherwise>
            </c:choose>
        </div >
    </div>

    <div class="swap1" onclick="swaper()">
<img class="swap1" src="<c:url value="/resources/images/index-tabs-content-arrows.png" />">
    </div>

    <div class="box">
        <div class="fieldstart" >
            <label for="id_arrive" >
                <spring:message code="start.page.to.button" />
            </label >
            <c:choose>
                <c:when test="${requestScope.errorRout!=null}">
                    <input type = "text" name = "arrive" id = "id_arrive" value = "${sessionScope.trainParam.arrive}" >
                </c:when>
                <c:otherwise>
                    <form:input path="arrive" id="id_arrive"/>
                </c:otherwise>
            </c:choose>
</div>
        </div >

    <div class="box">
        <div class="fieldstart" >
            <label for="txt3" >
                <spring:message code="start.page.when.button" />
            </label >
            <c:choose>
                <c:when test="${requestScope.errorRout!=null}">
                    <input type = "date" name = "date" id = "txt3" value = "${sessionScope.trainParam.date}" >
                </c:when>
                <c:otherwise>
                    <form:input type="date" path="date" id="txt3"/>
                </c:otherwise>
            </c:choose>
</div>
        </div >


    <div class="box">
        <div class="blockstart" >
            <input type = "hidden" name = "action" value = "find-trains-action" />
            <input class="orange" type = "submit" name = "Submit" value = " <spring:message code="start.page.find.button"/>" >
        </div >
        </div>
</div>
    <br/>
    <br/>
    <br/>
    <br/>

    <c:if test="${ not empty requestScope.errorRout}">
        <div class="error">
            <img src="<c:url value="/resources/images/attention_login.png" />"alt="Картинка">&nbsp; ${requestScope.errorRout}
        </div>
    </c:if>
</form:form>

<div class="train-im1">
</div>

</body>
</html>
