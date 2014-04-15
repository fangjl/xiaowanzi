package com.wanzi.domain.ticket;

import java.io.Serializable;

/**
 * 二维码实体类
 * User: meichao
 * Date: 14-3-25
 * Time: 上午11:25
 */
public class Ticket implements Serializable{

    private static final long serialVersionUID = 5696019820358828261L;

    public final static String forever_ticket = "QR_LIMIT_SCENE";

    public final static String no_forever_ticket = "QR_SCENE";

    public final static String ticket_pic_url = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=TICKET";



    private int sceneId;//场景值ID  临时二维码时为32位非0整型，永久二维码时最大值为100000

    private int expire;//是否为永久二维码 0 永久 , 1非永久

    private int expireSeconds;//过期时间

    //get set


    public int getSceneId() {
        return sceneId;
    }

    public void setSceneId(int sceneId) {
        this.sceneId = sceneId;
    }

    public int getExpire() {
        return expire;
    }

    public void setExpire(int expire) {
        this.expire = expire;
    }

    public int getExpireSeconds() {
        return expireSeconds;
    }

    public void setExpireSeconds(int expireSeconds) {
        this.expireSeconds = expireSeconds;
    }
}
