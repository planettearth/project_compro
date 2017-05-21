<%-- 
    Document   : queue_beforesubmit
    Created on : Apr 22, 2017, 10:36:49 AM
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
                    <li><a href="LogoutServlet">Loggout</a></li>
                </ul>


                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>

            </div>
        </nav>





        
           
                <br><br>
                <div class="row">
                    <br><br>
                    <div class="col s4"></div>
                    <div class="col s4"><img class="responsive-img" src="images/queue_beforesubmit.png"></div>
                    <div class="col s4"></div>
                </div>


            







            <div class="row">
                <form class="container">

                    <div class="container">
                        <div class="input-field">
                            <i class="material-icons prefix">address</i>
                            <input placeholder="${sessionScope.date}" id="first_name" type="text" class="validate">
                            <label for="first_name">ข้อมูล</label>
                        </div>
                    </div>
                    <div class="container">

                        <div class="input-field">
                            <i class="material-icons prefix">address</i>
                            <input placeholder="${sessionScope.time}" id="first_name" type="text" class="validate">
                            <label for="first_name">ข้อมูล</label>
                        </div>
                    </div>
                    <div class="container">
                        <div class="input-field">
                            <i class="material-icons prefix">address</i>
                            <input placeholder="${sessionScope.problem}" id="first_name" type="text" class="validate">
                            <label for="first_name">ข้อมูล</label>
                        </div>
                    </div>


                </form>
            </div>


            <div class="row center">



                <form action="Queue_showServlet" method="POST">

                    <input type="hidden" name="car_id" value="${param.car_id}">

                    <input name="Submit" type="submit" id="download-button" class="btn-large grey darken-1">

                </form>

            </div>
















            <!--  Scripts-->
            <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
            <script src="js/materialize.js"></script>
            <script src="js/init.js"></script>

    </body>
</html>

