package com.gw.blog.web.admin.service.impl;

import com.gw.blog.commons.abstracts.impl.BasePageServiceImpl;
import com.gw.blog.commons.dto.BaseResult;
import com.gw.blog.domain.Comment;
import com.gw.blog.web.admin.dao.CommentDao;
import com.gw.blog.web.admin.service.CommentService;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
@Service
public class CommentServiceImpl extends BasePageServiceImpl<Comment, CommentDao> implements CommentService {
    //评论待审核状态
    private static final Integer NO_PASS_STATUS = 0;
    /**
     * 查询评论
     * @param comment 用于获取内容ID
     * @param index
     * @param size
     * @return
     */
    @Override
    public List<Comment> selectComment(Comment comment, int index, int size) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("comment",comment);
        map.put("index",index);
        map.put("size",size);
        return dao.selectComment(map);
    }

    /**
     * 保存评论
     * @param comment
     * @return
     */
    @Override
    public BaseResult save(Comment comment) {
        //true/新增
        if(comment.insertOrUpdate(comment)){
            Comment firstComment =  dao.selectByName(comment.getName());
            //名字已经评论过时检测评论者
            if(firstComment == null || checkComment(comment,firstComment)){
                //通过
                //设置状态为0，待审核状态
                comment.setStatus(NO_PASS_STATUS);
                dao.insert(comment);
            }
            else{
                //不通过
                return BaseResult.fail("该名字与首次评论的邮箱不一致");
            }
        }
        //false/更新
        else {
            //通过审核
            dao.update(comment);
            //获取父类ID
            Long parentId = comment.getParentId();
            //如果父类ID不是0，则不是一级评论
            if(!parentId.equals(0L)){
                Comment parentComment = dao.selectById(parentId);
                //设置父评论的is_parent和更新时间
                parentComment.setIsParent(true);
                parentComment.setUpdated(new Date());
                //更新父评论
                dao.update(parentComment);
            }
        }
        return BaseResult.success();
    }

    /**
     * 检测提交的评论的同一名字的邮箱是否一致
     * @param comment
     * @param firstComment
     * @return
     */
    private boolean checkComment(Comment comment, Comment firstComment) {
        //邮箱一致
        if(comment.getEmail().equals(firstComment.getEmail())){
            return true;
        }
        //邮箱不一致
        else{
            return false;
        }
    }

    /**
     *批量删除
     * @param ids
     */
    @Override
    public void deleteMore(Long... ids) {
        dao.deleteMore(ids);
    }

    @Override
    public List<Comment> selectByParentId(Long parentId) {
        return dao.selectByParentId(parentId);
    }

}