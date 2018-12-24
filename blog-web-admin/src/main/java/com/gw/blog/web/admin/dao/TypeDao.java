package com.gw.blog.web.admin.dao;

import com.gw.blog.commons.abstracts.BaseTreeDao;
import com.gw.blog.domain.Type;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TypeDao extends BaseTreeDao<Type> {

    /**
     * 删除
     * @param list
     */
    void delete(List<Type> list);
}
