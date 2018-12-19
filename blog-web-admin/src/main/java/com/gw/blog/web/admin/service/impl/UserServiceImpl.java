package com.gw.blog.web.admin.service.impl;

import com.gw.blog.commons.abstracts.impl.BaseServiceImpl;
import com.gw.blog.commons.dto.BaseResult;
import com.gw.blog.domain.User;
import com.gw.blog.web.admin.dao.UserDao;
import com.gw.blog.web.admin.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

/**
 * 用户业务处理层接口的实现
 *
 * @Title : UserServiceImpl
 * @Author : Ark
 * @Date : 2018/12/19 16:45
 * @Version : 1.0.0
 */
@Service
public class UserServiceImpl extends BaseServiceImpl<User, UserDao> implements UserService {



    //修改密码
    @Override
    public BaseResult save(User user) {
        String password = DigestUtils.md5DigestAsHex(user.getPassword().getBytes());
        user.setPassword(password);
        return super.save(user);
    }

    /**
     * 登录
     * @param params
     * @return
     */
    public User login(User params){
        // 登录密码 MD5 加密
        String password = DigestUtils.md5DigestAsHex(params.getPassword().getBytes());
        User user = dao.getByLoginId(params);

        // 账号正确
        if (user != null) {
            // 密码正确
            if (user.getPassword().equals(password)) {
                return user;
            }
        }

        // 登录失败
        return null;

    }
}








