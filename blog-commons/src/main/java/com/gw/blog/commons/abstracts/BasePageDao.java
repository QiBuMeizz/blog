package com.gw.blog.commons.abstracts;

import com.gw.blog.commons.abstracts.entity.BasePageEntity;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 需要分页的Dao
 * @param <T>
 */
@Repository
public interface BasePageDao<T extends BasePageEntity> extends BaseDao<T> {

    /**
     * 分页
     * @param map
     * @return
     */
    List<T> page(Map<String,Object> map);

    /**
     * 获取总条数
     * @return
     */
    Integer count(T entity);

    /**
     * 自定义标签分页
     */
    List<T> pageList(T entity);
}
