<%-- 
    Document   : UserForm
    Created on : 25/05/2019, 8:51:03 PM
    Author     : Patricia Ann A
--%>

<%@page contentType="text/html" import="Model.User" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/demo.css">
<script type="text/javascript" src="js/script.js"></script>
<title>Add New User Form</title>
<title>Online Movie Store</title>
</head>
<body>
      <center>
            <h1>User Management</h1>
            <h2>
                Add new user
          
            </h2>
      </center>
      <div align="center">
            <form action="insert" method="post">                 

                        <table border="1" cellpadding="5">
                              <tr>
                                    <th>Full Name:</th>
                                    <td><input type="text" name="FullName" size="45" value="" maxlength="254" required placeholder="Full Name is mandatory">
                                    </td>
                              </tr>
                              <tr>
                                    <th>Phone Number:</th>
                                    <td><input type="tel" name="PhoneNumber" size="45" value="" maxlength="15" required placeholder="Phone Number is mandatory" />
                                    </td>
                              </tr>
                              <tr>
                                    <th>Username</th>
                                    <td><input type="email" name="Username" size="45" value="" maxlength="254" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required placeholder="Enter a valid email address"/>
                                    </td>
                              </tr>
                              <tr>
                                    <th>Password</th>
                                    <td><input type="password" name="Password" size="45" value="" maxlength="10" required placeholder="Enter a valid password"/>
                                    </td>
                              </tr>
                              <tr>
                                    <th>Status</th>
                                    <td><input type="radio" name="Status" size="45" required value="Inactive"/>Inactive <input type="radio" name="Status" value="Active"/>Active
                                    </td>
                              </tr>
                              <tr>
                                    <th>Role</th>
                                    <td><input type="radio" name="Role" size="45" required value="Admin"/>Admin <input type="radio" name="Role" value="Customer"/>Customer <input type="radio" name="Role" value="Staff"/>Staff
                                    </td>
                              </tr>
                              <tr>
                                    <td colspan="2" align="center">
                                        <input type="submit"
                                          value="Save" /></td>
                              </tr>
                        </table>
                  </form>
      </div>
            <jsp:include page="/ConnServlet" flush="true" />
</body>
</html>

