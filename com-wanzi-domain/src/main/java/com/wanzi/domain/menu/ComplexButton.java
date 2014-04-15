package com.wanzi.domain.menu;

/**
 * 复杂按钮（父按钮）
 * User: meichao
 * Date: 14-2-20
 * Time: 下午6:54
 */

public class ComplexButton extends Button {
    private Button[] sub_button;

    public Button[] getSub_button() {
        return sub_button;
    }

    public void setSub_button(Button[] sub_button) {
        this.sub_button = sub_button;
    }
}