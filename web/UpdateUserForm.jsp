<%-- 
    Document   : UpdateUserForm
    Created on : 25/05/2019, 8:51:03 PM
    Author     : Patricia Ann Acosta
--%>

<%@page contentType="text/html" import="Model.User,java.util.ArrayList" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/demo.css">
<script type="text/javascript" src="js/script.js"></script>
<title>Update User Form</title>
<title>Online Movie Store</title>
</head>
<body>
      <center>
            <h1>User Management</h1>
   
            <h2>
               Update Existing User
          
            </h2>
      </center>
      <div align="center">
            <form action="save" method="post">                 

                        <table border="1" cellpadding="5">
                   <% ArrayList users = (ArrayList)request.getSession().getAttribute("eUser");

 

                        for (int i = 0; i < users.size(); i++) {

                              Model.User user = (Model.User) users.get(i); %> 

               
                    <tr><%out.print("<tr><td>Full Name:</td><td><input type='text' name='FullName' size='45' required value='"+(user.getFullName())+"'/></td></tr>"); %></tr> 
                    <tr><%out.print("<tr><td>Phone Number:</td><td><input type='tel' name='PhoneNumber' size='45' required value='"+(user.getPhoneNumber())+"'/></td></tr>"); %></tr> 
                    <tr><%out.print("<tr><td>Username:</td><td><input type='text' name='Username' readonly='readonly' size='45'required value='"+(user.getUsername())+"'/></td></tr>"); %></tr> 
                    <tr><%out.print("<tr><td>Password:</td><td><input type='password' name='Password' size='45' required value='"+(user.getPassword())+"'/></td></tr>"); %></tr> 
                    <tr><%out.print("<tr><td>Status:</td><td><input type='text' name='Status' size='45' required value='"+(user.getStatus())+"'/></td></tr>"); %></tr> 
                    <tr><%out.print("<tr><td>Role:</td><td><input type='text' name='Role' size='45' required value='"+(user.getRole())+"'/></td></tr>"); %></tr> 
                   <% } %>
                   
    
                              <tr>
                                    <td colspan="2" align="center"><input type="submit"
                                          value="Save" /></td>
                              </tr> 

                 
                        </table>
                  </form>
      </div>
            <jsp:include page="/ConnServlet" flush="true" />
</body>
</html>

                           