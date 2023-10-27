
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