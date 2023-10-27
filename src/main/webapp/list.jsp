<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.booklet.bookmanager.model.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book Store</title>
    <style>
        table, th, td {
            border: 1px solid black;
        }
        td {
            padding: 8px;
        }
    </style>
</head>
<body>
<div style="text-align: center;">
    <h1>Books Management</h1>
    <h2>
        <a href="/new">Add New Book</a>
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

        <% List bookList = (ArrayList) request.getAttribute("listBook");
        for (int i = 0; i < bookList.size(); i++){%>
        <%-- the parent <tr> element is wrapped within the for loop block --%>
        <tr>
            <td><%= ((Book)bookList.get(i)).getId() %></td>
            <td><%= ((Book)bookList.get(i)).getTitle() %></td>
            <td><%= ((Book)bookList.get(i)).getAuthor() %></td>
            <td><%= ((Book)bookList.get(i)).getPrice() %></td>
            <td>
                <a href="/edit?id=<%= ((Book)bookList.get(i)).getId() %>">Edit</a>
                <a href="/delete?id=<%= ((Book)bookList.get(i)).getId() %>">Delete</a>
            </td>
        </tr>
        <%}%>

    </table>
</div>
</body>
</html>