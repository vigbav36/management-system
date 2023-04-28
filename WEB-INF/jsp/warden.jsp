<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css\warden.css">
    </head>
    <body>
            <div class="nav_bar">
                <div style="width: 50%;float: left;margin-left: 15px;">
                    <h3>
                        WELCOME ${warden.name}
                    </h3>
                </div>
                <!--
                <div style="margin-left:90%">
                    <a href="/"><h3>
                        Sign Out
                    </h3></a>
                </div>
            -->
            </div>
            <div class="content_pane">
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
                    <div class="passes">
                        <div class="section_item">
                            <a style="text-decoration: none;color: white;" href="/">
                                20/2/23 6:00pm >
                            </a>
                        </div>
                        <div class="section_item">
                            <a style="text-decoration: none;color: white;" href="/">
                                20/2/23 6:00pm >
                            </a>
                        </div>
                        <div class="section_item">
                            <a style="text-decoration: none;color: white;" href="/">
                                20/2/23 6:00pm >
                            </a>
                        </div>
                        <div class="section_item">
                            <a style="text-decoration: none;color: white;" href="/">
                                20/2/23 6:00pm >
                            </a>
                        </div>
                        <div class="section_item">
                            <a style="text-decoration: none;color: white;" href="/">
                                20/2/23 6:00pm >
                            </a>
                        </div>
                        <div class="section_item">
                            <a style="text-decoration: none;color: white;" href="/">
                                20/2/23 6:00pm >
                            </a>
                        </div>
                    </div>
                </div>
                <div class="pending_section">
                    <div class="section_header">
                        <div style="width: 50%;float: left;margin-left: 15px;">
                            <h3>All Out-Passes</h3>
                        </div>
                        <div style="margin-left:75%;text-align: center;">
                                <h3>
                                    <a href="/" style="color:rgba(255,255,255,0.5);text-decoration: none;">
                                        View All
                                    </a>
                                </h3>
                        </div>
                    </div>
                    <h1>${normalOutpasses}</h1>
                        <table class="passes">
                            <thead>
                                <tr style="color:#454B66;">
                                    <th>S.No</th>
                                    <th>Name</th>
                                    <th>Time Applied</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                                <c:forEach var="outpass" items="${normalOutpasses}">
                                <tr>
                                    <td>
                                        1.
                                    </td>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        <p style="background-color: green;border-radius: 8px;padding:2px;">
                                           
                                        </p>
                                    </td>
                                </tr>
                                </c:forEach>
                            </tbody>
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
                    <div class="passes">
                        <p class="section_item">
                            <a style="text-decoration: none;color: white;" href="/">
                                20/2/23 6:00pm >
                            </a>  
                        </p>
                        <p class="section_item">
                            <a style="text-decoration: none;color: white;" href="/">
                                20/2/23 6:00pm >
                            </a>  
                        </p>
                        <p class="section_item">
                            <a style="text-decoration: none;color: white;" href="/">
                                20/2/23 6:00pm >
                            </a>  
                        </p>
                        <p class="section_item">
                            <a style="text-decoration: none;color: white;" href="/">
                                20/2/23 6:00pm >
                            </a>  
                        </p>
                    </div>
                </div>
            </div>
    </body>
</html>


