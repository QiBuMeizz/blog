package com.gw.blog.web.admin.web.controller;

import com.gw.blog.commons.abstracts.BaseController;
import com.gw.blog.commons.abstracts.BaseTreeController;
import com.gw.blog.domain.Type;
import com.gw.blog.web.admin.service.TypeService;
import org.assertj.core.util.Lists;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
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

}
