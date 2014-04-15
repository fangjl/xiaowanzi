package com.wanzi.util;


import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by meichao on 14-2-17.
 */
public class RegexMatcherUtil {

    private final static Logger log = LogManager.getLogger(RegexMatcherUtil.class);

    /**
     *
     * @param regex 正则表达式字符串
     * @param str   要匹配的字符串
     * @return
     */
    public static boolean match(String regex,String str){
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(str);
        return matcher.matches();
    }

    public static boolean isPhone(String str){
        String regex = "0?(13|15|18|14)[0-9]{9}$";
        return match(regex,str);
    }

    public static boolean isPostCode(String str){
        String myReg = "(^\\s*)\\d{6}(\\s*$)";
        return match(myReg,str);
    }

    public static boolean isUserName(String str){
        String regex = "^[a-zA-Z0-9\\u0391-\\uFFE5]+$";
        return match(regex,str);
    }

}
