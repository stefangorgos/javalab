<%@ page import="grocery.model.Product" %>
<%@ include file="controller.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String productId = request.getParameter("productId");
    String productName = request.getParameter("productName");
    String productPrice = request.getParameter("productPrice");
    String productStock = request.getParameter("productStock");

    boolean inStock = (productStock != null && productStock.equals("inStock"));

    if (productId != null && productName != null && productPrice != null) {
        try {
            Product newProduct = new Product();
            newProduct.setId(Integer.parseInt(productId));
            newProduct.setName(productName);
            newProduct.setPrice(Double.parseDouble(productPrice));
            newProduct.setInStock(inStock);

            product.insertProduct(newProduct);
            out.println("<h2>Product added successfully!</h2>");
            out.println("<a href=\"index.jsp\">Home</a>");

        } catch (Exception e) {
            out.println("<h2>Error adding product: " + e.getMessage() + "</h2>");
        }
    } else {
        out.println("<h2>Please fill in all the required fields!</h2>");
    }
%>
