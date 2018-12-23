package com.gw.blog.web.admin.service.impl;

import com.gw.blog.commons.abstracts.impl.BaseTreeServiceImpl;
import com.gw.blog.commons.contants.Contents;
import com.gw.blog.commons.dto.BaseResult;
import com.gw.blog.domain.Comment;
import com.gw.blog.domain.Content;
import com.gw.blog.domain.Type;
import com.gw.blog.web.admin.dao.CommentDao;
import com.gw.blog.web.admin.dao.ContentDao;
import com.gw.blog.web.admin.dao.TypeDao;
import com.gw.blog.web.admin.service.TypeService;
import org.apache.commons.collections.ListUtils;
import org.apache.ibatis.annotations.Param;
import org.assertj.core.util.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class TypeServiceImpl extends BaseTreeServiceImpl<Type, TypeDao> implements TypeService {

    @Autowired
    private ContentDao contentDao;

    /**
     * 删除
     * @param type
     */
    @Override
    @Transactional(readOnly = false)
    public BaseResult delete(Type type) {
        // 分类 Id
        Long id = type.getId();

        // 删除分类及其子分类
        List<Type> typeList = getByParentId(id);
        typeList.add(type);
        dao.delete(typeList);

        // 删除分类及其子分类的所有文章
        List<Content> contentList = Lists.newArrayList();
        List<Content> contentSubList;
        for (Type t : typeList) {
            Long typeId = t.getId();
            contentSubList = contentDao.getByTypeId(typeId);
            // 把子分类的文章添加到 contentList
            contentList = ListUtils.union(contentList, contentSubList);
        }
        contentDao.deleteList(contentList);

        return BaseResult.success("删除数据成功!!!");
    }

    /**
     * 保存
     */
    @Override
    @Transactional(readOnly = false)
    public BaseResult save(Type type) {
        String message = check(type);

        // 正确
        if (message == null) {
            //true/新增
            if(type.insertOrUpdate(type)){
                dao.insert(type);
            }
            //false/更新
            else {
                dao.update(type);
            }
            return BaseResult.success();
        }

        return BaseResult.fail(message);
    }

    /**
     * 正确性检查
     * 规定可选父类的范围
     * @param type
     * @return
     */
    @Transactional(readOnly = false)
    public String check(Type type) {
        // 本类ID
        Long id = type.getId();
        // 原类别
        Type oldType = selectById(id);
        // 改变后的 parentId
        Long parentId = type.getParentId();
        // 改变后的父类
        Type parent = selectById(parentId);
        // 一级类目个数
        int size1 = getByParentId(0L).size();
        // 二级类目个数
        int size2 = getByParentId(id).size();
        // 新增
        if (id == null) {
            // 无父类或父类无父类
            if (parentId == 0L || parent.getParentId() == 0L) {
                if ( size1 < 7 || parentId != 0L) {
                    // 改变父类 isParent 值
                    turnIsParent(parent, null);
                    return null;
                }

                else {
                    return "父类个数不能超过8个,请选择其它分类";
                }
            }
        }

        // 更新
        else {
            // 本类不可为自身类的父类
            if (id != parentId) {
                // 无父类或父类无父类
                if (parentId == 0L || parent.getParentId() == 0L) {
                    // 子类最多只有一个
                    if (size2 <= 1 && size1 < 7) {
                        // 改变父类 isParent 值
                        turnIsParent(parent, oldType);
                        return null;
                    }

                    else {
                        return "此类不能归属于其它分类";
                    }
                }
            }
        }
        return "此分类不能成为父类";
    }

    /**
     * 改变父类 isParent 值
     * @param parent 新父类
     * @param oldType  原分类
     */
    @Transactional(readOnly = false)
    public void turnIsParent(Type parent, Type oldType) {

        // 新晋父类
        if (parent != null) {
            if (!parent.getIsParent()) {
                parent.setIsParent(true);
                dao.update(parent);
            }
        }

        // 无子类
        if (oldType != null) {
            // 原父类 Id
            Long oldParentId = oldType.getParentId();
            // 原父类有且只有一个子类
            if (getByParentId(oldParentId).size() == 1) {
                Type oldParent = selectById(oldParentId);
                oldParent.setIsParent(false);
                dao.update(oldParent);
            }
        }
    }

}
