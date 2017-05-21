<%-- 
    Document   : check_login_review
    Created on : 22 เม.ย. 2560, 1:48:49
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${ sessionScope.user ==null }">
            <% response.sendRedirect("login.html");%>
        </c:if>

        <c:if test="${ sessionScope.user != null}">
        <% response.sendRedirect("review.html");%>
        </c:if>
        
</body>
</html>
