<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>登录页面 - 微信后台功能</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- basic styles -->

    <link href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/font-awesome.min.css" />

    <!--[if IE 7]>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/font-awesome-ie7.min.css" />
    <![endif]-->

    <!-- page specific plugin styles -->

    <!-- fonts -->

    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />

    <!-- ace styles -->

    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/ace.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/ace-rtl.min.css" />

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/ace-ie.min.css" />
    <![endif]-->

    <!-- inline styles related to this page -->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!--[if lt IE 9]>
    <script src="<%=request.getContextPath()%>/assets/js/html5shiv.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/respond.min.js"></script>
    <![endif]-->
</head>

<body class="login-layout">
<div class="main-container">
<div class="main-content">
<div class="row">
<div class="col-sm-10 col-sm-offset-1">
<div class="login-container">
<div class="center">
    <h1>
        <i class="icon-leaf green"></i>
        <span class="red">微信</span>
        <span class="white">托管</span>
    </h1>
    <h4 class="blue">&copy;  <a href="http://weibo.com/2008205757" target="_blank">梅超同学</a></h4>
</div>

<div class="space-6"></div>

<div class="position-relative">
    <div id="login-box" class="login-box visible widget-box no-border">
        <div class="widget-body">
            <div class="widget-main">
                <c:if test="${message == null }">
                    <h4 class="header blue lighter bigger">
                        <i class="icon-coffee green"></i>
                        Please Enter Your Information
                    </h4>
                </c:if>
                <c:if test="${message != null }">
                    <h4 class="header red lighter bigger">
                        <i class="icon-coffee green"></i>
                        &nbsp;${message}
                    </h4>
                </c:if>

                <div class="space-6"></div>

                <form action="<%=request.getContextPath()%>/login" method="post" id="login" >
                    <fieldset>
                        <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" name="email" <c:if test="${email!=null}">value="${email}"</c:if> placeholder="Email" />
															<i class="icon-user"></i>
														</span>
                        </label>

                        <label class="block clearfix">
														<span class="block input-icon input-icon-right">
                                                            <input type="password" class="form-control" name="password" placeholder="Password" />
															<i class="icon-lock"></i>
														</span>
                        </label>

                        <div class="space"></div>

                        <div class="clearfix">
                            <label class="inline">
                                <input type="checkbox" class="ace" />
                                <span class="lbl"> Remember Me</span>
                            </label>

                            <button type="button" class="width-35 pull-right btn btn-sm btn-primary" id="loginButton">
                                <i class="icon-key"></i>
                                登陆
                            </button>
                        </div>

                        <div class="space-4"></div>
                    </fieldset>
                </form>

                <div class="social-or-login center">
                    <span class="bigger-110">Or Login Using</span>
                </div>

                <div class="social-login center">
                    <a class="btn btn-primary">
                        <i class="icon-facebook"></i>
                    </a>

                    <a class="btn btn-info">
                        <i class="icon-twitter"></i>
                    </a>

                    <a class="btn btn-danger">
                        <i class="icon-google-plus"></i>
                    </a>
                </div>
            </div><!-- /widget-main -->

            <div class="toolbar clearfix">
                <div>
                    <a href="#" onclick="show_box('forgot-box'); return false;" class="forgot-password-link">
                        <i class="icon-arrow-left"></i>
                        I forgot my password
                    </a>
                </div>

                <div>
                    <a href="#" onclick="show_box('signup-box'); return false;" class="user-signup-link">
                        I want to register
                        <i class="icon-arrow-right"></i>
                    </a>
                </div>
            </div>
        </div><!-- /widget-body -->
    </div><!-- /login-box -->

    <div id="forgot-box" class="forgot-box widget-box no-border">
        <div class="widget-body">
            <div class="widget-main">
                <h4 class="header red lighter bigger">
                    <i class="icon-key"></i>
                    Retrieve Password
                </h4>

                <div class="space-6"></div>
                <p>
                    Enter your email and to receive instructions
                </p>

                <form>
                    <fieldset>
                        <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="Email" />
															<i class="icon-envelope"></i>
														</span>
                        </label>

                        <div class="clearfix">
                            <button type="button" class="width-35 pull-right btn btn-sm btn-danger">
                                <i class="icon-lightbulb"></i>
                                Send Me!
                            </button>
                        </div>
                    </fieldset>
                </form>
            </div><!-- /widget-main -->

            <div class="toolbar center">
                <a href="#" onclick="show_box('login-box'); return false;" class="back-to-login-link">
                    Back to login
                    <i class="icon-arrow-right"></i>
                </a>
            </div>
        </div><!-- /widget-body -->a
    </div><!-- /forgot-box -->

    <div id="signup-box" class="signup-box widget-box no-border">
        <div class="widget-body">
            <div class="widget-main">
                <h4 class="header green lighter bigger">
                    <i class="icon-group blue"></i>
                    New User Registration
                </h4>

                <div class="space-6"></div>
                <p> Enter your details to begin: </p>

                <form action="<%=request.getContextPath()%>/req" id="req" method="post">
                    <fieldset>
                        <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" name="email" class="form-control required email" placeholder="Email" />
															<i class="icon-envelope"></i>
														</span>
                        </label>

                        <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" name="userName" placeholder="Username" />
															<i class="icon-user"></i>
														</span>
                        </label>

                        <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input id="password" type="password" class="form-control" name="password" placeholder="Password" />
															<i class="icon-lock"></i>
														</span>
                        </label>

                        <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input id="confirm_password" type="password" name="confirm_password" class="form-control"  placeholder="Repeat password" />
															<i class="icon-retweet"></i>
														</span>
                        </label>

                        <label class="block">
                            <input type="checkbox" class="ace" />
														<span class="lbl">
															I accept the
															<a href="#">User Agreement</a>
														</span>
                        </label>

                        <div class="space-24"></div>

                        <div class="clearfix">
                            <button type="reset" class="width-30 pull-left btn btn-sm">
                                <i class="icon-refresh"></i>
                                Reset
                            </button>
                            <%--onclick="document.getElementById('req').submit();"--%>
                            <button type="button" id="reqButton" class="width-65 pull-right btn btn-sm btn-success" >
                                Register
                                <i class="icon-arrow-right icon-on-right"></i>
                            </button>
                        </div>
                    </fieldset>
                </form>
            </div>

            <div class="toolbar center">
                <a href="#" onclick="show_box('login-box'); return false;" class="back-to-login-link">
                    <i class="icon-arrow-left"></i>
                    Back to login
                </a>
            </div>
        </div><!-- /widget-body -->
    </div><!-- /signup-box -->
</div><!-- /position-relative -->
</div>
</div><!-- /.col -->
</div><!-- /.row -->
</div>
</div><!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

<%--<script src="<%=request.getContextPath()%>/assets/js/jquery.metadata.js"></script>--%>

<!--[if !IE]> -->

<script type="text/javascript">
    window.jQuery || document.write("<script src='<%=request.getContextPath()%>/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

<script type="text/javascript">
    if("ontouchend" in document) document.write("<script src='<%=request.getContextPath()%>/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>

<script src="<%=request.getContextPath()%>/assets/js/jquery.validate.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/message_cn.js"></script>

<!-- inline scripts related to this page -->

<script type="text/javascript">
    function show_box(id) {
        jQuery('.widget-box.visible').removeClass('visible');
        jQuery('#'+id).addClass('visible');
    }
    $().ready(function() {

        login_val = $("#login").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                },
                password: {
                    required: true
                }
            }
        });

       validator = $("#req").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                },
                userName:{
                    required: true,
                    minlength: 2
                },
                password: {
                    required: true
                },
                confirm_password: {
                    equalTo: "input[id=password]"
                }
            }
        });
        $("#reqButton").click(function(){
           var flat = validator.form();
           if(flat){
               $("#req").submit();
           }
        });
        $("#loginButton").click(function(){
           var flat = login_val.form();
           if(flat){
               $("#login").submit();
           }
        });


    });

</script>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
