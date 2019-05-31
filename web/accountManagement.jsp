<%@page import="onlinemoviestore.model.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/ISD_Showcase_2.css"> 
        <title>Account Page</title>
    </head>
    
    <%
        String log;
        User user = (User) session.getAttribute("user");

        if (user != null) {
            log = user.getName();
        } else {
            log = "a guest";
        }
    %>
    
    <body>
        <div class="nav">
            <li><a href='storefront.jsp' style="text-decoration: none;"><h1>Online Movie Store</h1></a></li>
        </div>
        
        <div class="content">
            <h2>Account Details</h2>
            
            <table width="100%" border="1px">
                <th<p>You are logged in as <%=log%></p></h>
            <%
            if (user != null) {
            log = user.getName();
            %>
                <tr><td>Name: <%=user.getName()%></td></tr>
                <tr><td>Email: <%=user.getEmail()%></td></tr>
                <tr><td>Phone: <%=user.getPhone()%></td></tr>
                <tr><td>Password: <%=user.getPassword()%></td></tr>
                <tr><td><button type ="button">Edit Details</button><button type="button">Delete Registration</button>
            </table>
            <% } %>
        
        
        
        </div>
    </body>
</html>
