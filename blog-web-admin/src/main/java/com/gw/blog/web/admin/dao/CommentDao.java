package com.gw.blog.web.admin.dao;

import com.gw.blog.commons.abstracts.BasePageDao;
import com.gw.blog.domain.Comment;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentDao extends BasePageDao<Comment> {

}
