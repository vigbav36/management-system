<!DOCTYPE html>
<html>

<head>
    <title>
        Student Profile
    </title>
    <link rel="stylesheet" href="css\student.css">
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
            <h1 style="color:#454B66;">Dashboard</h1>
        </div>
        <!--
        <div class="outpass_section">
            <div class="section_header">
                <h3>Outpass Status</h3>
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
        -->
        <div class="outpass_section">
            <div class="section_header">
                <h3>Request Outpass</h3>
            </div>
            <div class="passes">
                <form class="request_form">
                    <fieldset>
                        <legend>
                            <strong>Outpass 4</strong>
                        </legend>
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
                    <div class="form_div">
                        <div class="left_form_elt">
                            <label>Out Date: </label>
                            <input type="date" class="input_field">
                        </div>
                        <div class="right_form_elt">
                            <label>Out time: </label>
                            <input type="datetime" class="input_field">
                        </div>
                    </div>
                    <div class="form_div">
                        <div class="left_form_elt">
                            <label>In Date: </label>
                            <input type="date" class="input_field">
                        </div>
                        <div class="right_form_elt">
                            <label>In time: </label>
                            <input type="datetime" class="input_field">
                        </div>
                    </div>
                    <div class="form_div">
                        <label>Priority: </label>
                        <input list="priority" name="priority" id="priority">
                        <datalist id="priority">
                            <option value="Emergency">
                            <option value="Normal">
                        </datalist>
                    </div>
                    <div class="form_div">
                        <label>Reason:</label><br>
                        <textarea rows="5" cols="50"
                            style="height: 80px;box-sizing: border-box;width:100%;resize: none;"></textarea>

                        </textarea>
                    </div>
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
        <div class="pending_section">
            <div class="section_header">
                <h3>Outpass Count</h3>
            </div>
            <div class="card">
                <p style="font-size:75px;color:#454B66">
                    <strong>
                        4/5
                    </strong>
                </p>
                <div class="passes">
                    <a href="/" style="text-decoration: none;color: #454B66;">
                        Click to view outpass history
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>

</html>