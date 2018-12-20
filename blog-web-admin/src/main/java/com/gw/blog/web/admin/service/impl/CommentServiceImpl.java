package com.gw.blog.web.admin.service.impl;

import com.gw.blog.commons.abstracts.impl.BasePageServiceImpl;
import com.gw.blog.domain.Comment;
import com.gw.blog.web.admin.dao.CommentDao;
import com.gw.blog.web.admin.service.CommentService;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl extends BasePageServiceImpl<Comment, CommentDao> implements CommentService {

}
