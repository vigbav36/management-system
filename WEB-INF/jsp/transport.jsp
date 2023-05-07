<!--
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
-->
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="css\authenticator.css">
    <link rel="stylesheet" href="https://fonts.google.com/specimen/Fira+Sans+Condensed">
    <link rel="stylesheet" href="css\custom.css">
    <link rel="stylesheet" href="css\bootstrap.min.css">
    <title>Transport Details</title>
</head>

<body>
    <div class="nav_bar">
        <div style="margin-left:15px;margin-top:15px;">
            <p style="font-size: 15px;margin-bottom: 0;padding-bottom: 0;">Welcome</p>
            <p style="font-size: 25px;margin-top: 0;padding-top: 0;">${name}</p>
        </div>
        <div style="margin-left:15px">
            <a href="/" style="font-size:10px;color: gainsboro">
                <p>
                    Sign Out
                </p>
            </a>
        </div>
    </div>
    <div class="content_pane">
        <div class="scan_view">
            <div class="col-sm-6 p-0 d-flex justify-content-lg-start justify-content-center">
                <h2 class="ml-lg-2">Click here to download transport</h2>
            </div>
            <c:forEach var="outpass" items="${outpass_list}">
                <tr>
                    <td>${outpass[0]}</td> 
                    <td>${outpass[1]}</td> 
                </tr>
            </c:forEach>
        </div>
    </div>
</body>

</html>