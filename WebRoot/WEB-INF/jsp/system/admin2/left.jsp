<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String pathl = request.getContextPath();
    String basePathl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+pathl+"/";
%>
<!-- 本页面涉及的js函数，都在head.jsp页面中     -->
<div class="sidebar-collapse">
    <ul class="nav" id="side-menu">
        <li class="nav-header">
            <div class="dropdown profile-element">
                <span><img alt="image" class="img-circle" src="static/hplus/img/profile_small.jpg" /></span>
                <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">${sessionUser.USERNAME}</strong></span>
                                <span class="text-muted text-xs block">${sessionUser.NAME}<b class="caret"></b></span> </span>
                </a>
                <ul class="dropdown-menu animated fadeInRight m-t-xs">
                    <%--<li><a class="J_menuItem" href="form_avatar.html">修改头像</a>
                    </li>
                    <li><a class="J_menuItem" href="profile.html">个人资料</a>
                    </li>--%>
                    <li><a class="J_menuItem" href="#">问题反馈</a>
                    </li>
                    <li><a class="J_menuItem" href="#">帮助解答</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="logout">安全退出</a>
                    </li>
                </ul>
            </div>
            <div class="logo-element">财务
            </div>
        </li>
        <li id="lm">
            <a style="cursor:pointer;" class="dropdown-toggle" onclick="zidian();">
                <i class="fa icon-list-alt"></i>
                <span>数据字典</span>
            </a>
        </li>
        <li id="lm">
            <a style="cursor:pointer;" class="dropdown-toggle" onclick="menu();">
                <i class="fa icon-list-alt"></i>
                <span>菜单管理</span>
            </a>
        </li>
        <c:forEach items="${menuList}" var="menu">
            <c:if test="${menu.hasMenu}">
                <li id="lm${menu.MENU_ID }">
                    <a style="cursor:pointer;" class="dropdown-toggle" >
                        <i class="fa ${menu.MENU_ICON == null ? 'fa-th' : menu.MENU_ICON}"></i>
                        <span>${menu.MENU_NAME }</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <c:forEach items="${menu.subMenu}" var="sub">
                            <c:if test="${sub.hasMenu}">
                                <c:choose>
                                    <c:when test="${not empty sub.MENU_URL}">
                                        <li id="z${sub.MENU_ID }">
                                            <a class="J_menuItem" style="cursor:pointer;" target="mainFrame" href="${sub.MENU_URL }" ><i class="icon-double-angle-right"></i>${sub.MENU_NAME }</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a href="javascript:void(0);"><i class="icon-double-angle-right"></i>${sub.MENU_NAME }</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                        </c:forEach>
                    </ul>
                </li>
            </c:if>
        </c:forEach>


    </ul>
    </div>

