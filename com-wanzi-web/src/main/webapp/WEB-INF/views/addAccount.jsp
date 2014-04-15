<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>控制台 - 微信后台管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <%@include file="/WEB-INF/views/common/css.jsp" %>
</head>

<body>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>


        <%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
        <div class="main-content">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try {
                        ace.settings.check('breadcrumbs', 'fixed')
                    } catch (e) {
                    }
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home home-icon"></i>
                        <a href="<%=request.getContextPath()%>/admin/main">首页</a>
                    </li>
                    <li class="active">绑定公共账号</li>
                </ul>
                <!-- .breadcrumb -->

                <div class="nav-search" id="nav-search">
                    <form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input"
                                           id="nav-search-input" autocomplete="off"/>
									<i class="icon-search nav-search-icon"></i>
								</span>
                    </form>
                </div>
                <!-- #nav-search -->
            </div>

            <div class="page-content">

                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->

                        <div class="alert alert-block alert-success">
                            <button type="button" class="close" data-dismiss="alert">
                                <i class="icon-remove"></i>
                            </button>

                            <i class="icon-ok green"></i>
                            请填写以下信息绑定您的公共账号
                        </div>

                        <div class="row">
                            <div class="col-sm-12">
                                <div class="widget-box">
                                    <div class="widget-header">
                                        <h4>
                                            <i class="icon-dashboard"></i>
                                            Knob Input
                                        </h4>
                                    </div>

                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <form class="form-horizontal" id="form_add" role="form" >

                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="weixinName"> 公众号名称 </label>
                                                    <div class="col-sm-7">
                                                        <input id="weixinName" class="col-xs-10 col-sm-5" name="weixinName" type="text" placeholder="公众号名称">
                                                        <span class="badge badge-danger" style="margin-left:10px;margin-top: 5px">必填</span>
                                                    </div>
                                                </div>

                                                <div class="space-4"></div>

                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="weixinId"> 微信号 </label>
                                                    <div class="col-sm-7">
                                                        <input id="weixinId" class="col-xs-10 col-sm-5" name="weixinId" type="text" placeholder="微信号">
                                                        <span class="badge badge-danger" style="margin-left:10px;margin-top: 5px">必填</span>
                                                    </div>
                                                </div>

                                                <div class="space-4"></div>

                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="appId"> AppID </label>
                                                    <div class="col-sm-7">
                                                        <input id="appId" class="col-xs-10 col-sm-5" name="appId" type="text" placeholder="AppID">
                                                    </div>
                                                </div>

                                                <div class="space-4"></div>

                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="appSecret"> Appsecret </label>
                                                    <div class="col-sm-7">
                                                        <input id="appSecret" class="col-xs-10 col-sm-5" name="appSecret" type="text" placeholder="Appsecret">
                                                    </div>
                                                </div>


                                            </form>
                                            <div class="clearfix form-actions">
                                                <div class="col-md-offset-3 col-md-7">
                                                    <button class="btn btn-success" id="submit_btn">
                                                        <i class="icon-ok bigger-110"></i>
                                                        Submit
                                                    </button>
                                                    <button class="btn" type="reset">
                                                        <i class="icon-undo bigger-110"></i>
                                                        Reset
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /row -->

                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.page-content -->
        </div>
        <!-- /.main-content -->


        <!-- /#ace-settings-container -->
    </div>
    <!-- /.main-container-inner -->

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="icon-double-angle-up icon-only bigger-110"></i>
    </a>
</div>
<!-- /.main-container -->

<%--<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">--%>
<%--Launch demo modal--%>
<%--</button>--%>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">复制此处token和url到腾讯平台绑定</h4>
            </div>
            <div class="modal-body">
                <p>URL:<span id="acc_url"></span></p>
                <p>TOKEN:<span id="acc_token"></span></p>
            </div>
            <div class="modal-footer">
                <%--<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>--%>
                <button id="save" class="btn btn-primary">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<%@ include file="/WEB-INF/views/common/js.jsp" %>


<script src="<%=request.getContextPath()%>/assets/js/jquery.validate.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/message_cn.js"></script>
<script>

    $().ready(function() {

        validator = $("#form_add").validate({
            rules: {
                weixinName: {
                    required: true
                },
                weixinId:{
                    required: true
                }
            }
        });
        $("#submit_btn").click(function(){

            var flat = validator.form();

            if(flat){
                //ajax 提交表单
//                $("#form_add").submit();
                var weixinName = $("#weixinName").val();
                var weixinId = $("#weixinId").val();
                var appId = $("#appId").val();
                var appSecret = $("#appSecret").val();

                $.ajax({
                    type:'POST',
                    url : '<%=request.getContextPath()%>/admin/saveAccount',
                    data: {
                        weixinName :weixinName,
                        weixinId :weixinId,
                        appId :appId,
                        appSecret :appSecret
                    },
                    success:function(result){
                        $("#acc_url").text(result.url);
                        $("#acc_token").text(result.token);
                        $("#myModal").modal('toggle');
                    }
                })
            }
        });
        $('#myModal').on('hidden.bs.modal', function (e) {
            window.location.href = "<%= request.getContextPath()%>/admin/main";
        })

        $("#save").click(function(){
            $('#myModal').modal('hide')
        });

    });


</script>

</body>
</html>


