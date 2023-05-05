<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="css\student.css">
    <link rel="stylesheet" href="https://fonts.google.com/specimen/Fira+Sans+Condensed">
    <link rel="stylesheet" href="css\custom.css">
    <link rel="stylesheet" href="css\bootstrap.min.css">
    <title>Student Profile</title>
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
            <div class="pending_section">
                <p style="font-size: 50px;">
                    <strong>
                        4/5
                    </strong>
                </p>
            </div>
        </div>
        <div class="outpass_status_section">
            <div style="background-color: rgb(69, 75, 102);">
                <h2 class="ml-lg-2" style="color:white">Outpass History</h2>
            </div>
            <div class="passes">
                <div class="outpass">
                    <div style="background-color: #c9cce0;border-radius: 8px;padding: 10px;margin: 10px;">
                        <div style="float:left;">
                            <img src="papertray.png" height="100px" width="100px">
                        </div>
                        <div style="margin-left: 30%;">
                            <ul style="list-style-type:none;">
                                <li>Pass No: 4 </li>
                                <li>Name: Vignesh SM</li>
                                <li>ID: 205001123</li>
                            </ul>
                        </div>
                    </div>
                    <ul style="list-style-type:none;">
                        <li> Out Date: 23/10/22</li>
                        <li>Out time: 3:00 pm</li>
                        <li>In Date: 23/4/23</li>
                        <li>In time: 8:00 am</li>
                        <li>Type: Emergency</li>
                        <li>Reason: I wanna go home</li>
                    </ul>
                </div>
                <div class="status">
                    Approved!
                </div>
            </div>
        </div>
        <div class="request_outpass_section">
            <div style="background-color: rgb(69, 75, 102);">
                <h2 class="ml-lg-2" style="color:white">Request Outpass</h2>
            </div>
            <form class="request_form" action="http://localhost:8080/outpass/request">
                <fieldset>
                    <legend>
                        <strong>Outpass 4</strong>
                    </legend>
                    <!--
                    <div style="background-color: #c9cce0;border-radius: 8px;padding: 10px;margin: 10px;">
                        <div style="float:left;">
                            <img src="images\profile.avif" height="100px" width="100px">
                        </div>
                        <div style="margin-left: 30%;">
                            <ul style="list-style-type:none;">
                                <li>Name: ${student.name}</li>
                                <li>ID: ${student.id}</li>
                                <li>Hostel: ${student.hostel_no}</li>
                                <li>Room: ${student.room_no}</li>
                            </ul>
                        </div>
                    </div>
                </fieldset>
            -->
                <div class="form_div">
                    <div class="left_form_elt">
                        <label>Out Date: </label>
                        <input type="date" class="input_field" name="out_date">
                    </div>
                    <div class="right_form_elt">
                        <label>Out time: </label>
                        <input type="datetime" class="input_field">
                    </div>
                </div>
                <div class="form_div">
                    <div class="left_form_elt">
                        <label>In Date: </label>
                        <input type="date" class="input_field" name="in_date">
                    </div>
                    <div class="right_form_elt">
                        <label>In time: </label>
                        <input type="datetime" class="input_field">
                    </div>
                </div>
                <div class="form_div">
                    <label>Priority: </label>
                    <input type="text" list="priority_list" name="priority" id="priority">
                    <datalist id="priority_list">
                        <option value="Emergency">
                        <option value="Normal">
                    </datalist>
                </div>
                <div class="form_div">
                    <label>Reason:</label><br>
                    <textarea rows="5" cols="50" style="height: 80px;box-sizing: border-box;width:100%;resize: none;"
                        id="reason" name="reason"></textarea>

                </div>
                </fieldset>
                <div class="form_div">
                    <center>
                        <button>
                            Submit
                        </button>
                    </center>
                </div>
            </form>
        </div>
    </div>
</body>

</html>