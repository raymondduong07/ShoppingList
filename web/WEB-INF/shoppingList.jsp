<%-- 
    Document   : shoppingList
    Created on : 24-Oct-2020, 1:58:00 PM
    Author     : Raymond
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping List</title>
    </head>
    <body>
        <h1>Shopping List</h1>
        <p>Hello, ${username}
            <a href="<c:url value='ShoppingList?action=logout'/>">Logout</a>
        </p>
        <h2>List</h2>
        <form action="ShoppingList" method="post">
            Add Item: <input type="text" name="item">
            <input type="hidden" name="action" value="add">
            <input type="submit" value="Add">
        </form>
        <form action="ShoppingList" method="post">
            <c:if test="${shoppingList != null}">
                <c:forEach var="itemList" items="${shoppingList}">
                    <li>
                        <input type="radio" name="items" value="${itemList}">${itemList}
                    </li>
                </c:forEach>
            </c:if>
            <input type="hidden" name="action" value="delete">
            <input type="submit" value="Delete">
        </form>
    </body>
</html>
