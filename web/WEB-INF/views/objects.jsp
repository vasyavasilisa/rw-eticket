<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 03.05.2017
  Time: 15:07
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
<div class="myfon">
</div>
<div class="train-im1">
</div>
<br/>
<br/>
<br/>
<br/>
<form method="post"   action="trains-manag">
    <button name = "Submit"class="orange" onclick="submit ()" value = "">
        Поезда
    </button>
</form>
<br/>
<br/>
<form method="post"   action="stations-manag">
    <button name = "Submit" class="orange" onclick="submit ()" value = "">
        Станции
    </button>
</form>
<br/>
<br/>
<form method="post"   action="carriages-manag">
    <button name = "Submit" class="orange" onclick="submit ()" value = "">
      Вагоны
    </button>
</form>
<br/>
<br/>
<form method="post"   action="places-manag">
    <button name = "Submit" class="orange" onclick="submit ()" value = "">
     Места
    </button>
</form>
<br/>
<br/>
<form method="post"   action="routs-manag">
    <button name = "Submit" class="orange" onclick="submit ()" value = "">
        Маршруты
    </button>
</form>
<br/>
<br/>
<form method="post"   action="users-manag">
    <button name = "Submit" class="orange" onclick="submit ()" value = "">
        Пользователи
    </button>
</form>
<br/>
<br/>
<form method="post"   action="feedbacks-manag">
    <button name = "Submit" class="orange" onclick="submit ()" value = "">
       Отзывы
    </button>
</form>

</body>
</html>