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
        // function loadDoc(param) {
        // var xhttp = new XMLHttpRequest();
        // xhttp.onreadystatechange = function() {
        //     if (this.readyState == 4 && this.status == 200) {

        //         document.getElementById("top_section").style.display = 'none';

        //         document.getElementById('history').style.backgroundColor = '#353b48';
        //         document.getElementById('dashboard').style.backgroundColor = '#353b48';
        //         document.getElementById('emergency').style.backgroundColor = '#353b48';

        //         document.getElementById(param).style.backgroundColor = '#4d525e';

        //         document.getElementById("content_pane").innerHTML = this.response;

        //     }
        // };
        // xhttp.open("GET", "ajax_info.txt", true);
        // xhttp.send();
        // }
        // function loadDoc2(param) {
        // var xhttp = new XMLHttpRequest();
        // xhttp.onreadystatechange = function() {
        //     if (this.readyState == 4 && this.status == 200) {

        //         document.getElementById('history').style.backgroundColor = '#353b48';
        //         document.getElementById('dashboard').style.backgroundColor = '#353b48';
        //         document.getElementById('emergency').style.backgroundColor = '#353b48';

        //         document.getElementById(param).style.backgroundColor = '#4d525e';

        //         document.getElementById("content_pane").innerHTML = this.response;

        //     }
        // };
        // xhttp.open("GET", "ajax_info.txt", true);
        // xhttp.send();
        // }

        function show_emergency(){
            document.getElementById("all_passes").style="display:none";
            document.getElementById("top_section").style="display:none";
            document.getElementById("dashboard1").innerHTML="Emergency Outpasses";
            document.getElementById("dashboard").style="background-color:#353b48;";
            document.getElementById("emergency_passes").style="grid-row-start: 2;grid-row-end: 5;grid-column-start: 1;grid-column-end: 4;";
            document.getElementById("emergency").style="background-color: #4d525e;"
            console.log("hello");
        }

        function show_all(){
            document.getElementById("all_passes").style="";
            document.getElementById("top_section").style="";
            document.getElementById("dashboard1").innerHTML="Dashboard";
            document.getElementById("dashboard").style="background-color: #4d525e;";
            document.getElementById("emergency_passes").style="grid-row-start: 2;grid-row-end: 5;grid-column-start: 1;grid-column-end: 4;display:none";
            document.getElementById("emergency").style="background-color: #353b48;"
            console.log("hello2");
        }
    </script>
</head>

<body onload="displayDate()">
    <div class="nav_bar">
       
        <div class="menu_components">
            <div class="profile" style="background-color:  #353b48;justify-content: flex-start;">
                <img src="images\papertray.png" height="40px" width="40px">
                <h3>OMS</h3>
            </div>
            <a id="dashboard" href="#" style="background-color: #4d525e;"  onclick="show_all()">
                Dashboard
            </a>
            <a id="emergency" href="#" onclick="show_emergency()">
                Emergency Passes
            </a>
            <!--
                <a id="history" href="#" onclick="loadDoc2('history')">
                    History
                </a>
            -->
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
    <div id="content_pane" class="content_pane">
        <div id="heading1">
            <h1 id="dashboard1" style="color:#454B66;">Dashboard</h1>
        </div>
        <div class="top_section" id="top_section">
            <div class="emergency_count">
                <img src="images\outpass.jpg" width="30px" height="30px">
                <div style="padding-left:10px;"><span
                        style="color:  rgba(69, 75, 102);font-weight: bolder;">${normalOutpasses.size()}</span></div>
                <div style="padding-left:10px;">Outpasses</div>
            </div>
            <div class="normal_count">
                <img src="images\emergency.jpg" width="30px" height="30px">

                <div style="padding-left:10px;"><span
                        style="color:  rgba(69, 75, 102);font-weight: bolder;">${emergencyOutpasses.size()}</span></div>
                <div style="padding-left:10px;">Emergency Outpasses</div>
            </div>
            <div class="review_count">

                <img src="images\review.jpg" width="30px" height="30px">

                <div style="padding-left:10px;"><span
                        style="color:  rgba(69, 75, 102);font-weight: bolder;">${reviewOutpasses.size()}</span>
                </div>
                <div style="padding-left:10px;">For Review</div>
            </div>
        </div>
        <div id='all_passes' class="all_passes">
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
                                    <c:choose>
                                        <c:when test="${outpass.status == 'requested' || outpass.status == 'under review'}">
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
                                    </c:when>
                                    </c:choose>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div id='emergency_passes' class="all_passes" style="grid-row-start: 2;grid-row-end: 5;grid-column-start: 1;grid-column-end: 4;display: none;">
            <div class="row">
                <div class="col-md-12">
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-6 p-0 d-flex justify-content-lg-start justify-content-center">
                                    <h2 class="ml-lg-2">Emergency Outpasses</h2>
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
                                <c:forEach var="outpass" items="${emergencyOutpasses}">
                                    <c:choose>
                                        <c:when test="${outpass.status == 'requested' || outpass.status == 'under review'}">
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
                                    </c:when>
                                    </c:choose>
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