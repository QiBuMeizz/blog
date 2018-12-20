package com.gw.blog.commons.abstracts;

import com.gw.blog.commons.abstracts.entity.BaseEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.lang.reflect.ParameterizedType;
import java.util.List;

@Controller
public abstract class BaseController<T extends BaseEntity,S extends BaseService<T>> {

    @Autowired
    protected S service;

    /**
     * 获取数据实例
     * @param id
     * @return
     * @throws IllegalAccessException
     * @throws InstantiationException
     */
    @ModelAttribute
    protected T modelAttribute(Long id) throws IllegalAccessException, InstantiationException {
        if (id !=null){
            return service.selectById(id);
        }

        else {
            Class<T> entityClass = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
            return entityClass.newInstance();
        }
    }
}
