<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" 
           uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Order Manager</title>

<style type="text/css">
body {
    padding-top: 40px;
    padding-bottom: 40px;
    background-color: #000;
}

.bg {
	
    padding: 15px;
    margin: 0 auto;
}
#content{
    width:80%;
    margin:0 auto;
    border:1px solid #ccc;
    min-height:400px;
    background-color: #fff;
}
table{
    width:100%;
}
.datetimepicker{
    margin-top: 20px;
}
</style>

</head>
<body>
    <div id="content">
        <p style="background-color:blue;line-height: 40px;color:#fff"><span style="font-size: 20px;">Order Manager</span></p>
        <div style="height:40px;">
            <form method="post" action="OrderServlet?type=selectAll">
                <input placeHolder="orderId" type="text" value="${orderId}" class="form-control" name="qorderId" style="width:80px; display:inline;">
                <input placeHolder="startTime" id = "startTime" value="${startTime}" name="qstartTime" size="16"type="date">
                <input placeHolder="endTime" id = "endTime" value="${endTime}" name="qendTime" size="16"type="date"> 
           <input  class="btn btn-primary btn-sm active" type="submit" name="btn" value="Search">
            <a href="OrderServlet?type=openAddPage" class="btn btn-primary btn-sm">Add</a>
            </form>
           <hr/>
        </div>
	<table class="table table-hover table-bordered bg">
            <tr>
                <td>Order ID</td>
                <td>Movie Name</td>
                <td>Movie price</td>
                <td>quantity</td>
                <td>createDate</td>
                <td>status</td>
                <td></td>
            </tr>

            <c:forEach items="${list}" var="userStatus" >
               <tr>
                   <td>${userStatus.orderId}</td>
                   <td>${userStatus.movieName}</td>
                   <td>${userStatus.moviePrice}</td>
                   <td>${userStatus.movieNumber}</td><td>${userStatus.createDate}</td>
                   <td>${userStatus.status=='0'?'wait':(userStatus.status=='-1'?'cancel':'ok')}</td>
                   <td>
                       <c:if test="${userStatus.status=='0'}">
                           <a href="OrderServlet?orderId=${userStatus.orderId}&type=openUpdatePage" class="btn btn-primary btn-sm">edit</a>
                           <a href="OrderServlet?orderId=${userStatus.orderId}&type=cancel" class="btn btn-primary btn-sm">cancel</a>
                           <a href="OrderServlet?orderId=${userStatus.orderId}&type=confirm" class="btn btn-primary btn-sm">ok</a>

                       </c:if>

                   </td>
               </tr>
           </c:forEach>
	</table>
    </div>
</body>
</html>