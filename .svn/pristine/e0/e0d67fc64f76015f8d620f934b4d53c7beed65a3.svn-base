package com.wanzi.web.interceptor;

import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;

/**
 * User: meichao
 * Date: 14-4-3
 * Time: 上午11:03
 */
public class MyMultipartResolver extends CommonsMultipartResolver {


    @Override
    public boolean isMultipart(HttpServletRequest request) {
        //        if(request.getRequestURI().contains("/upload/saveImg")) {
//            return false;
//        } else {
//            return super.isMultipart(request);
//        }
        return super.isMultipart(request);
    }


}
