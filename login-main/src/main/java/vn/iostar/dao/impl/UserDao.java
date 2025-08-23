package vn.iostar.dao.impl;


import vn.iostar.dao.IUserDao;
import vn.iostar.model.UserModel;
import vn.iostar.config.DBConnectMySQL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class UserDao implements IUserDao {

    private static final String TABLE_NAME = "helloworld"; // bảng bạn đặt tên

    @Override
    public List<UserModel> findAll() {
        List<UserModel> users = new ArrayList<>();
        String sql = "SELECT id, username, password FROM " + TABLE_NAME;

        try (Connection conn = DBConnectMySQL.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                users.add(new UserModel(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    @Override
    public UserModel find(int id) {
        String sql = "SELECT id, username, password FROM " + TABLE_NAME + " WHERE id = ?";
        UserModel user = null;

        try (Connection conn = DBConnectMySQL.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new UserModel(
                            rs.getInt("id"),
                            rs.getString("username"),
                            rs.getString("password")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    // Test trực tiếp
    public static void main(String[] args) {
        UserDao userDao = new UserDao();

        System.out.println("=== Test findAll() ===");
        for (UserModel u : userDao.findAll()) System.out.println(u);

        System.out.println("\n=== Test find(1) ===");
        System.out.println(userDao.find(1));
    }
}