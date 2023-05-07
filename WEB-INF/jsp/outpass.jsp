<!--
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
-->
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="css\outpass.css">
    <script>
        function reject() {
            document.getElementById("review_form").style = "background-color:#c7cadd;display:none"
            document.getElementById("reject_form").style = "background-color:#c7cadd;"
        }
        function review() {
            document.getElementById("review_form").style = "background-color:#c7cadd;"
            document.getElementById("reject_form").style = "background-color:#c7cadd;display:none"
        }
    </script>
</head>

<body>
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


    </div>
    <div class="content_pane">
        <div class="outpass">
            <div class="student_details">
                <table style="background-color: white;">
                    <tr>
                        <td>
                            <div>
                                <h3>NAME</h3>
                            </div>
                        </td>
                        <td>
                            <div>
                                <h3>${outpass.student.name}</h3>
                            </div>
                        </td>
                        <td rowspan="5">
                            <img src="images/profile.avif" height="150px">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <h3>YEAR</h3>
                            </div>
                        </td>
                        <td>
                            <div>
                                <h3>${outpass.student.year}</h3>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <h3>BRANCH</h3>
                            </div>
                        </td>
                        <td>
                            <div>
                                <h3>${outpass.student.branch}</h3>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <h3>HOSTEL</h3>
                            </div>
                        </td>
                        <td>
                            <div>
                                <h3>${outpass.student.hostel_no}</h3>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <h3>ROOM</h3>
                            </div>
                        </td>
                        <td>
                            <div>
                                <h3>${outpass.student.room_no}</h3>
                            </div>
                        </td>
                    </tr>

                </table>
            </div>
            <div class="outpass_details">
                <table style="background-color: white;">
                    <tr>
                        <td>
                            <div>
                                <h3>TYPE</h3>
                            </div>
                        </td>
                        <td>
                            <div>
                                <h3>${outpass.type}</h3>
                            </div>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <div>
                                <h3>OUT-DATE</h3>
                            </div>
                        </td>
                        <td>
                            <div>
                                <h3>${outpass.out_time}</h3>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <h3>IN-TIME</h3>
                            </div>
                        </td>
                        <td>
                            <div>
                                <h3>${outpass.in_time}</h3>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <h3>REASON</h3>
                            </div>
                        </td>
                        <td>
                            <div>
                                <h3>${outpass.reason}</h3>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="choice">
            <c:choose>
                <c:when test="${outpass.status == 'requested'}">

                    <div class="button" id="accept_button"><a
                            href="http://localhost:8080/outpass/accept?oid=${outpass.outpass_id}&wid=${warden_id}">Accept</a>
                    </div>

                    <div class="button" id="reject_button" onclick="reject()">
                        Reject
                    </div>

                    <div class="button" id="review_button" onclick="review()">
                        Review
                    </div>
                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${user.type == 'authenticator'}">
                            <div class="button" id="auth_button"><a
                                href="http://localhost:8080/outpass/authenticate?oid=${outpass.outpass_id}">Accept</a>
                            </div>
                        </c:when>
                    </c:choose>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="comment_form" style="background-color:#c7cadd;display: none;" id="reject_form">
            <form action="http://localhost:8080/outpass/reject" name="form_comment1" id="form_comment1">
                <textarea placeholder="Reason for Rejection" id="reason" name="reason" rows="5" cols="100"></textarea>
                <input type="hidden" value="${outpass.outpass_id}" name="oid">
                <input type="hidden" value="${warden_id}" name="wid">
            </form>
            <input type="submit" value="submit" id="submit1" form="form_comment1">
        </div>
        <div class="comment_form" style="background-color:#c7cadd;display: none;" id="review_form">
            <form action="http://localhost:8080/outpass/review" name="form_comment2" id="form_comment2">
                <textarea placeholder="Add comment for student" id="reason" name="reason" rows="5"
                    cols="100"></textarea>
                <input type="hidden" value="${outpass.outpass_id}" name="oid">
                <input type="hidden" value="${warden_id}" name="wid">
            </form>
            <input type="submit" value="submit" id="submit2" form="form_comment2">
        </div>
    </div>
</body>

</html>