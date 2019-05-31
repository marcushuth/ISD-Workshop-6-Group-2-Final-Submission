<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" 
           uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<style type="text/css">
body {
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #eee;
        color:#fff;
}

.bg {
	max-width: 500px;
	padding: 15px;
	margin: 0 auto;
}
td{
    text-indent: 2em;
}
td input,select{
    float:right;
    width:267px;
    height:25px;
}
</style>
</head>
<body>
    <div style="text-align: center;width:100%;">
        <p style="color:red;">${msg}</p>
        <p>
            <a href="OrderServlet?type=selectAll">back</a>
        </p>
    </div>
</body>
</html>