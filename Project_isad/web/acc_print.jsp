<%-- 
    Document   : acc_print
    Created on : 22 เม.ย. 2560, 21:38:46
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
        <title>Account Print</title>

        <!-- CSS  -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    </head>



    <body>

    <nav class="light-blue lighten-1" role="navigation">
        <div class="nav-wrapper container"><a id="logo-container" href="acc_index.jsp" class="brand-logo">Automobile Maintenance</a>
            <ul class="right hide-on-med-and-down">

                <li><a href="LogoutServlet">Logout</a></li>
            </ul>


            <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>

        </div>
    </nav>


    <!--${sessionScope.car_regis}-->



    <div class="row">
        <br>

        <div class="col s2">
        </div>

        <div class="col s2">

            <img class="responsive-img" src="images/empaccprint_1.png" width="300" height="200">
        </div>

        <div class="col s3">
        </div>


        <div class="col s2">
            <img class="responsive-img" src="images/empaccprint_2.png" width="300" height="200">

        </div>


    </div>


    <sql:setDataSource var="newdatasource" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql:///project" user="root" password="root" />

    <sql:query var="db" dataSource="${newdatasource}">
        SELECT * FROM detail join repair 
        on repair.repair_id = detail.repair_id 
        join part on part.part_id = detail.part_id 
        WHERE car_regis_no = '${sessionScope.car_regis}'
    </sql:query>


    <div class="row">
        <div class="col s2">
        </div>
        <form class="col s3">

            <i class="material-icons prefix">settings</i>
            <c:forEach var="row" items="${db.rows}">


                <h3>- ${row.part_name}</h3>

                <br>




            </c:forEach>


        </form>


        <div class="col s2">
        </div>





        <form class="col s3">

            <i class="material-icons prefix">settings</i>
            <c:forEach var="row" items="${db.rows}">

                
                <h3>- ${row.repair_list}</h3>

                <br>




            </c:forEach>



        </form>



    </div>


    <div class="row">
        <div class="col s2">
        </div>
        <div class="col s2">
            <img class="responsive-img" src="images/empaccprint_3.png" width="300" height="200">
        </div>

        <div class="col s3">
        </div>


        <div class="col s2">
            <img class="responsive-img" src="images/empaccprint_4.png" width="300" height="200">
        </div>
    </div>






    <div class="row">
        <div class="col s2">
        </div>
        <form class="col s3">



            <br>

            <i class="material-icons prefix">attach_money</i>
            <h3>500</h3>

        </form>



            <sql:setDataSource var="newdatasource" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql:///project" user="root" password="root" />

    <sql:query var="db" dataSource="${newdatasource}">
        SELECT sum(part_price) as price FROM detail join repair 
        on repair.repair_id = detail.repair_id 
        join part on part.part_id = detail.part_id 
        WHERE car_regis_no = '${sessionScope.car_regis}'
    </sql:query>

        <div class="col s2">
        </div>
        <form class="col s3">

            <i class="material-icons prefix">payment</i>
            
            <c:forEach var="row" items="${db.rows}">


                <h3>${row.price + 500}</h3>

                <br>




            </c:forEach>

        </form>
    </div>



</div>





<div class="row center">

    <a href="#" id="download-button" class="btn-large grey darken-1">Print</a>


</div>

















<!--  Scripts-->
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="js/materialize.js"></script>
<script src="js/init.js"></script>

</body>
</html>

