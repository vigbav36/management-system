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
            <div class="header">
                <h2>
                    SSMCE
                </h2>
                <div>
                    <h6 style="color:white;">Outpass</h6>
                    <h4>
                        ${outpass.type}
                    </h4>
                </div>
            </div>
            <div class="student_details">
                <div id="branch">
                    <p>Branch</p>
                    ${outpass.student.branch}
                </div>
                <div id="year">
                    <p>Year</p>
                    ${outpass.student.year}
                </div>
                <div id="hostel">
                    <p>Hostel</p>
                    ${outpass.student.hostel_no}
                </div>
                <div id="room">
                    <p>Room</p>
                    ${outpass.student.room_no}
                </div>
                <div id="indate">
                    <p>In date</p>
                    ${outpass.in_time}
                </div>
                <div id="outdate">
                    <p>Out date</p>
                    ${outpass.out_time}
                </div>
            </div>
            <div class="outpass_details">
                <div style="padding-left: 15px;">
                    <div>
                        <p>Name</p>
                        <h2 style="margin-top:0px;">
                            ${outpass.student.name}
                        </h2>
                    </div>
                    <div>
                        <p>Reason</p>
                        <p style="margin-top:0px;font-size: 25px;color: #353b48;">
                            ${outpass.reason}
                        </p>
                    </div>
                </div>
            </div>
               
        </div>
        <div class="choice">
            <c:choose>
                <c:when test="${outpass.status == 'requested' || outpass.status == 'under review'}">

                    <div class="button1" id="accept_button"><a
                            href="http://localhost:8080/outpass/accept?oid=${outpass.outpass_id}&wid=${warden_id}"> <img src="images\accept.jpeg" width="30px" height="30px"></a>
                    </div>

                    <c:choose>
                        <c:when test="${outpass.status != 'under review'}">
                        <div class="button1" id="review_button" onclick="review()">
                            <img src="images\review.jpeg" width="30px" height="30px">
                        </div>
                        </c:when>
                    </c:choose>

                    <div class="button1" id="reject_button" onclick="reject()">
                        <img src="images\reject.jpeg" width="30px" height="30px">
                    </div>
                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${user.type == 'authenticator'}">
                            <div class="button" id="auth_button"><a
                                href="http://localhost:8080/outpass/authenticate?oid=${outpass.outpass_id}">Authenticate</a>
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