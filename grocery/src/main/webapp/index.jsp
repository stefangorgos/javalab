<%@ page import="grocery.model.Product" %>
<%@ include file="controller.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Products List</title>
</head>
<body>
    <a href="addProduct.jsp">Add Product</a>
    <a href="deleteProduct.jsp">Delete Product</a>

    <h1>Products List</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>In Stock</th>
        </tr>
        <%
            for (Product productDisplay : productList) {
        %>
        <tr>
            <td><%= productDisplay.getId() %></td>
            <td><%= productDisplay.getName() %></td>
            <td><%= productDisplay.getPrice() %></td>
            <td><%= productDisplay.getInStock() %></td>
            <td><a href="editProduct.jsp?id=<%= productDisplay.getId() %>">Edit</a></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>