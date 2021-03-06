<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>控制台 - 微信后台管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/kindeditor/themes/default/default.css" />
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


        <%@ include file="/WEB-INF/views/common/account_sidebar.jsp" %>
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
                    <li class="active">图文消息</li>
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
                            编辑文本自定义内容
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
                                            <form class="form-horizontal" id="form_add" role="form" action="<%=request.getContextPath()%>/admin/saveArticleReply" method="post" >

                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="keyword"> 关键词:</label>
                                                    <div class="col-sm-7">
                                                        <input id="keyword" class="col-xs-10 col-sm-5" name="keyword" value="${adminReply.keyword}" type="text" placeholder="关键词：促销">
                                                        <span class="badge badge-danger" style="margin-left:10px;margin-top: 5px">必填</span>
                                                    </div>
                                                </div>

                                                <div class="space-4"></div>


                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="title"> 标题：</label>
                                                    <div class="col-sm-7">
                                                        <input id="title" class="col-xs-10 col-sm-5" name="title" value="${adminReply.title}" type="text">
                                                        <span class="badge badge-danger" style="margin-left:10px;margin-top: 5px">必填</span>
                                                    </div>
                                                </div>

                                                <div class="space-4"></div>


                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="title"> 图文封面： </label>
                                                    <%--<div class="col-sm-7">--%>
                                                        <%--<input type="text" class="col-xs-10 col-sm-5" id="url3" value="" /> <input type="button" class="ke-edit" id="image3" value="选择图片" />--%>
                                                        <%--<span class="badge badge-danger" style="margin-left:10px;margin-top: 5px">必填</span>--%>
                                                    <%--</div>--%>
                                                    <div class="col-sm-7">
                                                        <img id="thumb_img"  src=""  style="max-height:100px; display:none;">
                                                        <input id="thumb" readonly type="text" name="picUrl"  value="" class="input-xlarge" readonly="readonly" data-rule-required="true" data-rule-url="true">
                                                        <span class="help-inline"><a class="btn btn-sm  btn-info" id="insertimage">选择图文封面</a></span>  建议大小(宽720高400)
                                                    </div>
                                                </div>

                                                <div class="space-4"></div>


                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="description"> 简介: </label>
                                                    <div class="col-sm-7">
                                                        <div>
                                                            <textarea id="description" class="autosize-transition form-control" name="description" style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 102px;">${adminReply.description}</textarea>
                                                        </div>
                                                        <span class="badge badge-danger" style="margin-left:10px;margin-top: 5px">必填</span>
                                                    </div>
                                                </div>

                                                <div class="space-4"></div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="msgtext"> 图文详细页内容：                                                        : </label>
                                                    <div class="col-sm-7">
                                                        <div>
                                                            <textarea id="msgtext" class="autosize-transition form-control" name="msgtext" style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 202px;">${adminReply.description}</textarea>
                                                            <span class="badge badge-danger" style="margin-left:10px;margin-top: 5px">必填</span>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="space-4"></div>

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
            <%--<div class="modal-header">--%>
            <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>--%>
            <%--<h4 class="modal-title" id="myModalLabel">复制此处token和url到腾讯平台绑定</h4>--%>
            <%--</div>--%>
            <div class="modal-body">
                <h4>保存成功</h4>
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

<script src="<%=request.getContextPath()%>/assets/kindeditor/kindeditor.js"></script>
<script src="<%=request.getContextPath()%>/assets/kindeditor/zh_CN.js"></script>

<script>

    $().ready(function() {


        KindEditor.ready(function (K) {
            var editor = K.editor({
                themeType: "simple",
                allowFileManager: true
            });
            K.create('#msgtext', {
                themeType : 'simple',
                allowImageUpload : false,
                afterBlur: function(){this.sync();},
                items : [
                    'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                    'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                    'insertunorderedlist', '|', 'emoticons', 'image', 'link']

            });

            K('#insertimage').click(function () {
                editor.loadPlugin('image', function () {
                    editor.plugin.imageDialog({
                        imageUrl: K('#thumb').val(),
                        showRemote:false,
                        clickFn: function (url, title, width, height, border, align) {
                            K('#thumb').val(url);
                            if (K('#thumb_img')) {
                                K('#thumb').hide();
                                K('#thumb_img').attr('src', url);
                                K('#thumb_img').show();
                            }
                            editor.hideDialog();
                        }
                    });
                });
            });
        });


        validator = $("#form_add").validate({
            rules: {
                keyword: {
                    required: true
                },
                msgtext:{
                    required: true
                }
            }
        });
        $("#submit_btn").click(function(){

            var flat = validator.form();

            if(flat){


                $("#form_add").submit();

                //ajax 提交表单
                <%--var keyword = $("#keyword").val();--%>
                <%--var msgtext = $("#msgtext").text();--%>
                <%--var title = $("#title").val();--%>
                <%--var picUrl = $("#thumb_img").attr("src");--%>
                <%--var description = $("#description").text();--%>


                <%--$.ajax({--%>
                    <%--type:'POST',--%>
                    <%--url : '<%=request.getContextPath()%>/admin/saveArticleReply',--%>
                    <%--data: {--%>
                        <%--keyword :keyword,--%>
                        <%--msgtext :msgtext,--%>
                        <%--picUrl :picUrl,--%>
                        <%--description :description,--%>
                        <%--title :title--%>
                    <%--},--%>
                    <%--success:function(result){--%>
                        <%--$("#myModal").modal('toggle');--%>
                    <%--}--%>
                <%--})--%>
            }
        });
        $('#myModal').on('hidden.bs.modal', function (e) {
            window.location.href = "<%= request.getContextPath()%>/admin/textReply";
        })

        $("#save").click(function(){
            $('#myModal').modal('hide')
        });

    });





</script>

</body>
</html>


