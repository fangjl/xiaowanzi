package com.wanzi.domain.menu;

/**
 * 普通按钮（子按钮）
 * User: meichao
 * Date: 14-2-20
 * Time: 下午6:26
 */

public class CommonButton extends Button {
    private String type;
    private String key;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }
}
