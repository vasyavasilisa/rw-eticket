<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 12.03.2017
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Онлайн покупка и бронирование жд-билетов</title>
    <!--link rel='stylesheet' type='text/css' href='/css/style.css'-->

</head>
<body>




<c:if test="${requestScope.errorRout!=null}">
   <div id="error_message">
    ${requestScope.errorRout}
    </div>
</c:if>
<spring:form method="post"  modelAttribute="trainParam" action="findtrains">
    <fieldset>
        <div class="field" >
            <label for="id_department" >
                Станция отправления:

            </label >
            <br/>
            <c:choose>
                <c:when test="${requestScope.errorRout!=null}">
                    <input type = "text" name = "department" id = "id_department" value = "${sessionScope.trainParam.department}" >
                </c:when>
                <c:otherwise>
                    <spring:input path="department"/>
                </c:otherwise>
            </c:choose>
        </div >
        <br/>
        <div class="field" >
            <label for="id_arrive" >
                Станция назначения:
            </label >
            <br/>
            <c:choose>
                <c:when test="${requestScope.errorRout!=null}">
                    <input type = "text" name = "arrive" id = "id_arrive" value = "${sessionScope.trainParam.arrive}" >
                </c:when>
                <c:otherwise>
                    <spring:input path="arrive" id="id_arrive"/>
                </c:otherwise>
            </c:choose>

        </div >
        <br/>
        <div class="field" >
            <label for="txt3" >
                Дата отправления:
            </label >
            <br/>
            <c:choose>
                <c:when test="${requestScope.errorRout!=null}">
                    <input type = "date" name = "date" id = "txt3" value = "${sessionScope.trainParam.date}" >
                </c:when>
                <c:otherwise>
                    <spring:input type="date" path="date" id="txt3"/>
                </c:otherwise>
            </c:choose>

        </div >
        <br/>
        <br/>
        <div class="block" >
            <INPUT TYPE="button" onclick="resetmyForm()" VALUE ="Сбросить">
            <input type = "hidden" name = "action" value = "find-trains-action" />
            <input type = "submit" name = "Submit" value = "Продолжить">
        </div >
    </fieldset>
</spring:form>
<script src="js/main.js"></script>
</body>
</html>
