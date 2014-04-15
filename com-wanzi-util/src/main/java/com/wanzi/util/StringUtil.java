package com.wanzi.util;

import org.apache.commons.lang.StringUtils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.regex.Pattern;

/**
 * User: meichao
 * Date: 14-2-28
 * Time: 下午2:28
 */

public class StringUtil extends StringUtils{
    public static char STRING_SIGN_EQUAL_MARK = '=';

    public static char STRING_SIGN_COLON = ':';

    public static String getParamValue(String param) {
        return param.substring(param.indexOf("=") + 1);
    }

    public static String getParamValue(String param, char sign) {
        return param.substring(param.indexOf(sign) + 1);
    }

    /**
     * 获取字符串的前N个字符
     *
     * @param value
     * @param length
     * @return
     */
    public static String getShortString(String value, int length) {
        if (value == null) {
            return "";
        }
        if (value.length() <= length) {
            return value;
        }
        return value.substring(0, length - 1);
    }

    /**
     * 取当前位置以后的字符
     * @param value
     * @param position
     * @return
     */
    public static String getChildString(String value, int position) {
        if (isBlank(value)) {
            return "";
        }
        if (value.length() < position) {   //如果字符串的长度小于position，则返回空串
            return "";
        }
        value=value.trim();
        return value.substring(position);
    }

    /**
     * 取字符串的前length长度的串
     * @param value
     * @param length
     * @return
     */
    public static String getShortNewString(String value, int length) {
        if (isBlank(value)) {
            return "";
        }
        if (value.length() <= length) {   //如果字符串的长度小于length就直接返回原串
            return value;
        }
        value=value.trim();
        return value.substring(0, length);
    }

    /**
     * 判断是否包含字串
     * @param children
     * @param child
     * @return
     */
    public static boolean containChild(String children, String child) {
        if (isBlank(children)||isBlank(child)) {
            return false;
        }
        if (children.contains(child)) {
            return true;
        }
        return false;
    }

    /**
     *  返回字符串的长度
     * @param str
     * @return
     */
    public static int length(String str) {
        if (isBlank(str)) {
            return 0;
        }
        str=str.trim();
        str=escapeHtmlText(str.trim());
        return str.length();
    }

    /**
     * 去掉空格
     * @param str
     * @return
     */
    public static String stringTrim(String str) {
        if (isBlank(str)) {
            return "";
        }
        return   str.trim();
    }


    public static String escapeHtmlText(String inputString) {
        String htmlStr = inputString; //含html标签的字符串
        String textStr ="";
        java.util.regex.Pattern p_script;
        java.util.regex.Matcher m_script;
        java.util.regex.Pattern p_style;
        java.util.regex.Matcher m_style;
        java.util.regex.Pattern p_html;
        java.util.regex.Matcher m_html;
        try {
            String regEx_script = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>"; //定义script的正则表达式{或<script[^>]*?>[\\s\\S]*?<\\/script> }
            String regEx_style = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>"; //定义style的正则表达式{或<style[^>]*?>[\\s\\S]*?<\\/style> }
            String regEx_html = "<[^>]+>"; //定义HTML标签的正则表达式

            p_script = Pattern.compile(regEx_script,Pattern.CASE_INSENSITIVE);
            m_script = p_script.matcher(htmlStr);
            htmlStr = m_script.replaceAll(""); //过滤script标签

            p_style = Pattern.compile(regEx_style, Pattern.CASE_INSENSITIVE);
            m_style = p_style.matcher(htmlStr);
            htmlStr = m_style.replaceAll(""); //过滤style标签

            p_html = Pattern.compile(regEx_html,Pattern.CASE_INSENSITIVE);
            m_html = p_html.matcher(htmlStr);
            htmlStr = m_html.replaceAll(""); //过滤html标签

	          /* 空格 ——   */
            // p_html = Pattern.compile("\\ ", Pattern.CASE_INSENSITIVE);
            m_html = p_html.matcher(htmlStr);
            htmlStr = htmlStr.replaceAll(" "," ");


            textStr = htmlStr;

        }catch(Exception e) {
        }
        return textStr;
    }
    /**
     * <p>将字符串编码（编码一次）<p>
     *
     * @param str 字符串
     * @return String    编码后的字符串
     */
    @SuppressWarnings("deprecation")
    public static String encodeOneTime(String str) {

        return URLEncoder.encode(str);
    }

    /**
     * <p>将字符串编码（编码两次）<p>
     *
     * @param str 字符串
     * @return String    编码后的字符串
     */
    @SuppressWarnings("deprecation")
    public static String encode(String str) {

        return URLEncoder.encode(URLEncoder.encode(str));
    }

    /**
     * <p>将字符串编码（编码两次）<p>
     *
     * @param str    字符串
     * @param encode 字符集
     * @return String    编码后的字符串
     * @throws UnsupportedEncodingException
     */
    @SuppressWarnings("deprecation")
    public static String encode(String str, String encode) throws UnsupportedEncodingException {

        return URLEncoder.encode(URLEncoder.encode(str, encode), encode);
    }

    /**
     * <p>将字符串编码（编码三次）<p>
     *
     * @param str 字符串
     * @return String    编码后的字符串
     */
    @SuppressWarnings("deprecation")
    public static String encode2(String str) {

        return URLEncoder.encode(URLEncoder.encode(URLEncoder.encode(str)));
    }

    /**
     * <p>将字符串编码（编码三次）<p>
     *
     * @param str    字符串
     * @param encode 字符集
     * @return String    编码后的字符串
     * @throws UnsupportedEncodingException
     */
    @SuppressWarnings("deprecation")
    public static String encode2(String str, String encode) throws UnsupportedEncodingException {

        return URLEncoder.encode(URLEncoder.encode(URLEncoder.encode(str, encode), encode), encode);
    }

    /**
     * <p>将字符串编码（编码两次）<p>
     *
     * @param str 字符串
     * @return String    编码后的字符串
     * @throws UnsupportedEncodingException
     */
    @SuppressWarnings("deprecation")
    public static String encodeByBytes(String str, String encode) throws UnsupportedEncodingException {
        return URLEncoder.encode(URLEncoder.encode(str, encode));

    }

    /**
     * <p>将字符串解码<p>
     *
     * @param str 字符串
     * @return String    解码后的字符串
     */
    @SuppressWarnings("deprecation")
    public static String decode(String str) {

        return URLDecoder.decode(str);
    }


    /**
     * @param url
     * @param page
     * @return
     */
    public static String getCityPyUrl(String url, int page) {
        if (StringUtil.isNotBlank(url)) {
            return url += "-" + page + ".html";
        }
        return "";
    }

    /**
     * start add by panjian at 2010.05.08
     * <p/>
     * <p>将字符串解码<p>
     *
     * @param str 字符串
     * @return String    解码后的字符串
     * @throws UnsupportedEncodingException
     */
    @SuppressWarnings("deprecation")
    public static String decode(String str, String encoding) throws UnsupportedEncodingException {

        return URLDecoder.decode(str, encoding);
    }

    public static String string2Unicode(String s) {
        String as[] = new String[s.length()];
        String s1 = "";
        for (int i = 0; i < s.length(); i++) {
            as[i] = Integer.toHexString(s.charAt(i) & 0xffff);
            s1 = s1 + "\\u" + as[i];
        }
        return s1;
    }

    /**
     * 页面查看机器名
     * @param name
     * @return
     */
    public static String convertMachine(String name) {
        if (StringUtils.isBlank(name)) {
            return "";
        }
        name = name.replaceAll("^.*-(.+)\\..*\\..*$", "$1");
        return name;
    }

    /**
     * 处理酒店列表页面的床型显示
     * @return
     */
    public static String myGetBedDesNew(String bedDesc){
        if(bedDesc!=null){
            if(bedDesc.contains("大床")&&bedDesc.contains("单人床")&&bedDesc.contains("双床")){
                return "大/单/双" ;
            }else if(bedDesc.contains("大床")&&bedDesc.contains("双床")){
                return "大/双";
            }else if(bedDesc.contains("大床")&&bedDesc.contains("单人床")){
                return "大/单" ;
            }else if(bedDesc.contains("单人床")&&bedDesc.contains("双床")){
                return "单/双" ;
            } else if (bedDesc.contains("单人床")) {
                return "单人床";
            } else if (bedDesc.contains("双床")) {
                return "双床";
            } else if (bedDesc.contains("大床")) {
                return "大床";
            }else if(bedDesc.trim().indexOf("(")!=-1){
                return  bedDesc.substring(0,bedDesc.indexOf("("));
            }else if(bedDesc.trim().endsWith(",")){
                return  bedDesc.substring(0,bedDesc.lastIndexOf(","));
            }
        }
        if(StringUtils.isBlank(bedDesc)){
            return null;
        }
        return bedDesc;
    }



    public static void main(String[] args) {
        //System.out.println(StringUtil.getErpOrderTokenValue(""));
//        System.out.println(decode("%CF%C3%C3%C5"));
//
//        System.out.println(decode(encode2("如家")));
//        String host1="BJ-B28-2-131156.360buy.com";
//		String host2="bjqt-chenghaix";
//		String host3="POPWEB_02";
//		System.out.println("1-------"+convertMachine(host1));
//		System.out.println("2-------"+convertMachine(host2));
//		System.out.println("3-------"+convertMachine(host3));
//        System.out.print(containChild("adsd","ad"));
        String str="<font class='skcolor_ljg'>北京瑞兆快捷酒店（国贸分店）</font>"  ;
        escapeHtmlText(str);
        System.out.println("3-------"+escapeHtmlText(str));

    }
}
