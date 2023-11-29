<%@ page import="grocery.model.Product" %>
<%@ include file="controller.jsp" %>
<%
    String productId = request.getParameter("id");
    int integerId = Integer.parseInt(productId);
    Product editedProduct = new Product();
    editedProduct = editedProduct.viewProduct(integerId);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
    <form action="editAction.jsp" method="post">
        <h1>Edit Product</h1>
        <table border="1">
                <tr>
                    <th>ID</th>
                    <th><input type="hidden" name="id" value="<%= editedProduct.getId() %>"></th>
                </tr>
                <tr>
                    <th>Name</th>
                    <th><input type="text" name="name" value="<%= editedProduct.getName() %>"></th>
                </tr>
                <tr>
                    <th>Price</th>
                    <th><input type="text" name="price" value="<%= editedProduct.getPrice() %>"></th>
                </tr>
                <tr>
                    <th>In stock</th>
                    <th><input type="checkbox" name="productStock" <% if (editedProduct.getInStock()) { %> checked <% } %> value="true"></th>
                </tr>
        </table>
                <input type="submit" value="Update Product">
        </form>
</body>
</html>
