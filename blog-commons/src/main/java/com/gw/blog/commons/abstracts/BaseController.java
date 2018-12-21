package com.gw.blog.commons.abstracts;

import com.gw.blog.commons.abstracts.entity.BaseEntity;
import com.gw.blog.commons.contants.Contents;
import com.gw.blog.commons.dto.BaseResult;
import com.gw.blog.commons.validation.BeanValidator;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.lang.reflect.ParameterizedType;
import java.util.List;

@Controller
public abstract class BaseController<T extends BaseEntity,S extends BaseService<T>> {

    @Autowired
    protected S service;

    /**
     * 获取数据实例
     * @param id
     * @return
     * @throws IllegalAccessException
     * @throws InstantiationException
     */
    @ModelAttribute
    protected T modelAttribute(Long id) throws IllegalAccessException, InstantiationException {
        if (id !=null){
            return service.selectById(id);
        }

        else {
            Class<T> entityClass = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
            return entityClass.newInstance();
        }
    }

    protected BaseResult beanValidator(T t, Model model){
        return checkBean(t,model);
    }
    protected BaseResult beanValidator(T t, RedirectAttributes redirectAttributes){
        return checkBean(t, redirectAttributes);
    }
    /**
     * 检测Bean
     * @param t
     * @param model
     * @return
     */
    private BaseResult checkBean(T t, Model model){
        //检测对象
        String message = BeanValidator.validator(t);
        //检测成功
        if(StringUtils.isBlank(message)){
            return BaseResult.success();
        }
        //检测失败
        else {
            BaseResult baseResult = BaseResult.fail(message,t);
            if(model instanceof RedirectAttributes){
                RedirectAttributes redirectAttributes = (RedirectAttributes) model;
                addDataToAttribute(redirectAttributes, Contents.BASE_RESULT,baseResult);
            }
            else{
                addDataToAttribute(model,Contents.BASE_RESULT,baseResult);
            }
            return baseResult;
        }
    }

    /**
     * 将数据存在请求中（适用于转发）
     * @methodName: addDataToAttribute
     * @param model
     * @param key 存进attribute的key
     * @param data 存进attribute的value
     * @return void
     * @exception
     * @author: ZivLee
     * @date: 2018/12/21 16:05
     */
    protected void addDataToAttribute(Model model,String key,Object data){
        model.addAttribute(key,data);
    }
    protected void addDataToAttribute(Model model, Object data){
        model.addAttribute(Contents.BASE_RESULT,data);
    }
    /**
     * 将数据存在session/cookie中，用完即删（使用于重定向）
     * @methodName: addDataToAttribute
     * @param redirectAttributes
     * @param key 存进attribute的key
     * @param data  存进attribute的value
     * @return void
     * @exception
     * @author: ZivLee
     * @date: 2018/12/21 16:05
     */
    protected void addDataToAttribute(RedirectAttributes redirectAttributes, String key, Object data){
        redirectAttributes.addFlashAttribute(key,data);
    }
    protected void addDataToAttribute(RedirectAttributes redirectAttributes, Object data){
        redirectAttributes.addFlashAttribute(Contents.BASE_RESULT,data);
    }
}
