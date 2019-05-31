<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" 
           uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="order/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="order/bootstrap/css/bootstrap-theme.min.css">
<script src="order/js/jquery-1.11.3.js"></script>
<script
	src="order/bootstrap/js/bootstrap.min.js"></script>
<script language="javascript" type="text/javascript">

	</script>
<title>Add Order</title>

<style type="text/css">
body {
	padding-top: 40px;
	padding-bottom: 40px;
        background-color: #000;
}

.bg {
	max-width: 500px;
	padding: 15px;
	margin: 0 auto;
        
}
tr{
    hegiht:50px;
    line-height: 50px;
}
td{
    text-indent: 2em;
}
td span{
    margin-right: 2em;
     hegiht:50px;
    line-height: 50px;
}
td input,select{
    float:right;
    width:267px;
    height:25px;
    border-radius: 5px;
}
</style>
</head>
<body>
    <div style="width:80%;margin:0 auto;border:1px solid #ccc;background-color: #fff;min-height: 800px;">
        <h1 style="background-color:blue;color: #fff;">${orderInfo==null?'Add':'update'} Order</h1>
	<form class="bg" method="post" action="OrderServlet?type=save">
		<table class="table table-hover table-bordered bg">
			
                        <tr>
                            <td><span>movie</span>
                                <select name="movieId">
                                    <c:forEach var="movie"  items="${movies}">
                                        <option <c:if test="${orderInfo.movieId==movie.id}">selected="selected"</c:if> value="${movie.id}">${movie.movieName}:${movie.stoage}</option>
                                    </c:forEach>
                                </select>
                            </td>
			</tr>
			
                       <tr>
                           <td><span>quantity</span><input min="1" value="${orderInfo.movieNumber}" type="number" name="movieNumber"></td>
			</tr>
                        <tr style="display:none;">
                           <td>id<input  value="${orderInfo.orderId}" type="number" name="orderId"></td>
			</tr>
                    
		</table>
                        <div style="width:60%;text-align: center;">
                            <span><button type="submit" value="">Submit</button></span>
                            <span><a href="OrderServlet?type=selectAll">>back</a></span>
                             <p style="color:red;">${msg}</p>
                        </div>
	</form>
    </div>
</body>
</html>