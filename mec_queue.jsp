<%-- 
    Document   : mec_queue
    Created on : 23 เม.ย. 2560, 22:37:49
    Author     : admin
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
            <div class="nav-wrapper container"><a id="logo-container" href="mec_index.jsp" class="brand-logo">Automobile Maintenance</a>
                <ul class="right hide-on-med-and-down">
<!--                    <li><a href="emp_mec_index.html">Main</a></li>-->
                    <li><a href="LogoutServlet">Logout</a></li>
                </ul>


                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>

            </div>
        </nav>




        <br><br><br>
        <div class="row">
            <div class="col s12">
                <div class="col s4"></div>
                <!--<div class="col s2"> <img class="responsive-img" src="images/emp_mec_queue1.png" width="400" height="400"></div>-->

                <div class="col s2"><img class="responsive-img" src="images/emp_mec_queue2.png" width="400" height="400"></div>
                <div class="col s2"><img class="responsive-img" src="images/emp_mec_queue3.png" width="400" height="400"></div>
                <div class="col s2">


                </div>
            </div>
        </div>
        <br><br>

        <sql:setDataSource var="newdatasource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql:///project" user="root" password="root" />

        <sql:query var="db" dataSource="${newdatasource}">
            SELECT * FROM repair JOIN queue ON repair.car_regis_no = queue.car_regis_no WHERE checks = '1'
        </sql:query>

            <font size="25" >    
        <c:forEach var="row" items="${db.rows}">









            <div class="row">
                <div class="col s12">
                    <div class="col s4"></div>
                    <!--<div class="col s2"> 1</div>-->

                    <div class="col s2">${row.car_regis_no}</div>
                    <div class="col s2">${row.problem}</div>
                    <div class="col s2">
                        <a href="MecBeforeProblemServlet?car_regis=${row.car_regis_no}&repair_id=${row.repair_id}" id="download-button" class="btn-large grey darken-1">Submit</a>

                    </div>
                </div>
            </div>


        </c:forEach>
            </font>
















        <!--  Scripts-->
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="js/materialize.js"></script>
        <script src="js/init.js"></script>

    </body>
</html>

