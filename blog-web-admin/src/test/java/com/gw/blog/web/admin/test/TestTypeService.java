package com.gw.blog.web.admin.test;

import com.gw.blog.commons.contants.Contents;
import com.gw.blog.domain.Comment;
import com.gw.blog.domain.Content;
import com.gw.blog.domain.Type;
import com.gw.blog.web.admin.dao.CommentDao;
import com.gw.blog.web.admin.dao.ContentDao;
import com.gw.blog.web.admin.dao.TypeDao;
import com.gw.blog.web.admin.service.TypeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-context.xml","classpath:spring-context-druid.xml","classpath:spring-context-mybatis.xml"})
public class TestTypeService {
}
