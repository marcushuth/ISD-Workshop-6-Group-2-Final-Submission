<%-- 
    Document   : displayMovie
    Created on : 31/05/2019, 8:08:11 PM
    Author     : New
--%>

<%@page import="Catalogue.model.Movie"%>
<%@page import="java.util.List"%>
<%@page import="uts.isd.model.dao.DBManager"%>
<%@page import="uts.isd.model.dao.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/demo.css">
        <title><% out.println(request.getParameter("title")); %></title>
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
            <%
                DBConnector dbc = new DBConnector();
                DBManager manager = new DBManager(dbc.openConnection());
                
                Movie movie = manager.findMovieByTitle(request.getParameter("title"));
                
                dbc.closeConnection();
//                Movie movie = new Movie(1, "Test", 2.5, 12, "action");
                session.setAttribute("foundMovie", movie);
                request.getRequestDispatcher("movieTable.jsp");
            %>
            
            <p>
                Title: <% out.println(movie.getTitle()); %>
            </p>
            <p>
                Price: $<% out.println(movie.getPrice()); %>
            </p>
            <p>
                Amount in Stock: <% out.println(movie.getAmount()); %>
            </p>
            <p>
                Genre: <% out.println(movie.getGenre()); %>
            </p>

        </div>
        
    </body>
</html>
