package com.gw.blog.web.admin.dao;

import com.gw.blog.commons.abstracts.BasePageDao;
import com.gw.blog.domain.Content;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContentDao extends BasePageDao<Content> {
    /**
     * 根据typeId获取内容集合
     * @return
     */
    List<Content> getByTypeId(Long typeId);

    /**
     * 根据id获取内容集合
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