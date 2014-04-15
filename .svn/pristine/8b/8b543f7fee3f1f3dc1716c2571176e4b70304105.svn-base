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
                    <li class="active">${account.weixinName}</li>
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

                            欢迎使用微信后台管理系统.
                        </div>

                        <div class="row">

                            <div class="col-xs-6">
                                <div class="widget-box">
                                    <div class="widget-header">
                                        <h4>
                                            <i class="icon-tint"></i>
                                            详情
                                        </h4>
                                    </div>

                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <div class="row-fluid">
                                                <table  class="table table-striped table-bordered table-hover" id="sample-table-1">
                                                    <tr>
                                                        <td><h5><span>公众号名称:${account.weixinName}</span></h5></td>
                                                        <td><h5><span>微信号:${account.weixinId}</span></h5></td>
                                                        <td><h5><span>创建时间：${account.created}</span></h5></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h5><span>文本自定义：0</span></h5></td>
                                                        <td><h5><span>图文自定义：0</span></h5></td>
                                                        <td><h5><span>请求次数：0</span></h5></td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <c:if test="${account.appId != null}">
                            <div class="col-xs-6">
                                <div class="widget-box">
                                    <div class="widget-header">
                                        <h4>
                                            <i class="icon-tint"></i>
                                            Secret
                                        </h4>
                                    </div>

                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <div class="row-fluid">
                                                <h4><span>Url:</span></h4>
                                                <span>${account.url}</span>
                                                <h4><span>Token:</span></h4>
                                                <span>${account.token}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:if>


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
<!-- /.main-container -->

<%@ include file="/WEB-INF/views/common/js.jsp" %>

</body>
</html>



