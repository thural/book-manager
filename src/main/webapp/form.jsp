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
<div style="display: flex; justify-content: center; align-items: center; flex-direction: column">
    <h1>Books Management</h1>
    <h2>
        <a href="/list">List All Books</a>
    </h2>
</div>
<div style="align-items: center">

<%-- we can use as many script tags as we want, the scope of variables is global
and shared between the tags within the JSP file --%>
    <%
        String path = request.getServletPath();
        String action = request.getAttribute("action").toString();
    %>

    <form action="<%=action%>" method="post">
        <table style="border: 1px; padding: 5px">
            <caption>
                <h2> <%= action.equals("update") ? "Edit Book" : "Add New Book" %> </h2>
            </caption>
            <input type="hidden" name="id" value=${requestScope.book.getId()}>
            <tr>
                <th>Title:</th>
                <td>
                    <input type="text" name="title" size="45" value=${requestScope.book.getTitle()}>
                </td>
            </tr>
            <tr>
                <th>Author:</th>
                <td>
                    <input type="text" name="author" size="45" value=${requestScope.book.getAuthor()}>
                </td>
            </tr>
            <tr>
                <th>Price:</th>
                <td>
                    <input type="text" name="price" size="5" value=${requestScope.book.getPrice()}>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="align-items: center"><input type="submit" value="Save"></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>