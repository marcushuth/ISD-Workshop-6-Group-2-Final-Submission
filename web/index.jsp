<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="uts.isd.controller.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/demo.css">
        <title>Home Page</title>       
    </head>
     <body onload="startTime()">
      <title>Online Movie Store</title>
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
            
            <div class="row">
                <div class="column">
                    <p style="font-size: 72px">Thousands of movies waiting for you.</p>
                    <p style="font-size: 50px">Let's get started</p>
                </div>
                <div class="column">
                    <p style="font-size: 72px">Login or register now to start browsing</p>
                </div>
            </div>           
        </div>
       <jsp:include page="/ConnServlet" flush="true" />
    </body>
</html>
