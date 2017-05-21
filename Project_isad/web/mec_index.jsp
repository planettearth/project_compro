<%-- 
    Document   : mec_index
    Created on : Apr 21, 2017, 4:47:15 PM
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
      <br><br><br><br><br>
      <div class="col s3"></div>
      <div class="col s2">
      <img class="responsive-img" src="images/queue.png" width="    100" height="    100">
     
     </div>
     <div class="col s2">
      
     <img class="responsive-img" src="images/update_fix.png" width="    150" height="    150"><
     </div>
     <div class="col s2">
     <img class="responsive-img" src="images/evaluate.png" width="    150" height="    150">
     </div>
     <div class="col s3"></div>
     

  </div>


<div class="row">
      <div class="col s3"></div>
      <div class="col s2">
      <a href="mec_queue.jsp" id="download-button" class="btn-large grey darken-1">คิว </a>
     </div>
     <div class="col s2">
       <a href="mec_num2.html" id="download-button" class="btn-large grey darken-1">อัพเดทการซ่อม </a>
     </div>
     <div class="col s2">
      <a href="mec_num1.html" id="download-button" class="btn-large grey darken-1">ประเมินการซ่อม</a>
     </div>
     <div class="col s3"></div>
     <br><br><br><br><br><br><br><br><br>

  </div>


        
      





  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>

  </body>
</html>

