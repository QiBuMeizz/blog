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
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeServiceImpl extends BaseTreeServiceImpl<Type, TypeDao> implements TypeService {

    @Autowired
    private ContentDao contentDao;

    /**
     * 删除
     */
    @Override
    public BaseResult delete(Type type){

        // 删除本类及其所属文章
        deleteAll(type);

        // 删除子类及其所属文章
        List<Type> list = getByParentId(type.getId());
        if (list != null) {
            for (Type child : list) {
                deleteAll(child);
            }
        }
        return BaseResult.success("删除数据成功!!!");
    }

    /**
     * 删除相应的分类文章
     * @param type
     */
    private void deleteAll(Type type) {

        List<Content> contentList = contentDao.getByTypeId(type.getId());
        if (contentList != null) {
            for (Content content : contentList) {
                content.setStatus(Contents.DELETE_STATUS);
                contentDao.delete(content);
            }
        }

        type.setStatus(Contents.DELETE_STATUS);
        dao.delete(type);
    }

    /**
     * 保存
     */
    @Override
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
    @Override
    public String check(Type type) {
        // 本类ID
        Long id = type.getId();
        // 改变后的 parentId
        Long parentId = type.getParentId();
        // 改变后的父类
        Type parent = selectById(parentId);
        // 新增
        if (id == null) {
            // 无父类或父类无父类
            if (parentId == 0L || parent.getParentId() == 0L) {
                // 限制父类个数
                int size = getByParentId(0L).size();
                if ( size < 8) {
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
                    // 原类别
                    Type oldType = selectById(id);
                    if (oldType.getParentId() != 0L) {
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
     * @param parent
     */
    private void turnIsParent(Type parent, Type oldType) {

        // 新晋父类
        if (parent != null) {
            if (!parent.getIsParent()) {
                parent.setIsParent(true);
                save(parent);
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
                save(oldParent);
            }
        }
    }

}
