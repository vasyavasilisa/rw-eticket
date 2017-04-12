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
    <!--link rel='stylesheet' type='text/css' href='/css/style.css'-->

</head>
<body>

<span style="float: right">
     <a href="?lang=ru"> <spring:message code="application.rusLocale" /></a>
     <a href="?lang=en">  <spring:message code="application.enLocale" /></a>

    </span>


<c:if test="${requestScope.errorRout!=null}">
   <div id="error_message">
    ${requestScope.errorRout}
    </div>
</c:if>
<form:form method="post"  modelAttribute="trainParam" action="findtrains">
    <fieldset>
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
                    <form:input path="department"/>
                </c:otherwise>
            </c:choose>
        </div >
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
            <INPUT TYPE="button" onclick="resetmyForm()" VALUE ="  <spring:message code="byebook.page.reset.button"/>">
            <input type = "hidden" name = "action" value = "find-trains-action" />
            <input type = "submit" name = "Submit" value = " <spring:message code="byebook.page.continue.button"/>" >
        </div >
    </fieldset>
</form:form>
<script src="js/main.js"></script>
</body>
</html>
