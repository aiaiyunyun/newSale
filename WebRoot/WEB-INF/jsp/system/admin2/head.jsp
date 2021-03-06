<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
%>
<div id="page-wrapper" class="gray-bg dashbard-1">
    <div class="row border-bottom">
        <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="JavaScript:void(0);"><i class="fa fa-bars"></i> </a>
                <%--<form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                    <div class="form-group">
                        <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
                    </div>
                </form>--%>
            </div>
            <ul class="nav navbar-top-links navbar-right">

                <li class="dropdown">
                    <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell"></i> <span class="label label-primary">${msgNum}</span>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <c:forEach items="${msgList}" var="var">
                            <li>
                                <a href="/remind/goView.do?RD_ID=${var.RU_ID}&RU_ID=${var.RU_ID}" class="J_menuItem"  target="mainFrame" style="cursor:pointer;">
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i>
                                        <c:if test="${fn:length(var.RD_TITLE)>12 }">${ fn:substring( var.RD_TITLE ,0,12)} ...</c:if>
                                        <c:if test="${fn:length(var.RD_TITLE)<=12 }">${  var.RD_TITLE }</c:if>
                                        <span class="pull-right text-muted small">
                                            <fmt:formatDate value="${var.RD_CREATE_TIME}"  pattern="MM/dd HH:mm"></fmt:formatDate>
                                        </span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                        </c:forEach>

                        <li>
                            <div class="text-center link-block">
                                <a class="J_menuItem" href="/sales/input">
                                    <strong>待办提醒 </strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
    <div class="row content-tabs">
        <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
        </button>
        <nav class="page-tabs J_menuTabs">
            <div class="page-tabs-content">
                <a href="javascript:;" class="active J_menuTab" data-id="index_v1.html">首页</a>
            </div>
        </nav>
        <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
        </button>
        <div class="btn-group roll-nav roll-right">
            <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

            </button>
            <ul role="menu" class="dropdown-menu dropdown-menu-right">
                <li class="J_tabShowActive"><a>定位当前选项卡</a>
                </li>
                <li class="divider"></li>
                <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                </li>
                <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                </li>
            </ul>
        </div>
        <a href="logout" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
    </div>
    <div class="row J_mainContent" id="content-main">
        <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="index_v1.html" frameborder="0" data-id="index_v1.html" seamless></iframe>
    </div>
    <div class="footer">
        <div class="pull-right">&copy; 2016-2017 <a href="http://lsege.com/" target="_blank">北京化工研究院</a>
        </div>
    </div>
</div>
<!--引入属于此页面的js -->
<script type="text/javascript" src="static/js/myjs/head.js"></script>