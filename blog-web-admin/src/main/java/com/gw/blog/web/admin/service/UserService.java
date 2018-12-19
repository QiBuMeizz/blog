
package com.gw.blog.web.admin.service;

import com.gw.blog.commons.abstracts.BaseService;
import com.gw.blog.domain.User;

import java.util.List;

/**
 * 用户业务处理层接口
 *
 * @Title : UserService
 * @Author : Ark
 * @Date : 2018/12/19 16:40
 * @Version : 1.0.0
 */
public interface UserService extends BaseService<User> {

    List<User> getUser(User user);
    void saveUser();

    /**
     * 登录
     * @param user
     * @return
     */
    User login(User user);
}
