<%@page import="Catalogue.model.Movie"%>
<%@page import="java.util.List"%>
<%@page import="uts.isd.model.dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/demo.css">
        <title>Catalogue</title>
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
        
        <div class="content">
            <form action="displayMovie.jsp" method="POST">
            Search by title: <input type='text' name="title">
            <br>
            <input type="submit" value="Submit">
            <input type="reset">
            </form>
        </div>
    </body>
</html>
