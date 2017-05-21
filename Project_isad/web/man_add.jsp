<%-- 
    Document   : man_add
    Created on : 21 เม.ย. 2560, 21:35:44
    Author     : admin
--%>

<%-- 
    Document   : man_add
    Created on : Apr 23, 2017, 5:14:16 PM
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
                <div class="nav-wrapper container"><a id="logo-container" href="man_index.jsp" class="brand-logo">Automobile Maintenance</a>
                    <ul class="right hide-on-med-and-down">

                        <li><a href="LogoutServlet">Logout</a></li>
                    </ul>


                    <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>

                </div>
            </nav>



            <sql:setDataSource var="newdatasource" driver="com.mysql.jdbc.Driver"
                               url="jdbc:mysql:///project" user="root" password="root" />

            <sql:query var="db" dataSource="${newdatasource}"> 
                SELECT * FROM invoice
            </sql:query>






            <div class="row">
                <div class="col s3"></div>
                <div class="col s6"><img class="responsive-img" src="images/emp_man_add.png"></div>
                <div class="col s3"></div>




            </div>






            <div class="row">
                <form class="container">

                    <font size="35" >
                    <table id="t01" style="width:100% " >
                            <tr>
                                <th>Date</th>
                                <th>Repair id</th>            
                                <th>Detail</th>
                                <th>Price</th>

                            </tr>


                            <c:forEach var="row" items="${db.rows}">

                                <tr>
                                    <td>${row.date}</td>
                                    <td>${row.repair_id}</td> 
                                    <td>${row.history}</td>
                                    <td>${row.price}</td> 
                                </tr>


                            </c:forEach>


                        </table>
                    </font>
                



                        <div class="row center">




                        </div>


                </div>  






                <!--  Scripts-->
                <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
                <script src="js/materialize.js"></script>
                <script src="js/init.js"></script>

            </body>
        </html>

