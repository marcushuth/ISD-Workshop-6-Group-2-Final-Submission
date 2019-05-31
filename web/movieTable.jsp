<%-- 
    Document   : movieTable
    Created on : 31/05/2019, 9:26:12 PM
    Author     : New
--%>

<%@page import="Catalogue.model.Movie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/demo.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie</title>
    </head>
    <body>
        <ul class="nav">
            <li><a href='#' style="text-decoration: none;"><h1>Online Movie Store</h1></a></li>
            <li style="float:right"><a href="UserList.jsp">User Management</a></li>
            <li style="float:right"><a href='OrderServlet?type=selectAll'>Order Management</a></li>
            <li style="float:right"><a href="UserAM.jsp">Manager View</a></li>
            <li style="float:right"><a href="UesrView.jsp">User View</a></li>
            <li style="float:right"><a href="catalogue.jsp">Browse</a></li>>
            <li style="float:right"><a href="register.jsp">Register</a></li>
            <li style="float:right"><a href="login.jsp">Login</a></li>
            <li></li>
        </ul>
        <% Movie movie = (Movie) session.getAttribute("foundMovie"); %>
        <div class="content">
            <p>
                Movie Title: <%=out.println(movie.getTitle());%>
            </p>
        </div>
        
    </body>
</html>
