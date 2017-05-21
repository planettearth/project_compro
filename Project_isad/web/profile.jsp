<%-- 
    Document   : profile
    Created on : 22 เม.ย. 2560, 14:39:57
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
        <title>Profile</title>

        <!-- CSS  -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    </head>

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





            <div class="section no-pad-bot" id="index-banner">
                <div class="container">
                    <br><br>
                    <h1 class="header center orange-text">ข้อมูลของคุณ</h1>
                    <div class="row center">
                        <!--<h5 class="header col s12 light">All new Automobile Maintenance System first in the World!</h5>
                      </div>
                      <div class="row center"> 
                        <a href="http://materializecss.com/getting-started.html" id="download-button" class="btn-large waves-effect waves-light orange">Get Started</a>
                      </div>-->


                        <br><br>

                    </div>
                </div>


                <!--<div class="row">
                    <form class="col s12">
                      <div class="row">
                      <div class="input-field col s1">
                        </div>
                        <div class="input-field col s4">
                          <input value="Jitpanu" id="first_name" type="text" class="validate">
                      <label class="active" for="first_name">First Name</label>
                        </div>
                        <div class="input-field col s1">
                        </div>
                        <div class="input-field col s1">
                        </div>
                        <div class="input-field col s4">
                          <input value="Tanthong" id="last_name" type="text" class="validate">
                      <label class="active" for="last_name">First Name</label>
                        </div>
                        <div class="input-field col s1">    
                        </div>
                      </div>   
                
                    <div class="row">
                    <div class="input-field col s1">
                        </div>
                        <div class="input-field col s10">
                          <input value="081-565-7373" id="tel" type="text" class="validate">
                      <label class="active" for="tel">Tel</label>
                        </div>
                        <div class="input-field col s1">
                        </div>
                      </div>
                
                
                    <div class="row">
                    <div class="input-field col s1">
                        </div>
                        <div class="input-field col s10">
                          <input value="opor_tan@hotmail.co.th" id="email" type="text" class="validate">
                      <label class="active" for="email">E-mail</label>
                        </div>
                        <div class="input-field col s1">
                        </div>
                      </div> 
                
                
                
                    <div class="row">
                    <div class="input-field col s1">
                        </div>
                        <div class="input-field col s10">
                          <input value="55/808" id="address" type="text" class="validate">
                      <label class="active" for="address">Address</label>
                        </div>
                        <div class="input-field col s1">
                        </div>
                      </div>  
                
                
                    </form>
                  </div>
                
                
                
                
                <div class="row center">
                        
                          
                            
                
                            
                            
                        <a href="index.html" id="download-button" class="btn-large waves-effect waves-light orange">Submit</a>
                      
                      
                      
                
                          </div>-->


                <div class="row">
                    <form class="container">



                        <sql:setDataSource var="newdatasource" driver="com.mysql.jdbc.Driver"
                                           url="jdbc:mysql:///project" user="root" password="root" />

                        <sql:query var="db" dataSource="${newdatasource}">
                            SELECT * FROM customer WHERE username = '${sessionScope.user}'
                        </sql:query>

                        <table id="t01" style="width:100%">
                                <tr>
                                    <th><h5>Customer ID</h5></th>
                                    <th><h5>Customer Name</h5></th>
                                    <th><h5>Customer Username</h5></th>
                                    <th><h5>Customer Email</h5></th>
                                    <th><h5>Customer phone</h5></th>
                                    <th><h5>Customer Address</h5></th>


                                </tr>

                                <c:forEach var="row" items="${db.rows}">


                                    <tr>
                                        <td><h5><b>${row.cus_id}</b></h5></td>
                                        <td><h5><b>${row.cus_name}</b></h5></td>
                                        <td><h5><b>${row.username}</b></h5></td>
                                        <td><h5><b>${row.cus_email}</b></h5></td>
                                        <td><h5><b>${row.cus_phone}</b></h5></td>
                                        <td><h5><b>${row.cus_address}</b></h5></td>
                                    </tr>


                                </c:forEach>
                            </table>

                        </form>
                    </div>








<!--                    <footer class="page-footer orange">
                        <div class="container">
                            <div class="row">
                                <div class="col l6 s12">
                                    <h5 class="white-text">Automobile Maintenance System</h5>
                                    <p class="grey-text text-lighten-4">We are a team of college students making the Automobile Maintenance System.</p>


                                </div>


                            </div>
                        </div>
                        <div class="footer-copyright">
                            <div class="container">
                                Made by <a class="orange-text text-lighten-3" href="#">IT KMITL</a>
                            </div>
                        </div>
                    </footer>-->






                    <!--  Scripts-->
                    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
                    <script src="js/materialize.js"></script>
                    <script src="js/init.js"></script>

            </body>
        </html>
