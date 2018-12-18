package com.gw.blog.commons.abstracts;

import com.gw.blog.commons.abstracts.entity.BaseEntity;
import com.gw.blog.commons.dto.BaseResult;


public interface BaseService<T extends BaseEntity> {


    /**
     * 伪删除,状态值变为0
     * @param entity
     * @return 修改结果
     */
    BaseResult delete(T entity);

    /**
     * 保存数据
     * @param entity
     * @return 修改结果
     */
    BaseResult save(T entity);

    /**
     * 通过id获取数据
     * @param id
     * @return 返回的数据
     */
    T selectById(Long id);
}
