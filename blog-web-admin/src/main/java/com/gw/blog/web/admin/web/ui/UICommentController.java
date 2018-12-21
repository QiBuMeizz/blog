package com.gw.blog.web.admin.web.ui;

import com.gw.blog.commons.abstracts.BaseController;
import com.gw.blog.commons.contants.Contents;
import com.gw.blog.commons.dto.BaseResult;
import com.gw.blog.domain.Comment;
import com.gw.blog.web.admin.service.CommentService;
import org.apache.commons.collections.ListUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @description
 * 评论展示控制器
 * @author: ZivLee
 * @date: 2018/12/19 19:32
 * @className: CommentController
 * @version: V1.0.0
*/
@Controller
@RequestMapping("/comment")
public class UICommentController extends BaseController<Comment, CommentService> {
    //评论提交成功后跳转回页面的页签
    private static final String COMMENT_TAB_SUCCESS = "#tab_2";
    //评论提交失败后跳转回页面的页签
    private static final String COMMENT_TAB_FAIL = "#tab_3";

    /**
     * 提交评论
     * @param comment
     * @param redirectAttributes
     * @return
     */
    @PostMapping("/form")
    public String saveComment(Comment comment, RedirectAttributes redirectAttributes){
        //设置跳转页面后的页签
        String tab = COMMENT_TAB_FAIL;
        //校验评论
        BaseResult baseResult = beanValidator(comment, redirectAttributes, Contents.COMMENT_RESULT);
        //校验成功
        if(baseResult.getStatus() == BaseResult.STATUS_SUCCESS){
            if(comment.getParentId() == null){
                comment.setParentId(0L);
            }
            //保存
            baseResult = service.save(comment);
            if(baseResult.getStatus() == BaseResult.STATUS_SUCCESS){
                //保存成功
                baseResult.setMessage("评论已成功提交，待管理员审核后即可显示");
                tab = COMMENT_TAB_SUCCESS;
            }
            else {
                //保存失败,将comment返回
                baseResult.setData(comment);
            }
            //将结果放进session，用后即删
            addDataToAttribute(redirectAttributes,Contents.COMMENT_RESULT,baseResult);
        }
        return "redirect:/content?id="+comment.getContentId()+tab;
    }

    /**
     * 展示评论
     * @param comment
     * @param index
     * @param size
     * @return
     */
    @ResponseBody
    @PostMapping("/show")
    public Map<String, Object> show(Comment comment, String index, String size){
        //没有内容ID，直接返回
        if(comment.getContentId() == null){
            return null;
        }
        //设置查看哪个ID的回复,0则表示所以查看一级评论
        comment.setId(comment.getId() == null ? 0L:comment.getId());
        //起始下标
        int newIndex = index == null ? 0:Integer.parseInt(index);
        //偏移量
        int newSize = size == null ? 5:Integer.parseInt(size);
        newIndex = newIndex*newSize;

        //是否还有更多，默认为true
        boolean isHashMore = true;

        List<Comment> list;
        //如果不是一级评论则递归查询获取该评论下所有回复，并限制数据量
        if(comment.getParentId() != null && !"0L".equals(comment.getParentId())){
            list = service.selectComment(comment, 0, 10000);
            //查询并限制显示
            List<Comment> targetList = getChildComments(list, list);
            //重新时间升序排序
            sortByDateAsc(targetList);

            int length = targetList.size();
            //截取 list 防止下标越界
            if(length >= newIndex && length >= newSize){
                //还有更多数据
                if(length > newIndex+newSize){
                    list = targetList.subList(newIndex,newIndex+newSize+1);
                }
                //没有更多数据
                else{
                    list = targetList.subList(newIndex,length);
                }
            }
        }
        //查看评论
        else {
            ////查多一个数据用于判断是否还有更多
            list = service.selectComment(comment, newIndex, newSize+1);
        }

        //集合大小 <= 偏移量则说明没有更多
        if(list.size() <= newSize){
            isHashMore = false;
        }
        else{
            //最后一个数据用于判断是否还有更多后移除掉，让集合大小与偏移量相等
            list.remove(list.size()-1);
        }

        Map<String, Object> map = new HashMap<>();
        map.put("commentList",list);
        map.put("isHashMore",isHashMore);
        map.put("index",index);
        return map;
    }

    /**
     * 递归查询
     * @param sourceList 需要遍历的数据源
     * @param list 最终得到目标数据
     */
    private List<Comment> getChildComments(List<Comment> sourceList, List<Comment> list) {
        List<Comment> subList;
        for (Comment subComment : sourceList) {
            if(subComment.getIsParent()){
                //不限制查询条数
                subList = service.selectComment(subComment, 0, 10000);
                list = ListUtils.union(list,subList);
                list = getChildComments(subList,list);
            }
        }
        return list;
    }

    /**
     * 按时间升序排序
     * @param list
     */
    private void sortByDateAsc(List<Comment> list) {
        Collections.sort(list, new Comparator<Comment>() {
            @Override
            public int compare(Comment  comment1, Comment comment2) {
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date dt1 = comment1.getCreated();
                Date dt2 = comment2.getCreated();
                if (dt1.getTime() > dt2.getTime()) {
                    return 1;
                } else if (dt1.getTime() < dt2.getTime()) {
                    return -1;
                } else {
                    return 0;
                }
            }
        });
    }
}
