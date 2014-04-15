package com.wanzi.service;

import com.wanzi.domain.AccessToken;
import com.wanzi.domain.menu.*;
import com.wanzi.util.WeixinUtil;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

/**
 * 菜单管理器类
 * User: meichao
 * Date: 14-2-21
 * Time: 下午3:38
 */
public class MenuService {

    private final static Logger log = LogManager.getLogger(MenuService.class);

    public static void main(String[] args) {
        // 第三方用户唯一凭证
        String appId = "wx272c39dc15deb93c";
        // 第三方用户唯一凭证密钥
        String appSecret = "bf8513741c39341b16a38254189ba8ba";

        // 调用接口获取access_token
        AccessToken at = WeixinUtil.getAccessToken(appId, appSecret);

        if (null != at) {
            // 调用接口创建菜单
            int result = WeixinUtil.createMenu(getMenu(), at.getToken());

            // 判断菜单创建结果
            if (0 == result)
                log.info("菜单创建成功！");
            else
                log.info("菜单创建失败，错误码：" + result);
        }
    }

    /**
     * 组装菜单数据
     *
     * @return
     */
    private static Menu getMenu() {
        CommonButton btn11 = new CommonButton();
        btn11.setName("天气预报");
        btn11.setType("click");
        btn11.setKey("V1001_TODAY_WHETHER");

        CommonButton btn12 = new CommonButton();
        btn12.setName("公交查询");
        btn12.setType("click");
        btn12.setKey("12");

        CommonButton btn13 = new CommonButton();
        btn13.setName("周边搜索");
        btn13.setType("click");
        btn13.setKey("13");

        ViewButton btn21 = new ViewButton();
        btn21.setType("view");
        btn21.setName("会员专区");
        btn21.setUrl("http://kevn.sinaapp.com/article");

        CommonButton btn31 = new CommonButton();
        btn31.setName("Q友圈");
        btn31.setType("click");
        btn31.setKey("31");

        CommonButton btn32 = new CommonButton();
        btn32.setName("电影排行榜");
        btn32.setType("click");
        btn32.setKey("32");

        CommonButton btn33 = new CommonButton();
        btn33.setName("幽默笑话");
        btn33.setType("click");
        btn33.setKey("33");



        ComplexButton mainBtn1 = new ComplexButton();
        mainBtn1.setName("生活助手");
        mainBtn1.setSub_button(new CommonButton[] { btn11, btn12, btn13 });

//        ComplexButton mainBtn2 = new ComplexButton();
//        mainBtn2.setName("会员专区");
//        mainBtn2.setSub_button(new CommonButton[] { btn21, btn22, btn23, btn24, btn25 });

        ComplexButton mainBtn3 = new ComplexButton();
        mainBtn3.setName("更多体验");
        mainBtn3.setSub_button(new CommonButton[] { btn31, btn32, btn33 });

        /**
         * 在某个一级菜单下没有二级菜单的情况，menu该如何定义呢？<br>
         * 比如，第三个一级菜单项不是“更多体验”，而直接是“幽默笑话”，那么menu应该这样定义：<br>
         * menu.setButton(new Button[] { mainBtn1, mainBtn2, btn33 });
         */
        Menu menu = new Menu();
        menu.setButton(new Button[] { mainBtn1, btn21, mainBtn3 });

        return menu;
    }

}
