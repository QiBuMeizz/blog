package com.gw.blog.commons.abstracts;

import com.gw.blog.commons.abstracts.entity.BaseTreeEntity;

import java.util.List;

public interface BaseTreeService<T extends BaseTreeEntity> extends BaseService<T> {
    /**
     * 查询所有
     * @return
     */
    List<T> selectAll();

    /**
     * 根据parentId获取数据
     * @param parentId
     * @return
     */
    List<T> getByParentId(Long parentId);
}
