
package com.gw.blog.web.admin.service;

import com.gw.blog.commons.abstracts.BasePageService;
import com.gw.blog.commons.dto.BaseResult;
import com.gw.blog.domain.User;

/**
 * 用户业务处理层接口
 *
 * @Title : UserService
 * @Author : Ark
 * @Date : 2018/12/19 16:40
 * @Version : 1.0.0
 */
public interface UserService extends BasePageService<User> {

    /**
     * 登录
     * @param user
     * @return
     */
    User login(User user);
}
