<%-- 
    Document   : UserList
    Created on : 25/05/2019, 3:12:32 PM
    Author     : trixi
--%>

<%@page contentType="text/html" import="Model.User" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/demo.css"> 
        <script type="text/javascript" src="js/script.js"></script>
        <title>Online Movie Store</title>
</head>

<%--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>

   
<body>
    <center>
        <h1>Users Management</h1>
        <h2>
            <a href="/new">Add New User</a>
            &nbsp;&nbsp;&nbsp;
            <a href="/list">List All Users</a>
             
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
            <c:forEach var="user" items="${listUser}">
                <tr>
                    <td><c:out value="${user.FullName}" /></td>
                    <td><c:out value="${user.PhoneNumber}" /></td>
                    <td><c:out value="${user.Username}" /></td>
                    <td><c:out value="${user.Password}" /></td>
                    <td><c:out value="${user.Status}" /></td>
                    <td><c:out value="${user.Role}" /></td>
                    <td>
                        <a href="/edit?id=<c:out value='${user.Username}' />">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="/delete?id=<c:out value='${user.Username}' />">Delete</a>                     
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>   
</body>
</html>
