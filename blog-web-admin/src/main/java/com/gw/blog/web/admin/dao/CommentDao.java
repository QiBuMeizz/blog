package com.gw.blog.web.admin.dao;

import com.gw.blog.commons.abstracts.BaseDao;
import com.gw.blog.domain.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface CommentDao extends BaseDao<Comment> {
    /**
     * 查询评论
     * @param map
     * @return
     */
    List<Comment>  selectComment(Map<String,Object> map);
}
