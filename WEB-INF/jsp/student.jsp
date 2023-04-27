<!DOCTYPE html>
<html>

<head>
    <title>
        Student Profile
    </title>
    <link rel="stylesheet" href="css\student.css">
</head>

<body>
    <div class="nav_bar">
        <div style="width: 50%;float: left;margin-left: 15px;">
            <h3>
                Welcome Vignesh!
            </h3>
        </div>
        <div style="margin-left:90%">
            <a href="/">
                <h3>
                    Sign Out
                </h3>
            </a>
        </div>
    </div>
    <div class="content_pane">
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
        <!--
        <div class="outpass_section">
            <div class="section_header">
                    <h3>Request Outpass</h3>
            </div>
            <div class="passes">
                <form class="request_form">
                    <fieldset>
                        <legend><strong>Outpass 4</strong></legend>
                        <div style="margin-top:20px;">
                            <label>Out Date: </label>
                            <input type="date" class="input_field">
                            <label>Out time: </label>
                            <input type="datetime" class="input_field">
                        </div>
                       <div style="margin-top:20px;">
                        <label>In Date: </label>
                        <input type="date" class="input_field">
                        <label>In time: </label>
                        <input type="datetime" class="input_field">
                       </div>
                       <div style="margin-top:20px;">
                        <label>Priority: </label>
                        <input type="radio"><label>Emergency</label>
                        <input type="radio"><label>Normal</label>
                       </div>
                       <div style="margin-top:20px;">
                        <label>Reason:</label><br>
                        <textarea rows="5" cols="50" style="height: 80px;box-sizing: border-box;resize: none;"></textarea>

                        </textarea>
                       </div>
                       <div style="margin-top:20px;">
                            <center>
                                <button>
                                    Submit
                                </button>
                            </center>
                       </div>
                    </fieldset>
                    
                </form>
            </div>
        </div>-->
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
            <p
                style="font-size:40px;margin-left:40%;width:20%;padding:2px;border-radius: 8px;box-shadow: 2px 2px 4px gray;">
                4/5
            </p>
            <div class="section_item">
                <a href="/" style="text-decoration: none;color:rgba(255,255,255,0.6);">
                    View Outpass History
                </a>
            </div>
        </div>
    </div>
</body>

</html>