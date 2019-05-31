<%-- 
    Document   : addUser
    Created on : 24/05/2019, 8:18:28 PM
    Author     : osnapitstrix
--%>

<%@page contentType="text/html" import="Model.User" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/demo.css"> 
        <script type="text/javascript" src="js/script.js"></script>
        <title>Welcome Page</title>
    <title>Online Movie Store</title>
</head>
<body>
    <center>
        <h1>User Management</h1>
        <h2>
            Add New User
           
             
        </h2>
    </center>
    <div align="center">
        <c:if test="${user != null}">
            <form action="update" method="post">
        </c:if>
        <c:if test="${user == null}">
            <form action="insert" method="post">
        </c:if>
        <table border="1" cellpadding="5">           
            <tr>
                <th>Full Name: </th>
                <td>
                    <input type="text" name="FullName" size="45"
                            value=""
                        />
                </td>
            </tr>
            <tr>
                <th>Phone Number: </th>
                <td>
                    <input type="text" name="PhoneNumber" size="45"
                            value =""
                    />
                </td>
            </tr>
            <tr>
                <th>Username </th>
                <td>
                    <input type="text" name="Username" size="45"
                            value=""
                    />
                </td>
            </tr>
            <tr>
                <th>Password </th>
                <td>
                    <input type="password" name="Password" size="45"
                            value=""
                    />
                </td>
            </tr>
            <tr>
                <th>Status </th>
                <td>
                    <input type="text" name="Status" size="45"
                            value=""
                    />
                </td>
            </tr>
            <tr>
                <th>Role </th>
                <td>
                    <input type="text" name="Role" size="45"
                            value=""
                    />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save" />
                </td>
            </tr>
        </table>
        </form>
    </div>   
</body>
</html>