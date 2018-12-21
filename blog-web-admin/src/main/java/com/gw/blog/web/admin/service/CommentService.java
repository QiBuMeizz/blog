package com.gw.blog.web.admin.service;

import com.gw.blog.commons.abstracts.BasePageService;
import com.gw.blog.domain.Comment;

import java.util.List;

public interface CommentService extends BasePageService<Comment> {
    /**
     * 查询评论
     * @param comment
     * @param index
     * @param size
     * @return
     */
    List<Comment> selectComment(Comment comment, int index, int size);

    /**
     * 批量删除
     * @param ids
     */
    void deleteMore(Long... ids);
}