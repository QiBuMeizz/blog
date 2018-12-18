package com.gw.blog.web.admin.web.ui;

import com.gw.blog.commons.abstracts.BaseController;
import com.gw.blog.commons.abstracts.BaseService;
import com.gw.blog.commons.dto.BaseResult;
import com.gw.blog.domain.Type;
import com.gw.blog.web.admin.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

/**
 * 前端展示首页
 */
@Controller
public class MainController extends BaseController<Type,TypeService> {



    @GetMapping(value = {"","main"})
    public String main(Model model){
        //获得分类导航栏
        List<Type> typeList = service.selectAll();
        model.addAttribute("baseResult", BaseResult.success("",typeList));
        return "main";
    }
}
