
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/gua.index.css" media="all">
</head>
<body data-role="page" class="activity-scratch-card-winning">


<div class="main">
    <div class="cover">
        <img src="<%=request.getContextPath()%>/assets/css/img/activity-scratch-card-bannerbg.png">
        <div id="prize">谢谢参与</div>
        <div id="scratchpad">
            <div style="position: relative; width: 150px; height: 40px; cursor: default;"><canvas style="cursor: default;" height="40" width="150"></canvas></div></div>
    </div>
    <div class="content">
        <div id="zjl" style="display: none;" class="boxcontent boxwhite">
            <div class="box">
                <div class="title-red">
							<span>
								恭喜你中奖了
							</span>
                </div>
                <div class="Detail">
                    <p>
                        你中了：
								<span class="red">
									谢谢参与
								</span>
                    </p>
                    <p>
                        兑奖SN码：
								<span class="red" id="sncode">
									null
								</span>
                    </p>
                    <p class="red"></p>
                    <p>
                        <input name="" class="px" id="tel" value="" placeholder="用户请输入您的手机号" type="text">
                    </p>
                    <p>
                    </p><p>
                    <input class="pxbtn" name="提 交" id="save-btn" value="用户提交" type="button">
                </p>
                    <p>
                        <input name="" class="px" id="parssword" value="" placeholder="商家输入兑奖密码" type="password">
                    </p>
                    <p>
                        <input class="pxbtn" name="提 交" id="save-btnn" value="商家提交" type="button">
                    </p>
                </div>
            </div>
        </div>
        <div class="boxcontent boxwhite">
            <div class="box">
                <div class="title-brown">
							<span>
								奖项设置：
							</span>
                </div>
                <div class="Detail">
                    <p>
                        一等奖： 苹果手机8。奖品数量：60
                    </p>
                    <p>
                        二等奖： 苹果手机7 。奖品数量：100
                    </p>
                    <p>
                        三等奖： 苹果手机6 。奖品数量：200
                    </p>
                </div>
            </div>
        </div>
        <div class="boxcontent boxwhite">
            <div class="box">
                <div class="title-brown">
                    活动说明：
                </div>
                <div class="Detail">
                    <p class="red">
                        本次活动总共可以刮5次,你已经刮了0次,机会如果没用完重新进入本页面可以再刮!
                    </p>
                    <p>
                        亲，请点击进入刮刮奖活动页面，祝您好运哦！
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div style="clear: both;">
    </div>
</div>

<div class="window" id="windowcenter">
    <div id="title" class="title">消息提醒<span class="close" id="alertclose"></span></div>
    <div class="content">
        <div id="txt"></div>
        <input value="确定" id="windowclosebutton" name="确定" class="txtbtn" type="button">
    </div>
</div>
</html>

