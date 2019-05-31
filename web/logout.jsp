<%@page import="uts.isd.model.dao.DBManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/ISD_Showcase_2.css">
        <title>Logout</title>
    </head>
    <body>
        <div class="nav">
            <li><h1>Online Movie Store</h1></li>
        </div>
        
        <div class="content">
        <jsp:include page="/ConnServlet" flush="true"/>
        <%           
            String ID = request.getParameter("naif");
             DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
        String date = formatter.format(new java.util.Date());
        
        DateFormat formatterr = new SimpleDateFormat("hh:mm:ss");
        String time = formatterr.format(new java.util.Date());
        
        DBManager manager = (DBManager)session.getAttribute("manager");
        manager.addLogs(ID, "Logout",date , time);
            
            
            session.invalidate();
        %>
        <p><h2>You have been logged out. Click <a class="link" href="index.jsp">here</a> to return to the landing page.</h2></p>
        </div>
    </body>
</html>
