<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/ISD_Showcase_2.css">
        <title>Register</title>
    </head>
    <body>
        <div class="nav">
            <li><a href='index.jsp' style="text-decoration: none;"><h1>Online Movie Store</h1></a></li>
        </div>
        <div class="content">
            <form action="welcome.jsp" method="POST">
            <table border="0" cellpadding="2">
                <thead>
                    <tr><th><h2>Registration</h2></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr><td>Full name</td><td><input name="name" type="text"></td></tr>
                    <tr><td>Phone number</td><td><input name="phone" type="text"</td></tr>
                    <tr><td>Email</td><td><input name="email" type="email"></td></tr>
                    <tr><td>Password</td><td><input name="password" type="password"></td></tr>
                    <tr><td>Agree to TOS</td><td><input name="tos" type="checkbox"></td></tr>
                    <tr><td></td><td><input type="submit" value="Register"></td></tr>
                </tbody>
            </table>
            </form>
        </div>
            
         </body>
</html>
