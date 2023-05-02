<!--
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
-->
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css\outpass.css">
        <link rel="stylesheet" href="https://fonts.google.com/specimen/Fira+Sans+Condensed">
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
                <h1 style="color:#454B66;">Outpass View</h1>
            </div>
            <div class="student_details">
                <div class="section_header">
                    <div style="width: 50%;float: left;margin-left: 15px;">
                        <h3>Student Details</h3>
                    </div>
                    <div style="margin-left:75%;text-align: center;">
                        <h3>
                            <a href="/" style="color:rgba(255,255,255,0.5);text-decoration: none;">
                                View All
                            </a>
                        </h3>
                </div>
        
                </div>
                <div class="passes">
                    <table>
                        <tr>
                            <td>
                                <div><h3>NAME</h3></div>
                            </td>
                            <td>
                                <div><h3>${outpass.student.name}</h3></div>
                            </td>
                            <td rowspan="5">
                                <img src="images/profile.avif" height="150px">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div><h3>YEAR</h3></div>
                            </td>
                            <td>
                                <div><h3>${outpass.student.year}</h3></div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div><h3>BRANCH</h3></div>
                            </td>
                            <td>
                                <div><h3>${outpass.student.branch}</h3></div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div><h3>HOSTEL</h3></div>
                            </td>
                            <td>
                                <div><h3>${outpass.student.hostel_no}</h3></div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div><h3>ROOM</h3></div>
                            </td>
                            <td>
                                <div><h3>${outpass.student.room_no}</h3></div>
                            </td>
                        </tr>
                        
                    </table>    
                </div>
            </div>
            <div class="outpass_details" >
                <div class="section_header">
                    <div style="width: 50%;float: left;margin-left: 15px;">
                        <h3>OUTPASS DETAILS</h3>
                    </div>
                    <div style="margin-left:75%;text-align: center;">
                        <h3>
                            <a href="/" style="color:rgba(255,255,255,0.5);text-decoration: none;">
                                View All
                            </a>
                        </h3>
                    </div>
                </div>
                <table>
                    <tr>
                        <td>
                            <div><h3>TYPE</h3></div>
                        </td>
                        <td>
                            <div><h3>${outpass.type}</h3></div>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <div><h3>OUT-DATE</h3></div>
                        </td>
                        <td>
                            <div><h3>${outpass.out_time}</h3></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div><h3>IN-TIME</h3></div>
                        </td>
                        <td>
                            <div><h3>${outpass.in_time}</h3></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div><h3>REASON</h3></div>
                        </td>
                        <td>
                            <div><h3>${outpass.reason}</h3></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div><h3>OUTPASSES REMAINING</h3></div>
                        </td>
                        <td>
                            <div><h3>${outpass.student.outpasses}</h3></div>
                        </td>
                    </tr>
                </table>
                
            </div>
            <div class="choice">
                <table>
                    <tr>
                        <c:choose>
                            <c:when test="${outpass.status == 'requested'}">
                                <td>
                                    <div class="button"><a href="http://localhost:8080/outpass/accept?oid=${outpass.outpass_id}&wid=${warden_id}"><h3>Accept</h3></a></div>
                                </td>
                           
                                <td>
                                    <div class="button">
                                        <h3>Reject</h3>
                                        <form action="http://localhost:8080/outpass/reject">
                                            <input type="text" placeholder="reason" id="reason" name="reason">
                                            <input type="hidden" value="${outpass.outpass_id}" name="oid">
                                            <input type="hidden" value="${warden_id}" name="wid">
                                            <input type="submit" value="submit">
                                        </form>
                                    </div>
                                </td>
                                <td>
                                    <div class="button">
                                        <a><h3>Review</h3></a>
                                        <form action="http://localhost:8080/outpass/review">
                                            <input type="text" placeholder="reason" id="reason" name="reason">
                                            <input type="hidden" value="${outpass.outpass_id}" name="oid">
                                            <input type="hidden" value="${warden_id}" name="wid">
                                            <input type="submit" value="submit">
                                        </form>
                                    </div>
                                </td>
                            </c:when>
                        </c:choose>
                    </tr>
                </table>
            </div>
        </div>
    </body>
</html>

