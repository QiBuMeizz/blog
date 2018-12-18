package com.gw.blog.commons.abstracts;

import com.gw.blog.commons.abstracts.entity.BaseEntity;
import com.gw.blog.commons.abstracts.entity.BaseTreeEntity;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 树表结构的Dao
 * @param <T>
 */
@Repository
public interface BaseTreeDao<T extends BaseTreeEntity> extends BaseDao<T> {

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
