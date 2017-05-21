<%-- 
    Document   : queue_car
    Created on : 23 เม.ย. 2560, 15:54:28
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

        <style>
            table, th, td {
                border: 1px solid black;
            }
            table#t01 tr:nth-child(even) {
                background-color: #eee;
            }
            table#t01 tr:nth-child(odd) {
                background-color:#fff;
            }
            table#t01 th {
                background-color:   #696969;
                color: white;
            </style>
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
                <div class="col s6"><img class="responsive-img" src="images/emp_queue_car.png"></div>
                <div class="col s3"></div>
            </div>


            <sql:setDataSource var="newdatasource" driver="com.mysql.jdbc.Driver"
                               url="jdbc:mysql:///project" user="root" password="root" />

            <sql:query var="db" dataSource="${newdatasource}">
                SELECT * FROM queue JOIN car_info ON queue.car_regis_no = car_info.car_regis_no WHERE checks = '1' AND car_date = '<%= session.getAttribute("select_date")%>'
            </sql:query>




            <div class="row">

                <div class="col s2">
                </div>

                <div class="col s8">

                    <table id="t01" style="width:100%">
                            <tr>
                                <th><h5>Queue ID</h5></th>
                                <th><h5>Time</h5></th>
                                <th><h5>Car Regis Number</h5></th>
                                <th><h5>Band</h5></th>
                                <th><h5>Color</h5></th>
                                <th><h5>Gen</h5></th>


                            </tr>

                            <c:forEach var="row" items="${db.rows}">


                                <tr>


                                    <td><h5>${row.queue_id}</h5></td>
                                    <td><h5>${row.time}</h5></td>
                                    <td><h5>${row.car_regis_no}</h5></td>
                                    <td><h5>${row.car_band}</h5></td>
                                    <td><h5>${row.car_color}</h5></td>
                                    <td><h5>${row.car_gen}</h5></td>
                                </tr>


                            </c:forEach>
                        </table>   

                    </div>

                    <div class="col s2">
                    </div>



                </div>





                <!--                <div class="row">
                                    <form class="container">
                
                                        <div class="container">
                                            <div class="input-field">
                                                <input placeholder="EX.กจ 555 toyota สีดำ" id="first_name" type="text" class="validate">
                                                <label for="first_name">รถคันที่1</label>
                                            </div>
                                        </div>
                                        <div class="container">
                                            <div class="input-field">
                                                <input placeholder="EX.กจ 555 toyota สีดำ" id="first_name" type="password" class="validate">
                                                <label for="first_name">รถคันที่2</label>
                                            </div>
                                        </div>
                                        <div class="container">
                                            <div class="input-field">
                                                <input placeholder="EX.กจ 555 toyota สีดำ" id="first_name" type="password" class="validate">
                                                <label for="first_name">รถคันที่3</label>
                                            </div>
                                        </div>
                                        <div class="container">
                                            <div class="input-field">
                                                <input placeholder="EX.กจ 555 toyota สีดำ" id="first_name" type="password" class="validate">
                                                <label for="first_name">รถคันที่4</label>
                                            </div>
                                        </div>
                                        <div class="container">
                                            <div class="input-field">
                                                <input placeholder="EX.กจ 555 toyota สีดำ" id="first_name" type="password" class="validate">
                                                <label for="first_name">รถคันที่5</label>
                                            </div>
                                        </div>
                
                
                                    </form>
                                </div>-->














                <!--  Scripts-->
                <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
                <script src="js/materialize.js"></script>
                <script src="js/init.js"></script>

            </body>
        </html>

