<%-- 
    Document   : Queue_have
    Created on : Apr 22, 2017, 1:43:37 AM
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
        <title>Automobile Maintenance</title>

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



        <div class="row">
            <div class="col s3"></div>
            <div class="col s6"><img class="responsive-img" src="images/queue_have.png"></div>
            <div class="col s3"></div>
        </div>



        <sql:setDataSource var="newdatasource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql:///project" user="root" password="root" />

        <sql:query var="db" dataSource="${newdatasource}"> 
            SELECT * FROM car_info WHERE cus_id = ${sessionScope.cus_id}
        </sql:query>



        <c:forEach var="row" items="${db.rows}">
            <c:if  test ="${sessionScope.user != null}">
                <div class="row">
                    <form class="container">


                        <div class="container">
                            
                            
                            <h1>  <i class="material-icons prefix">list</i> ${row.car_regis_no}</h1>
                            <br>
                            
                            <a href="queue_problem.jsp?car_id=${row.car_regis_no}" id="download-button" class="btn-large grey darken-1">เลือก</a>
                            
                            
                            


                        </div>



                    </form>
                </div>

            </c:if>

        </c:forEach>










        <!--  Scripts-->
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="js/materialize.js"></script>
        <script src="js/init.js"></script>

    </body>
</html>

