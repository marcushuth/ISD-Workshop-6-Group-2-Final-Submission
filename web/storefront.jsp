<%@page contentType="text/html" import="onlinemoviestore.model.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%User user = (User) session.getAttribute("user");%>

<html>
    <head>
        <title>Movie Storefront</title>
        <meta  http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/ISD_Showcase_2.css">
    </head>
    <body>
        <ul class="nav">
            <li><a href='#' style="text-decoration: none;"><h1>Online Movie Store</h1></a></li>
            <% if(user != null) {%>
            <li style="float:right"><a href="logout.jsp">Logout</a></li>
            <% } else { %>
            <li style="float:right"><a href="login.jsp">Login</a></li>
            <% } %>
            <li style="float:right"><a href="">Order</a></li>
            <li style="float:right"><a href="accountManagement.jsp">Account Management</a></li>
            
        </ul>
        <div class="content">
            <div class="row">
                <div class="column">
                    <p style="font-size: 72px">Browse the selection</p>
                </div>
                <div class="column">
                    <p style="font-size: 72px">Pick by genre or year</p>
                </div>
            </div>           
        </div>
    </body>
</html>