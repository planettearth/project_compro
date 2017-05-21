<%-- 
    Document   : mec_editrepair
    Created on : Apr 24, 2017, 2:45:19 AM
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
            <div class="nav-wrapper container"><a id="logo-container" href="mec_index.jsp" class="brand-logo">Automobile Maintenance</a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="LogoutServlet">Logout</a></li>
                </ul>


                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>

            </div>
        </nav>
        <br><br>


        <sql:setDataSource var="newdatasource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql:///project" user="root" password="root" />

        <sql:query var="db" dataSource="${newdatasource}"> 
            SELECT * FROM part
        </sql:query>

        <div class="row">
            <div class="col s3">
            </div>
            


            <form action="EditRepairServlet" method="POST">
                <div class="col s3">
                    <input type="hidden" name="repair_id" value="${param.repair_id}"/>
                <a href="mec_addpart.html" id="download-button" class="btn-large grey darken-1">เพิ่มอะไหล่</a><br>
                <br>
                <br>
                <select name="part" class="browser-default">
                   <c:forEach var="row" items="${db.rows}">
                       <option value="${row.part_id}">${row.part_name} </option>
                </c:forEach> 
                    
                </select>
                



            </div>

                <div class="col s3">
                    <img class="responsive-img" src="images/emp_mec_editrepair.png">
                    <br><br>

                    <div class="container">
                        <div class="input-field">
                            <i class="material-icons prefix">subdirectory_arrow_right</i>
                            <input placeholder="" name="detail" id="first_name" type="text" class="validate" style="font-size: 40px">
                            <label for="first_name">รายละเอียดการซ่อม</label>
                        </div>
                    </div>
                </div>
                <div class = "col s4"></div>

                <div class="col s3">
                    <br>
                    
                    <input placeholder="" name="Submit"id="first_name" type="submit" id="download-button" class="btn-large grey darken-1">
                </div>
            </form>





        </div>


        <br><br><br>


        <div class="row">

        </div>


        <br>








        <!--  Scripts-->
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="js/materialize.js"></script>
        <script src="js/init.js"></script>

    </body>
</html>

