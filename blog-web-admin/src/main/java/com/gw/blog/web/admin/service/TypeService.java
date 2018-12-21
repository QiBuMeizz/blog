package com.gw.blog.web.admin.service;

import com.gw.blog.commons.abstracts.BaseTreeService;
import com.gw.blog.commons.dto.BaseResult;
import com.gw.blog.domain.Type;

public interface TypeService extends BaseTreeService<Type> {
    /**
     * 正确性检查
     * @param type
     * @return
     */
    String check(Type type);


}
