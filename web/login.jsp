<%@page import="uts.isd.model.dao.DBManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" import="java.sql.*"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/ISD_Showcase_2.css">
        <title>Login</title>
    </head>
    <body>
        <div class="nav">
            <li><a href='index.jsp' style="text-decoration: none;"><h1>Online Movie Store</h1></a></li>
        </div>
        
        
        <div class="content">
            <form action="loginAction.jsp" method="POST">
            <table border="0" cellpadding="2">
                <thead>
                    <tr><th><h2>Login</h2></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr><td>Email</td><td><input name="email" type="email"></td></tr>
                    <tr><td>Password</td><td><input name="password" type="password"></td></tr>
                    <tr><td></td><td><input type="submit" value="Sign In"></td></tr>
                </tbody>
            </table>
            </form>
            <p style="color:#000000">Don't have an account? Register 
            <a href='register.jsp'>here</a></p>
        </div>
         <jsp:include page="/ConnServlet" flush="true"/>
        <%
        //String ID = request.getParameter("email");
             DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
        String date = formatter.format(new java.util.Date());
        
        DateFormat formatterr = new SimpleDateFormat("hh:mm:ss");
        String time = formatterr.format(new java.util.Date());
        
        DBManager manager = (DBManager)session.getAttribute("manager");
        manager.addLogs("Khubyeb", "Login",date , time);
        
        
        
        %>
        
        
    </body>
</html>
