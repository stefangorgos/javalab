package grocery.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Product {
    private Connection connection;
    private Integer id;
    private String name;
    private Double price;
    private Boolean inStock;

    public Product() {
        connection = grocery.utils.DatabaseConnection.getConnnection();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Boolean getInStock() {
        return inStock;
    }

    public void setInStock(Boolean inStock) {
        this.inStock = inStock;
    }

    public Product viewProduct(int productId) throws SQLException  {
        PreparedStatement st = connection.prepareStatement("select * from grocery where id=?");
        st.setInt(1, productId);
        st.execute();
        ResultSet resultSet = st.getResultSet();
        resultSet.next();

        Product product = new Product();
        product.setId(resultSet.getInt("id"));
        product.setName(resultSet.getString("name"));
        product.setPrice(resultSet.getDouble("price"));
        product.setInStock(resultSet.getBoolean("in_stock"));
        return product;
    }

    public List<Product> getProducts() throws SQLException {
        List<Product> products = new ArrayList<>();
        Product product = null;
        Statement st = connection.createStatement();
        ResultSet resultSet = st.executeQuery("select * from grocery");
        while (resultSet.next()) {
            product = new Product();
            product.setId(resultSet.getInt("id"));
            product.setName(resultSet.getString("name"));
            product.setPrice(resultSet.getDouble("price"));
            product.setInStock(resultSet.getBoolean("in_stock"));
            products.add(product);
        }
        return products;
    }

    public void insertProduct(Product product) throws SQLException {
        PreparedStatement st = connection.prepareStatement("insert into grocery (id, name, price, in_stock) values (?,?,?,?)");
        st.setInt(1, product.getId());
        st.setString(2, product.getName());
        st.setDouble(3, product.getPrice());
        st.setBoolean(4, product.getInStock());
        st.execute();
    }

    public void updateProduct(Product product) throws SQLException {
        PreparedStatement st = connection.prepareStatement("update grocery set name = ?, price = ?, in_stock = ? where id = ?");
        st.setString(1, product.getName());
        st.setDouble(2, product.getPrice());
        st.setBoolean(3, product.getInStock());
        st.setInt(4, product.getId());
        st.execute();
    }

    public void deleteProduct(int productId) throws SQLException {
        PreparedStatement st = connection.prepareStatement("delete from grocery where id=?");
        st.setInt(1, productId);
        st.execute();
    }

}
