<%--
  Created by IntelliJ IDEA.
  User: tural
  Date: 10/25/2023
  Time: 4:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book Store</title>
</head>
<body>
<div style="text-align: center;">
    <h1>Books Management</h1>
    <h2>
        <a href="/new">Add New Book</a>
        &nbsp;&nbsp;&nbsp;
        <a href="/list">List All Books</a>

    </h2>
</div>
<div style="display:flex; justify-content:center; align-items: center">
    <table style="padding: 1px; border: 1px black">
        <caption><h2>List of Books</h2></caption>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Price</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="book" items="${requestScope.listBook}">
            <tr>
                <td>${requestScope.book.id}</td>
                <td>${requestScope.book.title}</td>
                <td>${requestScope.book.author}</td>
                <td>${requestScope.book.price}</td>
                <td>
                    <a href="/edit?id=${requestScope.book.id}">Edit</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="/delete?id=${requestScope.book.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>