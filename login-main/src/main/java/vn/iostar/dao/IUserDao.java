package vn.iostar.dao;

import vn.iostar.model.UserModel;
import java.util.List;

public interface IUserDao {
    // Lấy tất cả user trong bảng
    List<UserModel> findAll();

    // Lấy thông tin user theo id
    UserModel find(int id);
}