package com.gw.blog.web.admin.service.impl;

import com.gw.blog.commons.abstracts.impl.BaseServiceImpl;
import com.gw.blog.domain.User;
import com.gw.blog.web.admin.dao.UserDao;
import com.gw.blog.web.admin.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.Date;

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

    //保存个人信息
    @Override
    public String saveUser(User user) {
        //初始化密码
        String password = null;
        //添加更新时间
        user.setUpdated(new Date());
        //密码不为空，加密
        if(StringUtils.isNotBlank(user.getPassword())){
            password = DigestUtils.md5DigestAsHex(user.getPassword().getBytes());
        }
        user.setPassword(password);
        dao.update(user);
        return "保存成功";
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








