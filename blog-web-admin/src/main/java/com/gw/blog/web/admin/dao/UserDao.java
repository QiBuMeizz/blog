package com.gw.blog.web.admin.dao;

import com.gw.blog.commons.abstracts.BaseDao;
import com.gw.blog.domain.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 用户数据层接口
 *
 * @Title : UserDao
 * @Author : Ark
 * @Date : 2018/12/19 16:33
 * @Version : 1.0.0
 */
@Repository
public interface UserDao extends BaseDao<User> {
    List<User> selectUser(Long id);

    void updateUser();

    /**
     * 根据登录 Id 获取实例
     *
     * @param user
     * @return
     */
    User getByLoginId(User user);

}














