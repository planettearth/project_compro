<%-- 
    Document   : mec_num2
    Created on : Apr 23, 2017, 10:34:38 PM
    Author     : anuchitamatchima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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





  
  <div class="row">
      <div class="col s3"></div>
      <div class="col s6"><img class="responsive-img" src="images/emp_mec_num2.png"></div>
      <div class="col s3"></div>
</div>







<div class="row">
    <form class="container">
      
      <div class="container">
        <div class="input-field">
          <i class="material-icons prefix">airport_shuttle</i>
          <input placeholder="Ex. กข-123" name="car_regis" id="car_id" type="text" class="validate">
          <label for="กรอกทะเบียน">กรอกทะเบียน</label>
        </div>
      </div>
      
      
    </form>
  </div>


<div class="row center">
      
      <a href="mec_updaterepair.jsp?" id="download-button" class="btn-large grey darken-1">submit </a>
      

          </div>

        
      





  







  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>

  </body>
</html>

