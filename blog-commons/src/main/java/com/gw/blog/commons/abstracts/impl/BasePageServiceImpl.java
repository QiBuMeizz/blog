package com.gw.blog.commons.abstracts.impl;

import com.gw.blog.commons.abstracts.BasePageDao;
import com.gw.blog.commons.abstracts.BasePageService;
import com.gw.blog.commons.abstracts.entity.BasePageEntity;
import com.gw.blog.commons.dto.BaseResult;
import com.gw.blog.commons.dto.Page;
import com.gw.blog.commons.dto.PageResult;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public abstract class BasePageServiceImpl<T extends BasePageEntity,D extends BasePageDao<T>> extends BaseServiceImpl<T,D> implements BasePageService<T> {

    /**
     * 分页
     * @param map
     * @return
     */
    @Override
    public List<T> page(Map<String, Object> map) {
        return dao.page(map);
    }

    /**
     * 查询总数
     * @param entity
     * @return
     */
    @Override
    public Integer count(T entity) {
        return dao.count(entity);
    }

    @Override
    public BaseResult pageList(T entity) {
        Integer count = dao.count(entity);

        //没有符合的数据
        if (count == null || count == 0){
            return BaseResult.fail("敬请期待!!!");
        }

        Page page = entity.getPage();

        //简单的分页数
        int simplePage = count / page.getSize();
        //实际的分页数
        int totalPage = count %  page.getSize() > 0 ? simplePage + 1 : simplePage;

        //页码校验
        if (page.getCurrent() < 1){
            page.setCurrent(1);
        }
        else if (page.getCurrent() > totalPage){
            page.setCurrent(totalPage);
        }

        List<T> pageList = dao.pageList(entity);
        return getResult(entity,count,pageList);
    }

    private BaseResult getResult(T entity, Integer count, List<T> pageList){
        //设置PageResult
        PageResult<T> pageResult = new PageResult<>();

        pageResult.setCount(count);
        pageResult.setList(pageList);
        pageResult.setCurrent(entity.getPage().getCurrent());
        pageResult.setPageSize(entity.getPage().getSize());

        //设置BaseResult
        return BaseResult.success("", pageResult);
    }


    /**
     * 多选删除
     * @param ids
     * @return
     */
    @Override
    public BaseResult deleteMore(String ids) {
        dao.deleteMore(ids);
        return  BaseResult.success();
    }
}
