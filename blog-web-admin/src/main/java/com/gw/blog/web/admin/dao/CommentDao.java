package com.gw.blog.web.admin.dao;
import com.gw.blog.commons.abstracts.BasePageDao;
import com.gw.blog.domain.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
public interface CommentDao extends BasePageDao<Comment> {
    /**
     *查询评论
     * @param map
     * @return
     */
    List<Comment>  selectComment(Map<String,Object> map);

    /**
     * 根据名字查询
     * @param name
     * @return
     */
    Comment selectByName(String name);

    /**
     * 批量删除--真
     * @param array
     */
    void deleteMore(Long... array);

    /**
     * 找父评论
     * @return
     */
    List<Comment> selectByParentId(Long parentId);
}