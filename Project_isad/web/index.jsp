<%-- 
    Document   : index
    Created on : Apr 20, 2017, 6:21:56 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
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





        <!--        <nav class="light-blue lighten-1" role="navigation">
                    <div class="nav-wrapper container"><a id="logo-container" href="index.jsp" class="brand-logo">Automobile Maintenance</a>
                        <ul class="right hide-on-med-and-down">
                            <li><a href="promotion.html">Promotion</a></li>
                            <li><a href="service.html">Service</a></li>
                            <li><a href="aboutus.html">About us</a></li>
        
                            
        
        
                        </ul>
        
        
                        <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
        
                    </div>
                </nav>-->
        
        
        <div class="col s2">

                <c:if test="${ sessionScope.user != null}">
                     <div class="row">
      <div class="col s10"></div>
      <div class="col s2"><a href="profile.jsp" class="waves-effect waves-light btn"><i class="material-icons left">info</i>Profile</a></div>
      
    </div>

                    
                    <form  action="LogoutServlet">
                        
                    </c:if>
                    <c:if test="${ sessionScope.user ==null }">
                    <form  action="login.html">
                    </c:if>


            </div>
        
        
        




        <div class="row">
            <div class="col s3"></div>
            <div class="col s6"><img class="responsive-img" src="images/header.png"></div>
            <div class="col s3"></div>
        </div>

        <!-- <div class="row">
              <div class="col s2"></div>
              <div class="col s8"><img class="responsive-img move" src="images/car.png"></div>
               <div class="col s2"></div>
              
        </div> -->

        <div class="figure">
            <img src="images/car.png" width="750" height="310" alt="Eiffel tower">
        </div>





        <div class="row">
            <div class="col s1"></div>




            <div class="col s2">

                <c:if test="${ sessionScope.user != null}">
                    
                    <form  action="LogoutServlet">
                        <input type="image" src="images/logout_logo.png" alt="submit" width="100" height="100"></form>
                    </c:if>
                    <c:if test="${ sessionScope.user ==null }">
                    <form  action="login.html">
                        <input type="image" src="images/login_icon.png" alt="submit" width="100" height="100"></form>
                    </c:if>


            </div>




            <div class="col s2">
                <form  action="service.html">
                    <input type="image" src="images/service_logo.png" alt="submit" width="100" height="100"></form>
            </div>
            <div class="col s2">
                <form  action="promotion.html">
                    <input type="image" src="images/promotion_logo.png" alt="submit" width="100" height="100"></form>
            </div>
            <div class="col s2">
                <form  action="review.html">
                    <input type="image" src="images/review_logo.png" alt="submit" width="100" height="100"></form>
            </div>
            <div class="col s2">
                <form  action="aboutus.html">
                    <input type="image" src="images/aboutus_logo.png" alt="submit" width="100" height="100"></form>
            </div>
            <div class="col s1"></div>


        </div>


        <div class="row">
            <div class="col s1"></div>
            <div class="col s2">
                
                
                
                <c:if test="${ sessionScope.user != null}">
                    
                    
                    </c:if>
                    <c:if test="${ sessionScope.user ==null }">
                    
                        <img class="responsive-img" src="images/login.png" alt="submit" width="100" height="50">
                    </c:if>

                
            </div>
            <div class="col s2">


                <img class="responsive-img" src="images/services.png" width="100" height="50">
            </div>
            <div class="col s2">

                <img class="responsive-img" src="images/promotions.png" width="100" height="50">
            </div>
            <div class="col s2">

                <img class="responsive-img" src="images/review.png" width="100" height="50">
            </div>
            <div class="col s2">

                <img class="responsive-img" src="images/aboutus.png" width="100" height="50">
            </div>
            <div class="col s1"></div>




















            <!--  Scripts-->
            <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
            <script src="js/materialize.js"></script>
            <script src="js/init.js"></script>

    </body>

</html>
