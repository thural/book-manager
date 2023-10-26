<%--
  Created by IntelliJ IDEA.
  User: tural
  Date: 10/25/2023
  Time: 4:29 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Store</title>
</head>
<body>
<div style="display: flex; justify-content: center; align-items: center">
    <h1>Books Management</h1>
    <h2>
        <a href="/new">Add New Book</a>
        <a href="/list">List All Books</a>
    </h2>
</div>
<div style="align-items: center">
    <%
        String path = request.getServletPath();
        String action = request.getAttribute("action").toString();
    %>
<%--    <% System.out.println(action);%>--%>

    <form action="<%=action%>" method="post">
        <table style="border: 1px; padding: 5px">
            <caption>
                <h2> <%= action.equals("update") ? "Edit Book" : "Add New Book" %> </h2>
            </caption>
            <input type="hidden" name="id" value='${requestScope.book.getId()}'/>
            <tr>
                <th>Title:</th>
                <td>
                    <input type="text" name="title" size="45" value='${requestScope.book.price}'/>
                </td>
            </tr>
            <tr>
                <th>Author:</th>
                <td>
                    <input type="text" name="author" size="45" value=${requestScope.book.author}/>
                </td>
            </tr>
            <tr>
                <th>Price:</th>
                <td>
                    <input type="text" name="price" size="5" value=${requestScope.book.price}/>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="align-items: center"><input type="submit" value="Save"/></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>