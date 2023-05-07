<!--
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
-->
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="css\student.css">
    <link rel="stylesheet" href="https://fonts.google.com/specimen/Fira+Sans+Condensed">
    <link rel="stylesheet" href="css\custom.css">
    <link rel="stylesheet" href="css\bootstrap.min.css">
    <title>Student Profile</title>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
</head>

<body onload="displayDate()" style="background-color:rgb(235 237 242);">
    <div class="nav_bar">

        <div class="menu_components">
            <div class="profile" style="background-color:  #353b48;justify-content: flex-start;">
                <img src="images\papertray.png" height="40px" width="40px">
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
                <a href="/" style="font-size:10px;color: gainsboro">
                    <img src="images\exit.png" height="25px" width="25px">
                </a>
            </div>
        </div>
    </div>
    <div class="content_pane">
        <div>
            <h1 style="color:#454B66;">Dashboard</h1>
        </div>
        <div class="top_section">
            <div class="date_display">
                <div>Today</div>
                <div id="today" style="border:1px black solid;width:80px;font-size: 50px;text-align: center;">

                </div>
                <div id="more_today">

                </div>
            </div>
            <div class="pending_section">
                <p style="font-size: 50px;">
                    <strong>
                        ${student.outpasses}/5
                    </strong>
                </p>
            </div>
            <div class="view_routes">
                <h3>Bus Routes</h3>
            </div>
        </div>
        <c:choose>
            <c:when test="${!existing}">
                <div class="request_outpass_section">
           
                    <div style="background-color:  #353b48;">
                        <h5 class="ml-lg-2" style="color:white;padding:3px;">Request Outpass ${existing}</h5>
                    </div>
                    <form class="request_form" action="http://localhost:8080/outpass/request">


                        <label>Outpass No</label>
                        <span>${5 - student.outpasses}</span>
                        <label>Out Date and time</label>
                        <input type="datetime-local" class="input_field" name="out_date" />

                        <label>In Date and time</label>
                        <input type="datetime-local" class="input_field" name="in_date" />


                        <label>Priority</label>
                        <input type="text" list="priority_list" name="priority" id="priority" />
                        <datalist id="priority_list">
                            <option value="Emergency">
                            <option value="Normal">
                        </datalist>

                        <label>Route</label>
                        <input type="text" list="route_list" name="route" id="route" />
                        <datalist id="route_list">
                            <option value="s1">
                            <option value="s2">
                            <option value="s3">
                            <option value="not required">
                        </datalist>


                        <label>Reason</label>
                        <textarea rows="5" cols="50"
                            style="height: 80px;box-sizing: border-box;width:100%;resize: none;" id="reason"
                            name="reason">
                            </textarea>
                        <label></label>
                        <input type="submit" id="button" />

                    </form>
        </div>
        </c:when>
        <c:otherwise>
            <div class="outpass_status_section">
                <div style="background-color:  #353b48;">
                    <h5 class="ml-lg-2" style="color:white;padding:5px;">Outpass Status</h5>
                </div>
                <div>
                    <div class="profile_content">
                        <div style="float:left;">
                            <img src="images\woman.jpg" height="50px" width="50px" style="border-radius: 8px;">
                        </div>
                        <div>
                            <ul style="list-style-type:none;">
                                <li><strong>Pass No: </strong>${existing_outpass.outpass_id}</li>
                                <li><strong>Name: </strong> ${student.name}</li>
                                <li><strong>ID: </strong>${student.id}</li>
                            </ul>
                        </div>
                        <c:choose>
                            <c:when test="${existing_outpass.status == 'approved'}">
                                <div id="qrcode">
                                    <script>
                                        var qrcode = new QRCode("qrcode", "http://localhost:8080/outpass/view?oid=${existing_outpass.outpass_id}");
                                    </script>
                                </div>
                            </c:when>
                        </c:choose>
                    </div>
                    <div class="outpass_content">
                        <ul style="list-style-type:none;">
                            <li><strong>Out Date:</strong> ${existing_outpass.out_time}</li>
                            <li><strong>In Date:</strong> ${existing_outpass.in_time}</li>
                            <li><strong>Type:</strong> ${existing_outpass.type}</li>
                            <li><strong>Reason:</strong> ${existing_outpass.reason}</li>
                            <li><strong>Comments -</strong>${existing_outpass.comment}</li>
                        </ul>
                        <div style="font-size: 30px; padding: 5px; border:2px black solid;border-radius: 8px; ">
                            ${existing_outpass.status}
                        </div>
                    </div>
                </div>
            </div>
        </c:otherwise>
        </c:choose>

        <div class="outpass_history">
            <div class="row">
                <div class="col-md-12">
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-6 p-0 d-flex justify-content-lg-start justify-content-center">
                                    <h2 class="ml-lg-2">Outpass History</h2>
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Out Date</th>
                                    <th>In Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="outpass" items="${all_outpass}">
                                    <tr>
                                        <td>${outpass.outpass_id}</td>
                                        <td>${outpass.out_time}</td>
                                        <td>${outpass.in_time}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>