<%-- 
    Document   : shoppingList
    Created on : 24-Oct-2020, 1:58:00 PM
    Author     : Raymond
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping List</title>
    </head>
    <body>
        <h1>Shopping List</h1>
        <p>Hello, ${username}</p>
        <a href="<c:url value='ShoppingList?action=logout'/>">Logout</a>
        <h2>List</h2>

        <form action="ShoppingList" method="post">
            Add Item: <input type="text" name="item">
            <input type="hidden" name="action" value="add">
            <input type="submit" value="Add">
        </form>
    </body>
</html>
