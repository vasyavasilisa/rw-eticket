<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 12.04.2017
  Time: 12:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="local">
<span style="float: right">
     <a class="hrefloc" href="?lang=ru"> <spring:message code="application.rusLocale" /></a>
    <a  class="hrefloc" href="?lang=en">  <spring:message code="application.enLocale" /></a>
    </span>
</div>
