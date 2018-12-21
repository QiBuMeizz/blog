package com.gw.blog.web.admin.service;

import com.gw.blog.commons.abstracts.BasePageService;
import com.gw.blog.domain.Comment;

import java.util.List;

public interface CommentService extends BasePageService<Comment> {
    List<Comment> selectComment(Comment comment, int index, int size);
}