<%--
  Created by IntelliJ IDEA.
  User: tural
  Date: 10/25/2023
  Time: 4:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page isErrorPage = "true" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>
</head>
<body>
<div style="display: flex; justify-content: center; align-items: center; flex-direction: column">
    <h1>Error</h1>
    <h2><%= exception.getMessage() %></h2>
</div>
</body>
</html>