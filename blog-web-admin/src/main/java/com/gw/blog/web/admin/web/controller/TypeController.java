package com.gw.blog.web.admin.web.controller;

import com.gw.blog.commons.abstracts.BaseTreeController;
import com.gw.blog.commons.contants.Contents;
import com.gw.blog.commons.dto.BaseResult;
import com.gw.blog.domain.Type;
import com.gw.blog.web.admin.service.TypeService;
import org.assertj.core.util.Lists;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

/**
 * 文章类型管理
 */
@Controller
@RequestMapping(value = "back/type")
public class TypeController extends BaseTreeController<Type, TypeService> {

    /**
     * 跳转到文章类型列表页
     * @return
     */
    @GetMapping(value = "list")
    public String list(Model model){
        List<Type> sourceList = service.selectAll();
        List<Type> targetList = Lists.newArrayList();
        // 排序
        sort(0L, sourceList, targetList);
        model.addAttribute("list", targetList);
        return "back/type/list";
    }

    /**
     * 跳转到表单页
     * @return
     */
    @GetMapping(value = "form")
    public String form(Type type, Long parentId){

        // 新增时设置 parentId, isParent
        if (type.getId() == null) {
            type.setIsParent(false);
            // 新增分类
            if (parentId == null) {
                type.setParentId(0L);
            }

            // 添加下级分类 设置父类名称
            else {
                type.setParentId(parentId);
                type.setTname(service.selectById(parentId).getName());
            }
        }

        return "back/type/form";
    }

    /**
     * 保存
     * @return
     */
    @PostMapping(value = "save")
    public String save(Type type, RedirectAttributes redirectAttributes){
        BaseResult result = service.save(type);
        addDataToAttribute(redirectAttributes, Contents.BASE_RESULT, result);
        // 成功
        if (result.getStatus() == BaseResult.STATUS_SUCCESS) {
            return "redirect:/back/type/list";
        }

        // 失败
        else {
            return "back/type/form";
        }

    }

    /**
     * 删除
     * @return
     */
    @GetMapping(value = "delete")
    public String delete(String id, RedirectAttributes redirectAttributes){
        Type type = service.selectById(Long.parseLong(id));
        BaseResult result = service.delete(type);
        addDataToAttribute(redirectAttributes, Contents.BASE_RESULT, result);
        return "redirect:/back/type/list";
    }
}
