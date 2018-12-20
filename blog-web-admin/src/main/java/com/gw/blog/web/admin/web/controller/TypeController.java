package com.gw.blog.web.admin.web.controller;

import com.gw.blog.commons.abstracts.BaseTreeController;
import com.gw.blog.domain.Type;
import com.gw.blog.web.admin.service.TypeService;
import org.assertj.core.util.Lists;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public String form(Model model){
        List<Type> sourceList = service.selectAll();
        List<Type> targetList = Lists.newArrayList();
        System.out.println(sourceList);
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
    public String form(){
        return "back/type/form";
    }

    /**
     * 树形结构数据
     * @param parentId
     * @return
     */
    @ResponseBody
    @PostMapping(value = "tree")
    protected List<Type> tree(Long parentId){
        List<Type> list = Lists.newArrayList();

        if (parentId == null) {
            list = service.getByParentId(0L);
        }

        else {
            list = service.getByParentId(parentId);
        }

        return list;
    }
}
