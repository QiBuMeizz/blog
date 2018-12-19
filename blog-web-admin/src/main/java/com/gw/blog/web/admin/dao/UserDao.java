package com.gw.blog.web.admin.dao;

import com.gw.blog.commons.abstracts.BaseDao;
import com.gw.blog.domain.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao extends BaseDao<User> {
    List<User> selectUser(Long id);
    void updateUser();
}
