<!--
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
-->
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="css\warden.css">
    <link rel="stylesheet" href="https://fonts.google.com/specimen/Fira+Sans+Condensed">
    <link rel="stylesheet" href="css\custom.css">
    <link rel="stylesheet" href="css\bootstrap.min.css">
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
        <div>
            <h1 style="color:#454B66;">Dashboard</h1>
        </div>
        <div class="top_section">
            <div class="date_display">
                <div style="border:2px black solid;width:100px;height:100px;">
                    This is today's date
                </div>
            </div>
            <div class="emergency_passes">
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-wrapper">
                            <div class="table-title">
                                <div class="row">
                                    <div class="col-sm-6 p-0 d-flex justify-content-lg-start justify-content-center">
                                        <h2 class="ml-lg-2">ALL OUTPASSES</h2>
                                    </div>
                                </div>
                            </div>
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Name</th>
                                        <th>Room</th>
                                        <th>Out Date</th>
                                        <th>In Date</th>
                                        <th>Reason</th>
                                        <th>Status</th>
                                        <th>View</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="outpass" items="${normalOutpasses}">
                                        <tr>
                                            <td>${outpass.outpass_id}</td>
                                            <td>${outpass.student.name}</td>
                                            <td>${outpass.student.room_no}</td>
                                            <td>${outpass.out_time}</td>
                                            <td>${outpass.in_time}</td>
                                            <td>${outpass.reason}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${outpass.status == 'requested'}">
                                                        <div>
                                                            <h4
                                                                style="text-align:center; border-radius: 8px; padding:3px; border:2px solid rgb(33, 11, 113);font-size: 14px; background-color: rgb(117, 175, 233);">
                                                                ${outpass.status}
                                                            </h4>
                                                        </div>
                                                    </c:when>
                                                    <c:when test="${outpass.status == 'approved'}">
                                                        <div>
                                                            <h4
                                                                style="text-align:center; border-radius: 8px; padding:3px; border:2px solid rgb(22, 67, 10);font-size: 14px; background-color: rgb(186, 239, 173);">
                                                                ${outpass.status}
                                                            </h4>
                                                        </div>
                                                    </c:when>
                                                    <c:when test="${outpass.status == 'under review'}">
                                                        <div>
                                                            <h4
                                                                style="text-align:center; border-radius: 8px; padding:3px; border:2px solid rgb(238, 185, 12);font-size: 14px;">
                                                                ${outpass.status}
                                                            </h4>
                                                        </div>
                                                    </c:when>
                                                    <c:when test="${outpass.status == 'rejected'}">
                                                        <div>
                                                            <h4
                                                                style="text-align:center; border-radius: 8px; padding:3px; border:2px solid rgb(72, 2, 2);font-size: 14px; background-color: rgb(247, 105, 103);">
                                                                ${outpass.status}
                                                            </h4>
                                                        </div>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <a
                                                    href="http://localhost:8080/outpass/view?sid=${outpass.student.id}&oid=${outpass.outpass_id}&wid=${warden.id}">
                                                    <img style="margin-left:15px;margin-top: 7px;" src="images\arrow.png"
                                                        width="15px" height="15px">
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="all_passes">
            <div class="row">
                <div class="col-md-12">
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-6 p-0 d-flex justify-content-lg-start justify-content-center">
                                    <h2 class="ml-lg-2">ALL OUTPASSES</h2>
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Room</th>
                                    <th>Out Date</th>
                                    <th>In Date</th>
                                    <th>Reason</th>
                                    <th>Status</th>
                                    <th>View</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="outpass" items="${normalOutpasses}">
                                    <tr>
                                        <td>${outpass.outpass_id}</td>
                                        <td>${outpass.student.name}</td>
                                        <td>${outpass.student.room_no}</td>
                                        <td>${outpass.out_time}</td>
                                        <td>${outpass.in_time}</td>
                                        <td>${outpass.reason}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${outpass.status == 'requested'}">
                                                    <div>
                                                        <h4
                                                            style="text-align:center; border-radius: 8px; padding:3px; border:2px solid rgb(33, 11, 113);font-size: 14px; background-color: rgb(117, 175, 233);">
                                                            ${outpass.status}
                                                        </h4>
                                                    </div>
                                                </c:when>
                                                <c:when test="${outpass.status == 'approved'}">
                                                    <div>
                                                        <h4
                                                            style="text-align:center; border-radius: 8px; padding:3px; border:2px solid rgb(22, 67, 10);font-size: 14px; background-color: rgb(186, 239, 173);">
                                                            ${outpass.status}
                                                        </h4>
                                                    </div>
                                                </c:when>
                                                <c:when test="${outpass.status == 'under review'}">
                                                    <div>
                                                        <h4
                                                            style="text-align:center; border-radius: 8px; padding:3px; border:2px solid rgb(238, 185, 12);font-size: 14px;">
                                                            ${outpass.status}
                                                        </h4>
                                                    </div>
                                                </c:when>
                                                <c:when test="${outpass.status == 'rejected'}">
                                                    <div>
                                                        <h4
                                                            style="text-align:center; border-radius: 8px; padding:3px; border:2px solid rgb(72, 2, 2);font-size: 14px; background-color: rgb(247, 105, 103);">
                                                            ${outpass.status}
                                                        </h4>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <a
                                                href="http://localhost:8080/outpass/view?sid=${outpass.student.id}&oid=${outpass.outpass_id}&wid=${warden.id}">
                                                <img style="margin-left:15px;margin-top: 7px;" src="images\arrow.png"
                                                    width="15px" height="15px">
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="count_section">
            <table style="background-color: white;">
                <tr>
                    <td>
                        <img src="images\outpass.jpg" width="30px" height="30px">
                    </td>
                    <td>
                        <div style="padding-left:10px;"><span
                                style="color:  rgba(69, 75, 102);font-weight: bolder;">${normalOutpasses.size()}</span></div>
                        <div style="padding-left:10px;">Outpasses</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img src="images\emergency.jpg" width="30px" height="30px">
                    </td>
                    <td>
                        <div style="padding-left:10px;"><span
                                style="color:  rgba(69, 75, 102);font-weight: bolder;">${emergencyOutpasses.size()}</span></div>
                        <div style="padding-left:10px;">Emrgency Outpasses</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img src="images\review.jpg" width="30px" height="30px">
                    </td>
                    <td>
                        <div style="padding-left:10px;"><span
                                style="color:  rgba(69, 75, 102);font-weight: bolder;">${reviewOutpasses.size()}</span></div>
                        <div style="padding-left:10px;">For Review</div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</body>

</html>