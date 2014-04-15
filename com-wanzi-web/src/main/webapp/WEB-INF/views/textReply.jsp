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
                    <li class="active">自定义文本回复信息</li>
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
                            <div class="col-xs-12">
                                <p>
                                    <button id="bootbox-options" class="btn btn-success" onclick="window.location.href = '<%=request.getContextPath()%>/admin/addTextReply'">添加</button>
                                </p>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" id="sample-table-1">
                                        <thead>
                                        <tr>
                                            <th>编号</th>
                                            <th>关键词</th>
                                            <th>回复类容</th>
                                            <th>匹配类型</th>
                                            <th class="hidden-480">创建时间</th>
                                            <th class="hidden-480">操作</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach items="${adminReplies}"  var="ac"   varStatus="st" >
                                            <tr>
                                                <td>${st.index+1}</td>
                                                <td class="hidden-480">${ac.keyword}</td>
                                                <td class="hidden-480">${ac.msgtext}</td>
                                                <td class="hidden-480">
                                                    <c:if test="${ac.status==0}">
                                                        <span class="label label-sm label-success">完全</span>
                                                    </c:if>
                                                </td>
                                                <td class="hidden-480">${ac.created}</td>
                                                <td>
                                                    <div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
                                                        <a class="blue" href="<%=request.getContextPath()%>/admin/text/detail/${ac.id}" title="查看">
                                                            <i class="icon-zoom-in bigger-130"></i>
                                                        </a>
                                                        <a class="red account_delete"  href="#" data-url="<%=request.getContextPath()%>/admin/text/delete/${ac.id}" title="删除">
                                                            <i class="icon-trash bigger-130"></i>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                        </tbody>
                                    </table>
                                </div><!-- /.table-responsive -->
                            </div><!-- /span -->
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
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">亲，确定要这么做么</h4>
                </div>
                <div class="modal-body">
                    <p>您确定要删除此文本消息么?</p>
                </div>
                <div class="modal-footer">
                    <button id="cancel" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button id="save" class="btn btn-primary">确定</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <input type="hidden" value="" id="deleteUrl">
    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="icon-double-angle-up icon-only bigger-110"></i>
    </a>
</div>
<!-- /.main-container -->

<%@ include file="/WEB-INF/views/common/js.jsp" %>

<script>
    $(".account_delete").click(function(){
        var url = $(this).attr("data-url");
        $("#deleteUrl").val("");
        $("#deleteUrl").val(url);
        $('#myModal').modal('show')
    });
    $("#cancel").click(function(){
        $('#myModal').modal('hide');
    });
    $("#save").click(function(){
        $('#myModal').modal('hide');
        window.location.href = $("#deleteUrl").val();
    });
</script>

</body>
</html>


