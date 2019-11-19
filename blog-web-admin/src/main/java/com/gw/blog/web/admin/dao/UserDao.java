package com.gw.blog.web.admin.dao;

import com.gw.blog.commons.abstracts.BasePageDao;
import com.gw.blog.domain.User;
import org.springframework.stereotype.Repository;

/**
 * 用户数据层接口
 *
 * @Title : UserDao
 * @Author : Ark
 * @Date : 2018/12/19 16:33
 * @Version : 1.0.0
 */
@Repository
public interface UserDao extends BasePageDao<User> {


    /**
     * 根据登录 Id 获取实例
     *
     * @param user
     * @return
     */
    User getByLoginId(User user);
}














