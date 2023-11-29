<%@ page import="grocery.model.Product" %>
<%@ include file="controller.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String productId = request.getParameter("productId");

    if (productId != null) {
        try {
            int id = Integer.parseInt(productId);
            Product deletedProduct = new Product();
            deletedProduct.deleteProduct(id);
            out.println("<h2>Product with ID " + id + " deleted successfully!</h2>");
            out.println("<a href=\"index.jsp\">Home</a>");
        } catch (Exception e) {
            out.println("<h2>Error deleting product: " + e.getMessage() + "</h2>");
        }
    } else {
        out.println("<h2>Please provide the ID of the product to delete!</h2>");
    }
%>
