package com.gw.blog.commons.abstracts;

import com.gw.blog.commons.abstracts.entity.BaseEntity;
import org.springframework.stereotype.Repository;

/**
 * 最基础的Dao接口
 * @param <T>
 */
@Repository
public interface BaseDao<T extends BaseEntity> {

    /**
     * 添加
     * @return 修改结果
     */
    void insert(T entity);

    /**
     * 伪删除,状态值变为0
     * @param entity
     * @return 修改结果
     */
    void delete(T entity);

    /**
     * 数据更新
     * @param entity
     * @return 修改结果
     */
    void update(T entity);

    /**
     * 通过id获取数据
     * @param id
     * @return 返回的数据
     */
    T selectById(Long id);


}
