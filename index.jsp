<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>

<head>
    <title>LOGIN | Out-pass Management System</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css\styles.css">

    <script>

    </script>
</head>

<body>
    <div class="content">
        <div class="logo">
            <img src="images\papertray.png" height="200px" width="200px">
        </div>
        <div class="login-box">
            <h3 style="color:white;">LOGIN</h3>
            <form class="login-form" action="http://localhost:8080/outpass/login" method="post">
                <input type="text" id="email" name="email" placeholder="Email">
                <input type="password" id="password" name="password" placeholder="Password">
                <h5>${message}</h5>
                <input type="submit" id="submit" value="LOGIN">
            </form>
        </div>
    </div>
</body>

</html>