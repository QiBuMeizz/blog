package com.gw.blog.web.admin.test;

import com.gw.blog.domain.Comment;
import com.gw.blog.web.admin.service.CommentService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-context.xml","classpath:spring-context-druid.xml","classpath:spring-context-mybatis.xml"})
public class TestCommentService {
    @Autowired
    private CommentService commentService;

    @Test
    public void testSelectComment(){
        Comment comment1 = new Comment();
        comment1.setContentId(1L);
        List<Comment> list = commentService.selectComment(comment1, 0, 5);
        for (Comment comment : list) {
            System.out.println(comment);
        }
    }

}
