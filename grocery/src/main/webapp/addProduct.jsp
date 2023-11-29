<%@ page import="grocery.model.Product" %>
<%@ include file="controller.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
</head>
<body>
    <form action="addAction.jsp" method="post">
    <h1>Add Product</h1>
    <table border="1">
            <tr>
                <th>ID</th>
                <th><input type="number" name="productId"></th>
            </tr>
            <tr>
                <th>Name</th>
                <th><input type="text" name="productName"></th>
            </tr>
            <tr>
                <th>Price</th>
                <th><input type="number" name="productPrice" step="any"></th>
            </tr>
            <tr>
                <th>In stock</th>
                <th><input type="checkbox" name="productStock" value="inStock"></th>
            </tr>
    </table>
            <input type="submit" value="Add Product">
    </form>
</body>
</html>