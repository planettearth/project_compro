<%-- 
    Document   : inf_car
    Created on : 23 เม.ย. 2560, 17:27:29
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
            <div class="nav-wrapper container"><a id="logo-container" href="inf_index.jsp" class="brand-logo">Automobile Maintenance</a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="LogoutServlet">Logout</a></li>
                </ul>


                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>

            </div>
        </nav>



        <div class="row">
            <div class="col s3"></div>
            <div class="col s6"><img class="responsive-img" src="images/emp_inf_car.png"></div>
            <div class="col s3"></div>
        </div>





        <sql:setDataSource var="newdatasource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql:///project" user="root" password="root" />

        <sql:query var="db" dataSource="${newdatasource}">
            SELECT * FROM queue JOIN car_info ON queue.car_regis_no = car_info.car_regis_no WHERE checks = '0' AND car_date =  '${sessionScope.select_date2}'
        </sql:query>







        <div class="row">

            <div class="col s12">
                <div class="col s3"></div>
                <div class="col s9">
                    <c:forEach var="row" items="${db.rows}">


                        <h3>Car register number = ${row.car_regis_no} Band = ${row.car_band} </h3>
                        <h3> Gen = ${row.car_gen} Color = ${row.car_color}</h3>

                        <!--<input type="submit" value="submit" name="submit" id="download-button" class="btn-large grey darken-1" />-->
                        <a href="SubmitCarServlet?car_regis=${row.car_regis_no}" id="download-button" class="btn-large waves-effect waves-light orange" >Submit</a>


                        <br>




                    </c:forEach>
                </div>

            </div>
        </div>



        <br><br><br><br>
















        <!--  Scripts-->
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="js/materialize.js"></script>
        <script src="js/init.js"></script>

    </body>
</html>

