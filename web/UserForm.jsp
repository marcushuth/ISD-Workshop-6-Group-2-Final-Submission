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
<title>Welcome Page</title>
<title>Online Movie Store</title>
</head>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<body>
      <center>
            <h1>User Management</h1>
            <h2>
                  <%
                      if ("edit".equals(request.getParameter("action"))) {
                  %>
                  Update User
                  <%
                      } else if ("new".equals(request.getParameter("action"))) {
                  %>
                  Add new user
                  <%
                      }
                  %>
            </h2>
      </center>
      <div align="center">

            <%
                if ("edit".equals(request.getParameter("action"))) {
            %>
            <form action="save" method="post">
                  <%
                      } else if ("new".equals(request.getParameter("action"))) {
                  %>
                  <form action="insert" method="post">
                        <%
                            }
                        %>

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
                                    <td><input type="text" name="Status" size="45" value=""  maxlength="10" required placeholder="Status can only be inactive and active" />
                                    </td>
                              </tr>
                              <tr>
                                    <th>Role</th>
                                    <td><input type="text" name="Role" size="45" value="" maxlength="10"required placeholder="Role can only be Customer Staff, Admin"/>
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
            <jsp:include page="/UserManagementServlet" flush="true" />
           
</body>
</html>
