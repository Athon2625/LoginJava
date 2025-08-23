package vn.iostar.config;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DBConnectMySQL {
	private static final String URL = "jdbc:mysql://localhost:3306/Hello Mr.Thong"; 
    private static final String USER = "root"; 
    private static final String PASSWORD = "root4fun"; 

    static {
        try {
            // Load MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found!");
            e.printStackTrace();
        }
    }

    public static Connection getConnection() {
        try {
            Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
            if (connection != null) {
                System.out.println("Connected! Connection ID: " + connection.hashCode());
                return connection;
            }
        } catch (SQLException e) {
            System.err.println("Connection failed! Returning null");
            e.printStackTrace();
        }
        return null;
    }

    // Test main để chạy trực tiếp file này
    public static void main(String[] args) {
        Connection conn = DBConnectMySQL.getConnection();
        System.out.println("Connection object: " + conn);
    }
}
