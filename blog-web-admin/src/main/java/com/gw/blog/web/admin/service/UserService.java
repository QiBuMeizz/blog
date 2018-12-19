package com.gw.blog.web.admin.service;

import com.gw.blog.commons.abstracts.BaseService;
import com.gw.blog.domain.User;

import java.util.List;

public interface UserService extends BaseService<User> {

    List<User> getUser(User user);
    void saveUser();
}
