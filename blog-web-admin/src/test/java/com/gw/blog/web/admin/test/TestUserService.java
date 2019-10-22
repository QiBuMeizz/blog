package com.gw.blog.web.admin.test;

import com.alibaba.fastjson.JSONObject;
import com.gw.blog.commons.dto.BaseResult;
import com.gw.blog.commons.dto.Page;
import com.gw.blog.domain.User;
import com.gw.blog.web.admin.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-context.xml","classpath:spring-context-druid.xml","classpath:spring-context-mybatis.xml"})
public class TestUserService {
    @Autowired
    private UserService userService;

    @Test
    public void testPageList(){
        User user = new User();
        Page page = new Page();
        user.setPage(page);
        BaseResult result = userService.pageList(user);
        System.out.println(JSONObject.toJSONString(result));
    }
}
