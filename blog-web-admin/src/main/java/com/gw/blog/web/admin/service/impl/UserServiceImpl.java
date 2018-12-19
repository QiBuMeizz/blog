package com.gw.blog.web.admin.service.impl;


import com.gw.blog.commons.abstracts.impl.BaseServiceImpl;
import com.gw.blog.domain.User;
import com.gw.blog.web.admin.dao.UserDao;
import com.gw.blog.web.admin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceImpl extends BaseServiceImpl<User, UserDao> implements UserService {

    @Autowired
    private UserDao userDao;

    //查询用户
    @Override
    public List<User> getUser(User user) {
        List<User> users = new ArrayList<>();
        users = userDao.selectUser(user.getId());
        return users;
    }

    //编辑用户
    @Override
    public void saveUser() {

    }
}
