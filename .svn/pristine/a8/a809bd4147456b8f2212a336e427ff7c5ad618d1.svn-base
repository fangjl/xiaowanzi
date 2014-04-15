<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="sidebar" id="sidebar">
    <div class="sidebar-shortcuts" id="sidebar-shortcuts">
        <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
            <button class="btn btn-success">
                <i class="icon-signal"></i>
            </button>

            <button class="btn btn-info">
                <i class="icon-pencil"></i>
            </button>

            <button class="btn btn-warning">
                <i class="icon-group"></i>
            </button>

            <button class="btn btn-danger">
                <i class="icon-cogs"></i>
            </button>
        </div>

        <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
            <span class="btn btn-success"></span>

            <span class="btn btn-info"></span>

            <span class="btn btn-warning"></span>

            <span class="btn btn-danger"></span>
        </div>
    </div>
    <!-- #sidebar-shortcuts -->
    <ul class="nav nav-list">
        <li <c:if test="${sidebar=='main'}">class="active"</c:if>>
            <a href="<%=request.getContextPath()%>/admin/main">
                <i class="icon-dashboard"></i>
                <span class="menu-text"> 控制台 </span>
            </a>
        </li>
        <li <c:if test="${sidebar=='account'}">class="active"</c:if> >
            <a href="<%=request.getContextPath()%>/admin/account/detail/<%=request.getSession().getAttribute("accountId")%>">
                <i class="icon-user"></i>
                <span class="menu-text"> 公共号信息 </span>
            </a>
        </li>
        <li <c:if test="${sidebar=='subscribe'||sidebar=='default_reply'||sidebar=='keyword_text_reply'||sidebar=='keyword_article_reply'}">class="active"</c:if> >
            <a href="#" class="dropdown-toggle">
                <i class="icon-edit"></i>
                <span class="menu-text"> 自动回复 </span>
                <b class="arrow icon-angle-down"></b>
            </a>
                <ul class="submenu">
                    <li <c:if test="${sidebar=='subscribe'}">class="active"</c:if> >
                        <a href="<%=request.getContextPath()%>/admin/subscribe">
                            <i class="icon-double-angle-right"></i>
                            关注时回复
                        </a>
                    </li>
                    <li <c:if test="${sidebar=='default_reply'}">class="active"</c:if> >
                        <a href="<%=request.getContextPath()%>/admin/defaultReply">
                            <i class="icon-double-angle-right"></i>
                            默认回复
                        </a>
                    </li>
                    <li <c:if test="${sidebar=='keyword_text_reply'}">class="active"</c:if> >
                        <a href="<%=request.getContextPath()%>/admin/textReply">
                            <i class="icon-double-angle-right"></i>
                            文本回复
                        </a>
                    </li>
                    <li <c:if test="${sidebar=='keyword_article_reply'}">class="active"</c:if> >
                        <a href="<%=request.getContextPath()%>/admin/articleReply">
                            <i class="icon-double-angle-right"></i>
                            图文回复
                        </a>
                    </li>
                </ul>
            </a>
        </li>
        <li <c:if test="${sidebar=='menu'}">class="active"</c:if> >
            <a href="#">
                <i class="icon-list-alt"></i>
                <span class="menu-text"> 自定义菜单 </span>
            </a>
        </li>
        <li <c:if test="${sidebar=='messages'||sidebar=='replys'}">class="active"</c:if>>
            <a href="#" class="dropdown-toggle">
                <i class="icon-comment"></i>
                <span class="menu-text"> 微信消息 </span>

                <b class="arrow icon-angle-down"></b>
            </a>
            <ul class="submenu">
                <li <c:if test="${sidebar=='messages'}">class="active"</c:if> >
                    <a href="<%=request.getContextPath()%>/admin/messages">
                        <i class="icon-double-angle-right"></i>
                        接收消息
                    </a>
                </li>
                <li <c:if test="${sidebar=='replys'}">class="active"</c:if> >
                    <a href="<%=request.getContextPath()%>/admin/replys">
                        <i class="icon-double-angle-right"></i>
                        回复消息
                    </a>
                </li>
            </ul>
        </li>

    </ul><!--/.nav-list-->
    <div class="sidebar-collapse" id="sidebar-collapse">
        <i class="icon-double-angle-left"></i>
    </div>
</div>