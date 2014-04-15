<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <li class="active">关注时回复</li>
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
                        <h4 class="header green clearfix">
                            用户添加您的时候自动回复语
                        </h4>


                        <div class="row">

                            <div class="col-xs-6">
                                <div class="widget-box">
                                    <div class="widget-header">
                                        <h4>
                                            <i class="icon-tint"></i>
                                            关注时回复
                                        </h4>
                                    </div>

                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <div>
                                                <label for="sub_msg"><h5>自动回复类容:</h5></label>
                                                <textarea id="sub_msg" class="autosize-transition form-control" name="sub_msg" style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 202px;">${sub_msg}</textarea>
                                            </div>
                                            <button class="btn btn-sm btn-purple" id="submit_btn">
                                                <i class="icon-save bigger-125"></i>
                                                Save
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                        <!-- /row -->

                        <!-- /row -->

                        <!-- PAGE CONTENT ENDS -->
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
            <%--<div class="modal-footer">--%>
                <%--&lt;%&ndash;<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>&ndash;%&gt;--%>
                <%--<button id="save" class="btn btn-primary">确定</button>--%>
            <%--</div>---%>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- /.main-container -->

<%@ include file="/WEB-INF/views/common/js.jsp" %>
<script>
    $("#submit_btn").click(function(){


            //ajax 提交表单
            var sub_msg = $("#sub_msg").val();

            $.ajax({
                type:'POST',
                url : '<%=request.getContextPath()%>/admin/dosubscribe',
                data: {
                    sub_msg :sub_msg
                },
                success:function(result){
                    $("#myModal").modal('toggle');
                }
            })
    });
</script>
</body>
</html>



