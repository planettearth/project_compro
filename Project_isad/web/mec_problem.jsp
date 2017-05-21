<%-- 
    Document   : mec_problem
    Created on : 24 เม.ย. 2560, 0:17:35
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
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
                    <li><a href="mec_index.jsp">Main</a></li>
                    <li><a href="LogoutServlet">Logout</a></li>
                </ul>


                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>

            </div>
        </nav>







        <form action="PickupDateServlet">
            <div class="row">
                <div class="col s12">
                    <div class="col s3"></div>

                    <div class="col s3"><img class="responsive-img" src="images/emp_mec_problem1.png" width="400" height="400">
                        <sql:setDataSource var="newdatasource" driver="com.mysql.jdbc.Driver"
                                           url="jdbc:mysql:///project" user="root" password="root" />

                        <sql:query var="db" dataSource="${newdatasource}">
                            SELECT * FROM repair WHERE car_regis_no = '${ sessionScope.car_regis_mec}'
                        </sql:query>



                        <c:forEach var="row" items="${db.rows}">




                            <h3>${row.problem}</h3>




                        </c:forEach>





                    </div>

                    <div class="col s3">
                        <img class="responsive-img" src="images/emp_mec_problem2.png" width="400" height="400">

                        <sql:setDataSource var="newdatasource" driver="com.mysql.jdbc.Driver"
                                           url="jdbc:mysql:///project" user="root" password="root" />

                        <sql:query var="db" dataSource="${newdatasource}">
                            SELECT * FROM car_info WHERE car_regis_no = '${ sessionScope.car_regis_mec}'
                        </sql:query>



                        <c:forEach var="row" items="${db.rows}">




                            <h3>${row.car_regis_no}</h3>
                            <h3>${row.car_band}</h3>
                            <h3>${row.car_color}</h3>
                        </c:forEach>

                    </div>

                    <input type="hidden" name="repair_id" value="${param.repair_id}"/>
                    <div class="container">
                        <div class="input-field">
<!--                            <i class="material-icons prefix">subdirectory_arrow_right</i>-->
                            <input placeholder="" name="pick_up_date" id="pick_up_date" type="date" class="validate">
<!--                            <label for="pick_up_date">วันรับรถ</label>-->
                        </div>
                    </div>


                </div>
            </div>











            <br><br>






            <div class="row center">






                <button type="submit" id="download-button" class="btn-large grey darken-1">ประเมินการซ่อม</button>




            </div>


        </form>













        <!--  Scripts-->
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="js/materialize.js"></script>
        <script src="js/init.js"></script>

    </body>
</html>

