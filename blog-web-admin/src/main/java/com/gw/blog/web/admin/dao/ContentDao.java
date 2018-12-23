package com.gw.blog.web.admin.dao;

import com.gw.blog.commons.abstracts.BasePageDao;
import com.gw.blog.domain.Content;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContentDao extends BasePageDao<Content> {
    /**
     * 根据typeId获取内容集合
     * @return
     */
    List<Content> getByTypeId(@Param(value = "typeId") Long typeId);

}