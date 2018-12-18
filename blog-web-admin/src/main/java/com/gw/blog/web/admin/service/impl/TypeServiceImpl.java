package com.gw.blog.web.admin.service.impl;

import com.gw.blog.commons.abstracts.impl.BaseTreeServiceImpl;
import com.gw.blog.domain.Type;
import com.gw.blog.web.admin.dao.TypeDao;
import com.gw.blog.web.admin.service.TypeService;
import org.springframework.stereotype.Service;

@Service
public class TypeServiceImpl extends BaseTreeServiceImpl<Type, TypeDao> implements TypeService {
}
