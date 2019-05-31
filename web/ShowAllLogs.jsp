<%-- 
    Document   : ShowAllLogs
    Created on : 31/05/2019, 1:52:33 PM
    Author     : naifmawlawi
--%>

<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="uts.isd.model.User"%>
<%@page import="uts.isd.model.dao.DBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show All Logs</title>
    </head>
    <body>
        <h1 align="center">Show All Logs</h1>
         <jsp:include page="/ConnServlet" flush="true"/>
        <%
            DBManager manager = (DBManager)session.getAttribute("manager");
            User userlogs = (User)session.getAttribute("userlogs");
            List <User> userLogsList = Arrays.asList(userlogs);
            
            String ID = request.getParameter("ID");
            
            userLogsList =manager.getUserLogs("naif");
            
        %>
        
       
           <h1 align="center"> <%=userLogsList%> <h1>
    </body>
</html>
