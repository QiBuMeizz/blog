package com.gw.blog.web.admin.service;

import com.gw.blog.commons.abstracts.BasePageService;
import com.gw.blog.domain.Content;

public interface ContentService extends BasePageService<Content> {
    /**
     * 根据id查询内容
     * @param id
     * @return
     */
    Content getById(Long id);

    /**
     * 修改内容
     * @param content
     */
//    void update(Content content);
}
