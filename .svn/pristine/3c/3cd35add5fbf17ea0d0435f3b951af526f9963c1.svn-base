package com.wanzi.web.weixin;

import com.wanzi.domain.Account;
import com.wanzi.domain.AdminReply;
import com.wanzi.domain.SystemConstant;
import com.wanzi.util.UploadFile;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.io.Writer;

/**
 * User: meichao
 * Date: 14-4-3
 * Time: 上午10:57
 */
@Controller
public class UploadController {

    @RequestMapping(value = "/upload/saveImg",method = RequestMethod.POST)
    public void saveImg(HttpServletRequest request,HttpServletResponse response) {
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile multipartFile = multipartRequest.getFile("imgFile");
        System.out.println(multipartFile.getOriginalFilename());
        String url = "";
        try {
            InputStream reader = multipartFile.getInputStream();
            url = SystemConstant.PREPIC_URL + UploadFile.UPqiNiu(reader);
            /**
             * KindEditor在文件上传成功返回时无法获取JSON，只能用字符串输出到Response中，
             */
            response.setContentType("text/html");
            Writer out = response.getWriter();
            out.append("{\"error\":" + 0 + ", \"url\": \"" + url + "\"}");
        } catch (Exception e) {
            System.out.println(e);
        }
    }






    public void toResponse(HttpServletResponse response,String url) throws Exception{
        response.setContentType("text/html");
        Writer out = response.getWriter();
        out.append("{\"error\":" + 0 + ", \"url\": \"" + url + "\"}");
    }

}
