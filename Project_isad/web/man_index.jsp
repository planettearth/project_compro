<%-- 
    Document   : man_index
    Created on : Apr 21, 2017, 4:46:35 PM
    Author     : anuchitamatchima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>Manager Page</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
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





  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
      <br><br>
      <h1 class="header center orange-text"></h1>
      <div class="row center">


      <br><br>

    </div>
  </div>



<div class="row">
      <br><br><br><br><br>
      <div class="col s3"></div>
      <div class="col s2">
      <form  action="aboutus.html">
     <input type="image" src="images/gain.png" alt="submit" width="    100" height="    100"></form>
     </div>
     <div class="col s2">
      <form  action="promotion.html">
     <input type="image" src="images/cus_info.png" alt="submit" width="    100" height="    100"></form>
     </div>
     <div class="col s2">
      <form  action="review.html">
     <input type="image" src="images/reward_review.png" alt="submit" width="    100" height="    100"></form>
     </div>
     <div class="col s3"></div>
     

  </div>



<div class="row">
   


<div class="row center">
        
          
      <a href="man_add.jsp" id="download-button" class="btn-large waves-effect waves-light orange">กำไร        </a>      
            
      <a href="man_cus.jsp" id="download-button" class="btn-large waves-effect waves-light orange">ข้อมูลลูกค้า   </a>
      
      <a href="man_review.jsp" id="download-button" class="btn-large waves-effect waves-light orange">review</a>
      

          </div>
          <br><br><br><br><br><br><br><br><br><br>

        
      





  

 






  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>

  </body>
</html>

