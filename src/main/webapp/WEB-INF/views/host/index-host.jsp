<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YourPlace Host</title>
</head>
<body>
<h1>Your place host page</h1>
<%=(String)request.getSession().getAttribute("userId") %>
</body>
</html>