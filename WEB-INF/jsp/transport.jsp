<!--
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
-->
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="css\transport.css">
    <link rel="stylesheet" href="https://fonts.google.com/specimen/Fira+Sans+Condensed">
    <link rel="stylesheet" href="css\custom.css">
    <link rel="stylesheet" href="css\bootstrap.min.css">
    <title>Transport Details</title>
    <script>
        function displayDate() {
            var today = new Date();
            var dd = String(today.getDate());
            var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
            var yyyy = today.getFullYear();
            div = document.getElementById('today');
            div.innerHTML = dd;
            div2 = document.getElementById('more_today');
            div2.innerHTML = mm + ',' + yyyy;
        }
    </script>
</head>

<body onload="displayDate()">
    <div class="nav_bar">
        <div class="menu_components">
            <div class="profile" style="background-color:  #353b48;justify-content: flex-start;">
                <img src="images\database.png" height="40px" width="40px">
                <h3>OMS</h3>
            </div>
            <a id="dashboard" href="/" style="background-color: #4d525e;" onclick="loadDoc('dashboard')">
                Dashboard
            </a>
        </div>
        <div class="profile">
            <!--<img src="images/woman.jpg" height="40px" width="40px">-->
            <p style="font-size: 25px;font-weight: 400;">
                ${name}
            <p>
                <div style="margin-left:15px">
                    <a href="http://localhost:8080/outpass/signout " style="font-size:10px;color: gainsboro">
                        <img src="images\exit.png" height="25px" width="25px">
                    </a>
                </div>
        </div>
    </div>
    <div class="content_pane">
        <div class="scan_view">
            <div class="row">
                <div class="col-md-12">
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-6 p-0 d-flex justify-content-lg-start justify-content-center">
                                    <h2 class="ml-lg-2">Route Information</h2>
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Route</th>
                                    <th>Demand</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="outpass" items="${outpass_list}">
                                    <tr>
                                        <td>${outpass[0]}</td>
                                        <td>${outpass[1]}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="date_display">
            <div>
                Today
            </div>
            <div id="today" style="border:1px black solid;width:80px;font-size: 50px;text-align: center;">
            </div>
            <div id="more_today">

            </div>
        </div>
    </div>
</body>

</html>