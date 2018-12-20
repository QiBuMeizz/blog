package com.gw.blog.web.admin.web.ui;

import com.gw.blog.commons.dto.BaseResult;
import com.gw.blog.commons.dto.Page;
import com.gw.blog.domain.Content;
import com.gw.blog.domain.Type;
import com.gw.blog.web.admin.service.ContentService;
import com.gw.blog.web.admin.service.TypeService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

/**
 * 前端展示首页
 */
@Controller
public class MainController  {

    @Autowired
    private TypeService typeService;

    @Autowired
    private ContentService contentService;

    //关于我们的类别id
    private static final  Long ABOUT_US_TYPE = 1L;

    //关于我们的内容id
    private static final Long ABOUT_US_CONTENT = 1L;

    //敬请期待
    private static final Long COMING_SOON = 2L;

    @GetMapping(value = {"","main"})
    public String main(Content content, Page page, Model model){
        //分页列表
        content.setPage(page);
        //关于我们
        if (content != null && content.getTypeId() == ABOUT_US_TYPE) {
            return "redirect:/content?id=" + ABOUT_US_CONTENT;
        }
        //列表页面
        BaseResult baseResult = contentService.pageList(content);
        //对应的分类没有博文
        if (baseResult.getStatus() == BaseResult.STATUS_FAIL){
            return "redirect:/content?id=" + COMING_SOON;
        }
        model.addAttribute("pageResult",baseResult);
        //获得分类导航栏
        List<Type> typeList = typeService.selectAll();
        model.addAttribute("baseResult", BaseResult.success("",typeList));
        return "main";
    }

    
    /**
     * 分页显示内容
     * @return
     **/
    @GetMapping(value = "content")
    public String content(@RequestParam Long id, Model model){

        Content content = contentService.selectById(id);
        model.addAttribute("content",content);

        //获得分类导航栏
        List<Type> typeList = typeService.selectAll();
        model.addAttribute("baseResult", BaseResult.success("",typeList));
        return "content";
    }


}
