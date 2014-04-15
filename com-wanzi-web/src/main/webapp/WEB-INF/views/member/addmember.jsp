<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />

    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/member/mc.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/member/dialog.css?v=20140319" />
    <%--<link rel="stylesheet" href="http://wxj.weixinjia.net/css/mobile/mc/font-awesome.css?v=20140319" />--%>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/member/js/jquery-1.7.2.min.js?v=20140319"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/member/js/main.js?v=20140319"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/member/js/dialog_min.js?v=20140319"></script>

    <%--<script type="text/javascript" src="http://wxj.weixinjia.net/js/mobile/mc/mymain.js?v=20140319"></script>--%>
    <title>会员卡</title>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=no,user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <meta name="format-detection" content="telephone=no"/>
    <style>
        .select {
            width: 100%;
        }

        .list_ul_card .forms dt {
            padding: 5px;
        }
    </style>
</head>
<body onselectstart="return true;" ondragstart="return false;">



<script>

    $().ready(function(){

        var sex='1';
        if(!isNaN(sex)){
            $('select[name="sex"]').val(sex);
        }
    });

    function submit1(){

        var form = document.getElementById("form1");

        if(form.name.value.length<2){
            alert("请输入姓名,不少于2个字符", 1500);
            return;
        }
        if(form.tel.value.length==0){
            alert("请输入正确的手机号", 1500);
            return;
        }

        //校验自定义字段
        var $defined=$('div#defined dl');
        if($defined.length>0){
            var validPass=true;
            $defined.each(function(index){
                var $self=$(this);
                var $el=$self.find('input').length>0?$(this).find('input'):$(this).find('select');
                if($el.attr('required') && (($el.is('input') && $el.val().length==0) || ($el.is('select') && $el.prop('selectedIndex')==0))){
                    var tipName=$self.find('dt').html();
                    tipName=tipName.substring(0,tipName.length-1);
                    alert("请输入"+tipName, 1500);
                    validPass=false;
                    return validPass;
                }
            });
            if(!validPass){
                return;
            }
        }

        loading(true);
        var name = $("#name").val();
        var tel = $("#tel").val();
        var sex = $("#sex").val();
        var qq = $("#qq").val();
        $.ajax({
            url: "<%=request.getContextPath()%>/saveMember",
            type:"POST",
            data:{
                name:name,
                tel:tel,
                sex:sex,
                qq:qq
            },
            success: function(res){
                loading(false);
                if(res == "success"){
                    alert("提交成功", 1500);
                    setTimeout(turnUrl(),1500);
                }else{
                    if(res == 'inValidPhone'){
                        alert('提交失败，该手机号码已被占用',1500);
                    }else{
                        alert('提交失败',1500);
                    }
                }
            }
        });

    }
    function turnUrl(){
        window.location.href = "<%=request.getContextPath()%>/member"
    }
</script>

<div class="container info_tx">
    <div class="body pt_10">
        <ul class="list_ul_card">
            <form id="form1" action="javascript:;" method="post">
                <li data-card><header class="center">
                    <label style="display: inline-block;"><span>&nbsp;</span>填写会员卡资料</label>
                </header>
                    <div class="forms">
                        <!-- 隐藏字段 -->
                        <input type="hidden" name="id" value="133764"/>
                        <input type="hidden" name="cardNum" value="293792"/>
                        <dl>
                            <dt>姓 名：</dt>
                            <dd>
                                <input type="text" id="name" name="name" placeholder="请输入姓名"
                                       maxlength="30" class="input" />
                            </dd>
                        </dl>
                        <dl>
                            <dt>手 机：</dt>
                            <dd>
                                <input type="text" id="tel" name="tel" placeholder="请输入手机号码"
                                       maxlength="30" class="input" />
                            </dd>
                        </dl>
                        <!-- 系统字段性别是否必填-->
                        <dl>
                            <dt>性别：</dt>
                            <dd>
                                <select id="sex" name="sex" class="select" >
                                    <option value="1">男</option>
                                    <option value="0">女</option>
                                </select>
                            </dd>
                        </dl>




                        <!-- 自定义字段-->
                        <div id="defined">

                            <dl>
                                <dt>QQ：</dt>
                                <dd>
                                    <input id="qq" type="text" name="qq" placeholder="请填写您的QQ号码"
                                           maxlength="80" class="input"   required="true"/>
                                </dd>
                            </dl>

                        </div>

                    </div></li>
                <ul class="add_op">
                    <li style="padding: 10px 0 0;"><a
                            href="javascript:submit1();" style="width: 100%;">提&nbsp;&nbsp;&nbsp;交</a>
                    </li>

                </ul>
            </form>
        </ul>
    </div>
</div>
<div mark="stat_code" style="width: 0px; height: 0px; display: none;">
</div>
</body>
</html>

