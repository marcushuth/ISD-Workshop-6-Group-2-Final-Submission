<%@page import="Model.User"%>
<%@page import="uts.isd.model.dao.*"%>
<%@page import="uts.isd.controller.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.*" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Action Page</title>
    </head>
    <body>

        <%
            //Activate the database search-validate once DBManager functions are completed
            //DBManager manager = (DBManager)session.getAttribute("manager");
            String FullName = request.getParameter("FullName");
            String PhoneNumber = request.getParameter("PhoneNumber");
            String Username = request.getParameter("Username");  
            String Password = request.getParameter("Password");  
            String Status = request.getParameter("Status");  
            String Role = request.getParameter("Role");  
            //Student student = manager.findStudent(ID, password);
            User user = new User(FullName,PhoneNumber,Username,Password, Status, Role);
            if (user != null) {
                session.setAttribute("UserLogin", user);
                response.sendRedirect("UserList.jsp");       
                //response.sendRedirect("UserLogged.jsp");  
                //response.sendRedirect("loginWelcome.jsp");                        
            }else{
                session.setAttribute("existErr", "User does not exist!");
                response.sendRedirect("login.jsp");                               
            }             
        %>
        
    </body>
</html>
