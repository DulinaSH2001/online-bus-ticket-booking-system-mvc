<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Logout</title>
</head>
<body>
    <c:if test="${not empty sessionScope.userObj}">
        <c:remove var="userObj" scope="session" />
        <c:redirect url="Index.jsp" />
    </c:if>
</body>
</html>