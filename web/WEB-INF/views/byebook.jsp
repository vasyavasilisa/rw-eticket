<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 12.03.2017
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title><spring:message code="byebook.page.title" /></title>
    <link rel='stylesheet' type='text/css' href="<c:url value="/resources/css/style.css"/> ">
    <script src="<c:url value="/resources/js/script.js"/>"></script>

</head>
<body  bgcolor="#EFEFEF">


<jsp:include page="locales.jsp"></jsp:include>
<jsp:include page="login.jsp"></jsp:include>



<ul id="breadcrumbs-one"><!-- Меню-->
    <li>   <form action="main" method="post"  name="startForm">
        <button> <spring:message code="start.page.main.button" /></button>
    </form></li>

    <li>
        <form action="passenger-services" method="post"  name="startForm">
            <button name="action" class="current" value="passenger-services-action" onclick="submit ()">
                <spring:message code="start.page.forpassages.button" />
            </button>
            <!--На  passangerservices.jsp-->
        </form>
    </li>

    <li>
        <form method="post"   action="private-office">
            <button   name = "Submit" onclick="submit ()" value = "">
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

<div class="myfon">
</div>
<div class="submenu">
        <div class="cursubbox">
            <div class="text" ><a href="#" ><spring:message code="start.page.submenu.rout" />
            </a></div >
        </div>
            <div class="subbox" >
                <div class="text" ><a href="#" ><spring:message code="start.page.submenu.train" /></a></div>
        </div >
        <div class="subbox">
                <div class="text" ><a href="#" ><spring:message code="start.page.submenu.carriage" /></a></div>
        </div >
    <div class="subbox">
        <div class="text" ><a href="#" ><spring:message code="start.page.submenu.passanger" /></a></div>
    </div >
    <div class="subbox">
        <div class="text" ><a href="#" ><spring:message code="start.page.submenu.confirm" /></a></div>
    </div >

    <div class="subbox">
        <div class="text"> <a href="#" ><spring:message code="start.page.submenu.order" /></a></div>
    </div >
</div>
<br/>
<c:if test="${requestScope.errorRout!=null}">
   <div    style="float: left;margin-top: 60px" class="error" id="error_message">
       <img src="<c:url value="/resources/images/attention_login.png" />"alt="Картинка">&nbsp;  ${requestScope.errorRout}
    </div>
</c:if>
<form:form method="post"  modelAttribute="trainParam" action="findtrains" class="byeForm">

        <div class="field" >
            <label for="id_department" >
                <spring:message code="byebook.page.stationdep.label" />

            </label >
            <br/>
            <c:choose>
                <c:when test="${requestScope.errorRout!=null}">
                    <input type = "text" name = "department" id = "id_department" value = "${sessionScope.trainParam.department}" >
                </c:when>
                <c:otherwise>
                    <form:input path="department" id = "id_department"/>
                </c:otherwise>
            </c:choose>
        </div >

        <div class="swap2" onclick="swaper()">
            <img class="swap2" src="<c:url value="/resources/images/swapping.png" />">
        </div>


        <br/>
        <div class="field" >
            <label for="id_arrive" >
                <spring:message code="byebook.page.stationarr.label" />
            </label >
            <br/>
            <c:choose>
                <c:when test="${requestScope.errorRout!=null}">
                    <input type = "text" name = "arrive" id = "id_arrive" value = "${sessionScope.trainParam.arrive}" >
                </c:when>
                <c:otherwise>
                    <form:input path="arrive" id="id_arrive"/>
                </c:otherwise>
            </c:choose>

        </div >
        <br/>
        <div class="field" >
            <label for="txt3" >
                <spring:message code="byebook.page.date.label" />
            </label >
            <br/>
            <c:choose>
                <c:when test="${requestScope.errorRout!=null}">
                    <input type = "date" name = "date" id = "txt3" value = "${sessionScope.trainParam.date}" >
                </c:when>
                <c:otherwise>
                    <form:input type="date" path="date" id="txt3"/>
                </c:otherwise>
            </c:choose>

        </div >
        <br/>
        <br/>
        <div class="block" >
            <INPUT TYPE="button" class= "orange" onclick="resetmyForm()" VALUE ="  <spring:message code="byebook.page.reset.button"/>">
            <input type = "hidden" name = "action" value = "find-trains-action" />
            <input type = "submit" class="orange" name = "Submit" value = " <spring:message code="byebook.page.continue.button"/>" >
        </div >

</form:form>
<!--script src="js/script.js"></script-->
</body>
</html>
