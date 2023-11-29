<%@ page import="grocery.model.Product" %>
<%@ include file="controller.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
</head>
<body>
    <form action="deleteAction.jsp" method="post">
    <h1>Delete Product</h1>
    <table border="1">
            <tr>
                <th>ID</th>
                <th><input type="number" name="productId"></th>
            </tr>
    </table>
            <input type="submit" value="Delete Product">
    </form>
</body>
</html>