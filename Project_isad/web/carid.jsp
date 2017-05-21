<%-- 
    Document   : carid
    Created on : Apr 21, 2017, 8:32:47 PM
    Author     : anuchitamatchima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>Starter Template - Materialize</title>

        <!-- CSS  -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    </head>



    <body>


        <nav class="light-blue lighten-1" role="navigation">
            <div class="nav-wrapper container"><a id="logo-container" href="index.jsp" class="brand-logo">Automobile Maintenance</a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="promotion.html">Promotion</a></li>
                    <li><a href="service.html">Service</a></li>
                    <li><a href="aboutus.html">About us</a></li>
                    <li><a href="LogoutServlet">Logout</a></li>
                </ul>

                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
            </div>
        </nav>

<sql:setDataSource var="newdatasource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql:///project" user="root" password="root" />

        <sql:query var="db" dataSource="${newdatasource}"> 
            select * from detail join repair on detail.repair_id = 
            repair.repair_id join part on part.part_id= detail.part_id where car_regis_no = "${sessionScope.car_regis}"
        </sql:query>

        <div class="section no-pad-bot" id="index-banner">
            <div class="container">

                
                <br><br>
                <h4 class="header black-text"><b>ทะเบียน :      ${sessionScope.car_regis}</b></h4>
                <br>
                <h4 class="header black-text"><b>วันรับรถ :      ${sessionScope.pick_up_date}</b></h4>
                <br>
                <h4 class="header black-text"><b>รายการซ่อมอ่ะไหล่</b></h4>
                <br>
                <c:forEach var="row" items="${db.rows}">
                    
                
                <h4 class="header black-text"><b> -  ${row.part_name} </b></h4>
                
                   
                </h1>
            </c:forEach>
                
                
                <br><br>
                
                
            
            <c:forEach var="row" items="${db.rows}">
                
                <c:if test="${row.status == 1}">
                    <h1 class="header green-text"> <b>${row.repair_list} Complete!</b></h1>
                </c:if>
                        <c:if test="${row.status == 0}">
                    <h1 class="header red-text"> <b>${row.repair_list} Uncomplete </b>
                </c:if>
                
                </h1>
            </c:forEach>
                
                
            </div>
        </div>
    </div>








    <!--  Scripts-->
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="js/materialize.js"></script>
    <script src="js/init.js"></script>

</body>
</html>

