<%-- 
    Document   : mec_updaterepair
    Created on : Apr 23, 2017, 11:00:24 PM
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
            <div class="nav-wrapper container"><a id="logo-container" href="mec_index.jsp" class="brand-logo">Automobile Maintenance</a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="LogoutServlet">Logout</a></li>
                </ul>


                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>

            </div>
        </nav>


        <sql:setDataSource var="newdatasource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql:///project" user="root" password="root" />

        <sql:query var="db" dataSource="${newdatasource}"> 
            select * from detail join repair on detail.repair_id = 
            repair.repair_id where car_regis_no = "${sessionScope.car_regis}" and status != 1
        </sql:query>

        <div class="section no-pad-bot" id="index-banner">




            <div class="row">
                <div class="col s3"></div>
                <div class="col s6"><img class="responsive-img" src="images/emp_mec_updaterepair.png"></div>
                <div class="col s3"></div>
            </div>
            <form action="UpdateRepairServlet" method="POST">

            <c:forEach var="row" items="${db.rows}">

                <div class="row">
                    <div class="col s12">
                        <div class="col s3"></div>
                        <div class="input-field col s3">
                            <h1>${row.repair_list}</h1>
<!--                            <input placeholder="${row.repair_list}" id="car_id" type="text" class="validate">-->
<!--                            <label for=""></label>-->

                        </div>
                        <div class="col s1"></div>
                        <div class="col s3">
                            <input type="checkbox" name="checkedRows" id="${row.id}" value="${row.repair_list}">
                            <label for="${row.id}"></label><br>
                            
                            
                        </div>
                    </div>

                </div>



            </c:forEach>
                
                <div class="row center">
                <input type="submit" name="submit" id="download-button" class="btn-large grey darken-1">
                </div>
                </form>
            
             </div>




        <br><br>

    </div>














    <!--  Scripts-->
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="js/materialize.js"></script>
    <script src="js/init.js"></script>

</body>
</html>

