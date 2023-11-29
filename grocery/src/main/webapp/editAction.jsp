<%@ page import="grocery.model.Product" %>
<%@ include file="controller.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String productId = request.getParameter("id");
    String productName = request.getParameter("name");
    String productPrice = request.getParameter("price");
    String productStock = request.getParameter("productStock");

    boolean inStock = (productStock != null && productStock.equals("true")); // Assuming productStock represents a boolean value

    if (productId != null && productName != null && productPrice != null) {
        try {
            Product updatedProduct = new Product();
            updatedProduct.setId(Integer.parseInt(productId));
            updatedProduct.setName(productName);
            updatedProduct.setPrice(Double.parseDouble(productPrice));
            updatedProduct.setInStock(inStock);

            // Assuming you have an 'updateProduct' method in your controller or service that doesn't return a boolean
            product.updateProduct(updatedProduct);

            out.println("<h2>Product updated successfully!</h2>");
            out.println("<a href=\"index.jsp\">Home</a>");
        } catch (Exception e) {
            out.println("<h2>Error updating product: " + e.getMessage() + "</h2>");
        }
    } else {
        out.println("<h2>Please fill in all the required fields!</h2>");
    }
%>
