package com.gw.blog.web.admin.service.impl;

import com.gw.blog.commons.abstracts.impl.BasePageServiceImpl;
import com.gw.blog.domain.Content;
import com.gw.blog.web.admin.dao.ContentDao;
import com.gw.blog.web.admin.service.ContentService;
import org.springframework.stereotype.Service;

@Service
public class ContentServiceImpl extends BasePageServiceImpl<Content, ContentDao> implements ContentService {
}
