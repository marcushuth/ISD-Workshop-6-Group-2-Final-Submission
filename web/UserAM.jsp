<%-- 
    Document   : UserAM
    Created on : 21/05/2019, 10:00:10 PM
    Author     : 99161820
--%>
<%@page import="java.util.Arrays"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="uts.isd.model.User"%>
<%@page import="java.sql.Statement"%>


<%@page import="uts.isd.model.dao.*"%>
<%@page import="uts.isd.controller.*"%>
<%@page import="java.util.Date"%>
<%@page import="uts.isd.model.dao.DBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Access Management</title>
    </head>
   
      <h1 align="center">Users Log History Management View</h1>
    <html lang="en">
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Datepicker - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepickerLogin" ).datepicker();
    $( "#datepickerLogout" ).datepicker();
  } );
  </script>
</head>
<body>
 <table align="center" >    
<tr> <td> ID: <input type="text"  name="ID" ></td>
    <td>Login Date: <input type="text"  id="datepickerLogin" name ="datelogin"></td>
 <td> Logout Date: <input type="text"  id="datepickerLogout" name="datelogout" ></td>
   
    <td><button  class="button" type="button" onclick="location.href = 'SearchResults.jsp'"> Search </button></td>
    <td><button  class="button" type="button" onclick="location.href = 'ShowAllLogs.jsp'" > Show All logs </button></td>
</tr>
 </table> 
  
   
   

</body>
       
</html>
</html>
