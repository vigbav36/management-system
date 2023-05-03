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
        <div style="border-bottom: 1px white solid;">
            <p style="font-size: 15px;margin-bottom: 0;padding-bottom: 0;">Welcome</p>
            <p style="font-size: 25px;margin-top: 0;padding-top: 0;">${name}</p>
        </div>
        <div>
            <a href="/" style="margin:0;font-size:10px;color: gainsboro">
                <h3>
                    Sign Out
                </h3>
            </a>
        </div>
    </div>
    <div class="content_pane">
        <div>
            <h1 style="color:#454B66;">Dashboard</h1>
        </div>
        <div class="calendar_div">
            <div class="calendar">
                <div class="calendar__date">
                    <div class="calendar__day">M</div>
                    <div class="calendar__day">T</div>
                    <div class="calendar__day">W</div>
                    <div class="calendar__day">T</div>
                    <div class="calendar__day">F</div>
                    <div class="calendar__day">S</div>
                    <div class="calendar__day">S</div>
                    <div class="calendar__number"></div>
                    <div class="calendar__number"></div>
                    <div class="calendar__number"></div>
                    <div class="calendar__number">1</div>
                    <div class="calendar__number">2</div>
                    <div class="calendar__number">3</div>
                    <div class="calendar__number">4</div>
                    <div class="calendar__number">5</div>
                    <div class="calendar__number">6</div>
                    <div class="calendar__number">7</div>
                    <div class="calendar__number">8</div>
                    <div class="calendar__number">9</div>
                    <div class="calendar__number">10</div>
                    <div class="calendar__number">11</div>
                    <div class="calendar__number">12</div>
                    <div class="calendar__number">13</div>
                    <div class="calendar__number">14</div>
                    <div class="calendar__number">15</div>
                    <div class="calendar__number">16</div>
                    <div class="calendar__number">17</div>
                    <div class="calendar__number calendar__number--current">18</div>
                    <div class="calendar__number">19</div>
                    <div class="calendar__number">20</div>
                    <div class="calendar__number">21</div>
                    <div class="calendar__number">22</div>
                    <div class="calendar__number">23</div>
                    <div class="calendar__number">24</div>
                    <div class="calendar__number">25</div>
                    <div class="calendar__number">26</div>
                    <div class="calendar__number">27</div>
                    <div class="calendar__number">28</div>
                    <div class="calendar__number">29</div>
                    <div class="calendar__number">30</div>
                </div>
            </div>
            <div class="num_left">
                <h2>
                   passes to be Reviewed
                </h2>
            </div>
        </div>

        <div class="emergency_section">
            <div class="section_header">
                <div style="width: 50%;float: left;margin-left: 15px;">
                    <h3>Emergency Passes</h3>
                </div>
                <div style="margin-left:75%;text-align: center;">
                    <h3>
                        <a href="/" style="color:rgba(255,255,255,0.5);text-decoration: none;">
                            View All
                        </a>
                    </h3>
                </div>
            </div>
            <table class="passes">
                <thead>
                    <tr style="color:#454B66;">
                        <th >S.No</th>
                        <th>Name</th>
                        <th>Time</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="outpass" items="${emergencyOutpasses}">
                        <tr>
                            <td>
                                ${outpass.outpass_id}
                            </td>
                            <td>
                                ${outpass.student.name}
                            </td>
                            <td>
                                ${outpass.out_time}
                            </td>
                            <td>
                                ${outpass.status}
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="pending_section">
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
                                                <h4 style="text-align:center; border-radius: 8px; padding:3px; border:2px solid yellow;font-size: 14px;">
                                                    ${outpass.status}
                                                </h4>
                                            </div>
                                        </c:when>
                                        <c:when test="${outpass.status == 'approved'}">
                                            <div>
                                                <h4 style="text-align:center; border-radius: 8px; padding:3px; border:2px solid rgb(48, 208, 4);font-size: 14px;">
                                                    ${outpass.status}
                                                </h4>
                                            </div>
                                        </c:when>
                                        <c:when test="${outpass.status == 'under review'}">
                                            <div>
                                                <h4 style="text-align:center; border-radius: 8px; padding:3px; border:2px solid rgb(238, 185, 12);font-size: 14px;">
                                                    ${outpass.status}
                                                </h4>
                                            </div>
                                        </c:when>
                                        <c:when test="${outpass.status == 'rejected'}">
                                            <div>
                                                <h4 style="text-align:center; border-radius: 8px; padding:3px; border:2px solid rgb(193, 9, 9);font-size: 14px;">
                                                    ${outpass.status}
                                                </h4>
                                            </div>
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td>
                                    <a href="http://localhost:8080/outpass/view?sid=${outpass.student.id}&oid=${outpass.outpass_id}&wid=${warden.id}">
                                        <img style="margin-left:15px;margin-top: 7px;" src="images\arrow.png" width="15px" height="15px">
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                      </tbody>
                      </table>
                      </div>
                  </div>
              </div>
            </table>

            
        </div>
        <div class="review_section">
            <div class="section_header">
                <div style="width: 50%;float: left;margin-left: 15px;">
                    <h3>Review Passes</h3>
                </div>
                <div style="margin-left:75%;text-align: center;">
                    <h3>
                        <a href="/" style="color:rgba(255,255,255,0.5);text-decoration: none;">
                            View All
                        </a>
                    </h3>
                </div>
            </div>
            <table class="passes">
                <thead>
                    <tr style="color:#454B66;">
                        <th>S.No</th>
                        <th>Name</th>
                        <th>Time</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="outpass" items="${reviewOutpasses}">
                        <tr>
                            <td>
                                ${outpass.outpass_id}
                            </td>
                            <td>
                                ${outpass.student.name}
                            </td>
                            <td>
                                ${outpass.out_time}
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="count_section">
            <table style="background-color: white;">
                <tr>
                    <td > 
                        <img src="images\outpass.jpg" width="30px" height="30px">
                    </td>
                    <td>
                        <div style="padding-left:10px;"><span style="color:  rgba(69, 75, 102);font-weight: bolder;">32</span></div>
                        <div style="padding-left:10px;">Outpasses</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img src="images\emergency.jpg" width="30px" height="30px">
                    </td>
                    <td>
                        <div style="padding-left:10px;"><span style="color:  rgba(69, 75, 102);font-weight: bolder;">32</span></div>
                        <div style="padding-left:10px;">Emrgency Outpasses</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img src="images\review.jpg" width="30px" height="30px">
                    </td>
                    <td>
                        <div style="padding-left:10px;"><span style="color:  rgba(69, 75, 102);font-weight: bolder;">32</span></div>
                        <div style="padding-left:10px;">For Review</div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</body>

</html>