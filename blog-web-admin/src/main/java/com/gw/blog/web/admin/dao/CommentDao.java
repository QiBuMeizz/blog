package com.gw.blog.web.admin.dao;
import com.gw.blog.commons.abstracts.BasePageDao;
import com.gw.blog.domain.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
public interface CommentDao extends BasePageDao<Comment> {
    /**
     * ≤È—Ø∆¿¬€
     * @param map
     * @return
     */
    List<Comment>  selectComment(Map<String,Object> map);
}