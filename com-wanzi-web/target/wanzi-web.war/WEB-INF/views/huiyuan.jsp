<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Flat UI Free</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Loading Bootstrap -->
    <%--<link href="bootstrap/css/bootstrap.css" rel="stylesheet">--%>
    <link href="<%=request.getContextPath()%>/assets/flat-ui/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <%--<link href="<%=request.getContextPath()%>/assets/css/bootstrap-responsive.min.css" rel="stylesheet" />--%>

    <!-- Loading Flat UI -->
    <link href="<%=request.getContextPath()%>/assets/flat-ui/css/flat-ui.css" rel="stylesheet">

    <%--<link rel="shortcut icon" href="images/favicon.ico">--%>

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body>


<header>


    <nav class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Menu</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Tmaic</a>
        </div>


        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Team</a></li>
                <li><a href="#">Contacts</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>

</header>
<!-- /.header -->

<section>

    <div class="jumbotron">
        <%--<h1>会员信息</h1>--%>
        <p>
            请先绑定会员
        </p>
        <input type="text" placeholder="姓名" class="form-control" />
        <input type="text" placeholder="手机" class="form-control" />
        <button id="submit" class="btn btn-embossed btn-primary" data-loading-text="正在保存...">
            保存
        </button>
        <%--<button type="button" data-loading-text="正在加载..." class="btn btn-primary">--%>
        <%--Loading state--%>
        <%--</button>--%>
    </div>

</section>








<!-- Load JS here for greater good =============================-->
<script src="<%=request.getContextPath()%>/assets/flat-ui/js/jquery-1.8.3.min.js"></script>
<%--<script src="<%=request.getContextPath()%>/assets/flat-ui/js/jquery-ui-1.10.3.custom.min.js"></script>--%>
<%--<script src="<%=request.getContextPath()%>/assets/flat-ui/js/jquery.ui.touch-punch.min.js"></script>--%>
<script src="<%=request.getContextPath()%>/assets/flat-ui/js/bootstrap.min.js"></script>
<%--<script src="<%=request.getContextPath()%>/assets/flat-ui/js/bootstrap-select.js"></script>--%>
<%--<script src="<%=request.getContextPath()%>/assets/flat-ui/js/bootstrap-switch.js"></script>--%>
<%--<script src="<%=request.getContextPath()%>/assets/flat-ui/js/flatui-checkbox.js"></script>--%>
<%--<script src="<%=request.getContextPath()%>/assets/flat-ui/js/flatui-radio.js"></script>--%>
<%--<script src="<%=request.getContextPath()%>/assets/flat-ui/js/jquery.tagsinput.js"></script>--%>
<%--<script src="<%=request.getContextPath()%>/assets/flat-ui/js/jquery.placeholder.js"></script>--%>
<script>
    var $submit = $("#submit");
    $submit.click(function(){
        $submit.text("正在保存...")
    });

</script>
</body>
</html>