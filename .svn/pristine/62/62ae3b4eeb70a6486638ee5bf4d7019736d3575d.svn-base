package com.wanzi.util;

import com.qiniu.api.auth.digest.Mac;
import com.qiniu.api.config.Config;
import com.qiniu.api.io.IoApi;
import com.qiniu.api.io.PutExtra;
import com.qiniu.api.io.PutRet;
import com.qiniu.api.rs.PutPolicy;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import java.io.*;
import java.util.UUID;

/**
 * User: meichao
 * Date: 14-3-13
 * Time: 下午3:32
 */
public class UploadFile {

    private final static Logger log = LogManager.getLogger(UploadFile.class);

    /**
     * 上传图片到七牛 并返回picUrl
     * @param reader
     * @return
     */
    public static String UPqiNiu(InputStream reader){
        Config.ACCESS_KEY = "Qe0W0DfZvZlbUOW5McUVs1PswJFzT-2Q45ovr9zS";
        Config.SECRET_KEY = "KUHhud-kCu9_T79s1zKCiXeDN3k0vzY2ZlV1f5gH";
        Mac mac = new Mac(Config.ACCESS_KEY, Config.SECRET_KEY);
        String picUrl = null;
        // 请确保该bucket已经存在

        try {
            String bucketName = "weichat";
            PutPolicy putPolicy = new PutPolicy(bucketName);
            String uptoken = putPolicy.token(mac);
            PutExtra extra = new PutExtra();
            String key = getUUID();
            PutRet ret = IoApi.Put(uptoken, key, reader,extra);
            picUrl = ret.getKey();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return picUrl;
    }

    public static void main(String[] args) {
        Config.ACCESS_KEY = "Qe0W0DfZvZlbUOW5McUVs1PswJFzT-2Q45ovr9zS";
        Config.SECRET_KEY = "KUHhud-kCu9_T79s1zKCiXeDN3k0vzY2ZlV1f5gH";
        Mac mac = new Mac(Config.ACCESS_KEY, Config.SECRET_KEY);

        // 请确保该bucket已经存在
        try {
            String bucketName = "weichat";
            PutPolicy putPolicy = new PutPolicy(bucketName);
            String uptoken = putPolicy.token(mac);
            PutExtra extra = new PutExtra();
            String key = getUUID();

            InputStream reader = new FileInputStream(new File("D://1.jpg"));
            PutRet ret = IoApi.Put(uptoken, key, reader,extra);
            System.out.println("ret = " + ret.getKey());
        } catch (Exception e) {

        }
    }

    /**
     * 生成32位UUID 并去掉"-"
     */
    public static String getUUID() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

}
