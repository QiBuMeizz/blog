package com.gw.blog.commons.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.io.IOException;
import java.io.Serializable;
import java.io.Writer;

@Data
@EqualsAndHashCode(callSuper = false)
public class PageTag extends BodyTagSupport implements Serializable {

    /**
     * 总数
     */
    private int count;

    /**
     * 每页多少条
     */
    private int pageSize=3;

    /**
     * 当前是第几页
     */
    private int current;

    private static final int SHOW_PAGE = 3;

    /**
     * 标签加载后执行的方法
     * @return
     * @throws JspException
     */
    @Override
    public int doEndTag() throws JspException {
        //简单的分页数
        int simplePage = count / pageSize;
        //实际的分页数
        int totalPage = count % pageSize > 0 ? simplePage + 1 : simplePage;

        //当前页前的页码数
        int start = current - SHOW_PAGE < 1 ? 1 : current - SHOW_PAGE;
        //当前页后的页码数
        int end = current + SHOW_PAGE > totalPage ? totalPage : current + SHOW_PAGE;
        //上一页
        int prePage = current - 1 < 1 ? 1 : current - 1;
        //下一页
        int nextPage = current + 1 > totalPage ? totalPage : current + 1;
        //获得输出字符流
        Writer writer = pageContext.getOut();

        try {
            writer.write("<a class='button col-md-1 text-center' href='javascript:page(1)'>首页</a>");
            writer.write("<a class='button col-md-2 pre text-center' href='javascript:page("+prePage+")'>上一页</a>");

            /*for (int i = start; i < end+1; i++) {
                if (current == i){
                    writer.write("<a class='button col-md-1' href='javascript:void(0)'>"+i+"</a>");
                }
                else {
                    writer.write("<a class='button col-md-1' href='javascript:page("+i+")'>"+i+"</a>");
                }
            }*/

            writer.write("<a class='button col-md-6 text-center' href='javascript:void(0)'>-&nbsp;"+current+"&nbsp;-</a>");

            writer.write("<a class='button col-md-1 text-center pull-right' href='javascript:page("+totalPage+")'>尾页</a>");
            writer.write("<a class='button col-md-2 text-center pull-right next' href='javascript:page("+nextPage+")'>下一页</a>");

        } catch (IOException e) {
            e.printStackTrace();
        }


        return super.SKIP_BODY;
    }
}
