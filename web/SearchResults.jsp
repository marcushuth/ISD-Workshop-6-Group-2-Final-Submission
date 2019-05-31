<%-- 
    Document   : Show all results
    Created on : 31/05/2019, 1:37:03 PM
    Author     : naifmawlawi
--%>

<%@page import="uts.isd.model.dao.DBManager"%>
<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search results</title>
    </head>
    <body>
        <h1 align="center">Search results</h1>
        
         <jsp:include page="/ConnServlet" flush="true"/>
        <%
            DBManager manager = (DBManager)session.getAttribute("manager");
            
            User userlogin = (User)session.getAttribute("userlogin");
            User userlogout = (User)session.getAttribute("userlogout");
            
            String ID = request.getParameter("email");
            String datelogin = request.getParameter("datelogin");
            String datelogout = request.getParameter("datelogout");
            
            userlogin = manager.FindLogs(ID,"Login", datelogin);
         
            userlogout= manager.FindLogs(ID,"Logout", datelogout);
        
        
        %> 
        
        <h1 align="center">Email: <%=ID%></h1> 
        <p align="center">Your Login record: <%=userlogin%></p>
        <p align="center">Your Logout record: <%=userlogout%></p>
        <button align="center" value="delete" class="button" type="button" > Delete </button>
    </body>
</html>
