package com.gw.blog.web.admin.service.impl;

import com.gw.blog.commons.abstracts.impl.BaseServiceImpl;
import com.gw.blog.domain.Comment;
import com.gw.blog.web.admin.dao.CommentDao;
import com.gw.blog.web.admin.service.CommentService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
@Service
public class CommentServiceImpl extends BaseServiceImpl<Comment, CommentDao> implements CommentService {
    /**
     * 查询评论
     * @param comment 父评论ID
     * @param index 起始下标
     * @param size 偏移量
     * @return
     */
    @Override
    public List<Comment> selectComment(Comment comment, int index, int size) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("comment",comment);
        map.put("index",index);
        map.put("size",size);
        return dao.selectComment(map);
    }
}
