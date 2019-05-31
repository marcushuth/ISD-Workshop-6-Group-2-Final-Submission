<%--

    Document   : UserList

    Created on : 25/05/2019, 3:12:32 PM

    Author     : Patricia Ann Acosta

--%>



<%@page contentType="text/html" import="Model.User,java.util.ArrayList" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="./css/demo.css">

        <script type="text/javascript" src="./js/script.js"></script>

        <title>User Management</title>

    </head>





    <%-- <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>







    <body>

    <center>

        <h1>Users Management</h1>

        <h2>

            <!--<a href="../UserForm.jsp">Add New User</a>--> 
            <a href="./ConnServlet/new">Add New User</a>

            &nbsp;&nbsp;&nbsp;

            <a href="../UserList.jsp">List All Users</a>

            &nbsp;&nbsp;&nbsp;

            <a href="index.jsp">Home</a>


        </h2>

    </center>

    <div align="center">

        <table border="1" cellpadding="5">

            <caption><h2>List of Users</h2></caption>

            <tr>

                <th>Full Name</th>

                <th>Phone Number</th>

                <th>Username</th>

                <th>Password</th>

                <th>Status</th>

                <th>Role</th>

                <th>Actions</th>

            </tr>



            <% ArrayList users = (ArrayList) request.getSession().getAttribute("listUser");

                for (int i = 0; i < users.size(); i++) {

                          Model.User user = (Model.User) users.get(i); %> 

            <tr>

                <td><% out.print(user.getFullName()); %></td>

                <td><% out.print(user.getPhoneNumber()); %></td>

                <td><% out.print(user.getUsername()); %></td>

                <td><% out.print(user.getPassword()); %></td>

                <td><% out.print(user.getStatus()); %></td>

                <td><% out.print(user.getRole());%></td>

                <td>

                    <a href="./ConnServlet/update?Username=<%=user.getUsername()%>" />Edit</a> 

                    &nbsp;&nbsp;&nbsp;&nbsp;

                    <a href="./ConnServlet/delete?Username=<%=user.getUsername()%>"  />Delete</a>                  

                </td>      

            </tr>

            <% }%>

        </table>

    </div>  
    <jsp:include page="/ConnServlet" flush="true" />

</body>

</html>