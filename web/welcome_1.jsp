<%@page contentType="text/html" import="java.sql.*" import="onlinemoviestore.model.*" import="onlinemoviestore.model.dao.*" import="onlinemoviestore.controller.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/ISD_Showcase_2.css"> 
        <title>Welcome Page</title>
    </head>
    
    <%
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String tos = request.getParameter("tos");
    %>
    
    <body>
        <div class="nav">
            <li><h1>Online Movie Store</h1></a></li>
        </div>
        
        
        <div class="content">
            <% if(tos != null) { %>
        <h1>Hello, <%=name%></h1>
        <p>Your phone number: <%=phone%></p>
        <p>Your email: <%=email%></p>
        <p>Your password is: <%=password%></p>
        
        <br/>
        <p><h4>Please click <a href="storefront.jsp">here</a> to browse the store.</h4></p>
        
        
        <%
        DBManager manager = (DBManager)session.getAttribute("manager");
        User user = new User(name, phone, email, password);
        
        
        
        session.setAttribute("user",user); 
        //manager.addUser(user);
        
        %>
        
        <jsp:include page="/ConnServlet" flush="true"/>
        
        <%}else{%>
        <p>NOTE: You must agree to TOS</p>
        <p>Click <a href="register.jsp">here</a> to go back</p>
        <%}%>
        </div>    
    </body>
</html>
