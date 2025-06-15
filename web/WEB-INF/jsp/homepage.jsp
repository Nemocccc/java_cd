<%--
  Created by IntelliJ IDEA.
  User: nemo
  Date: 2025/6/14
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>综合服务学工平台</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />

    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <script src="/layui_exts/excel.js"></script>

    <style>
        /* ========== 全局样式重置 ========== */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            color: #2d3748;
            line-height: 1.6;
            overflow-x: hidden;
        }

        /* ========== 顶部导航栏 ========== */
        .container {
            background: linear-gradient(135deg, #2d3748 0%, #4a5568 100%);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
            padding: 12px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: relative;
            z-index: 1000;
            height: 60px;
        }

        .left-section {
            display: flex; /* 使用 Flexbox */
            justify-content: flex-start; /* 水平对齐方式 */
            align-items: center; /* 垂直对齐方式 */
            width: 300px; /* 容器宽度 */
        }

        .logo a {
            color: white;
            font-size: 22px;
            font-weight: 700;
            text-decoration: none;
            letter-spacing: 1px;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
            transition: all 0.3s ease;
        }

        .logo a:hover {
            text-shadow: 0 0 12px rgba(255, 255, 255, 0.6);
        }

        .left_open {
            background: transparent;
            border: none;
            border-radius: 0px;
            padding: 0px;
            cursor: pointer;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
        }

        .left_open:hover {
            transform: translateY(-2px);
        }

        .left_open i {
            color: white;
            font-size: 16px;
        }

        /* 修复导航栏布局 */
        .layui-nav.right {
            background: transparent;
            margin: 0;
            padding: 0;
        }

        .layui-nav .layui-nav-item {
            margin-left: 10px;
        }

        .layui-nav .layui-nav-item a {
            color: rgba(255, 255, 255, 0.9) !important;
            font-weight: 500;
            transition: all 0.3s ease;
            border-radius: 8px;
            padding: 6px 12px !important;
            font-size: 14px;
        }

        .layui-nav .layui-nav-item a:hover {
            color: white !important;
            background: rgba(255, 255, 255, 0.1) !important;
            text-shadow: 0 0 8px rgba(255, 255, 255, 0.5);
        }

        .layui-nav-img {
            border-radius: 50%;
            border: 2px solid rgba(255, 255, 255, 0.3);
            width: 28px;
            height: 28px;
            margin-right: 8px;
        }

        .to-index a {
            background: rgba(255, 255, 255, 0.1) !important;
            border-radius: 8px !important;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2) !important;
        }

        .to-index a:hover {
            background: rgba(255, 255, 255, 0.2) !important;
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }

        /* ========== 左侧导航菜单 ========== */
        .left-nav {
            background: linear-gradient(180deg, #2d3748 0%, #1a202c 100%);
            width: 240px;
            height: calc(100vh - 60px);
            position: fixed;
            top: 60px;
            left: 0;
            z-index: 999;
            box-shadow: 4px 0 20px rgba(0, 0, 0, 0.15);
            overflow-y: auto;
            border-radius: 0 15px 0 0;
        }

        .left-nav::-webkit-scrollbar {
            width: 6px;
        }

        .left-nav::-webkit-scrollbar-track {
            background: rgba(255, 255, 255, 0.1);
        }

        .left-nav::-webkit-scrollbar-thumb {
            background: rgba(255, 255, 255, 0.3);
            border-radius: 3px;
        }

        #side-nav {
            padding: 20px 0;
        }

        #nav > li > a {
            color: rgba(255, 255, 255, 0.9);
            padding: 16px 20px;
            display: flex;
            align-items: center;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            border-left: 4px solid transparent;
            margin: 1px 0;
            font-size: 14px;
        }

        #nav > li > a:hover {
            background: rgba(255, 255, 255, 0.1);
            color: white;
            border-left-color: white;
            text-shadow: 0 0 8px rgba(255, 255, 255, 0.3);
            transform: translateX(4px);
        }

        #nav > li > a i {
            margin-right: 10px;
            font-size: 16px;
            width: 18px;
            text-align: center;
        }

        .nav_right {
            margin-left: auto;
            transition: transform 0.3s ease;
        }

        #nav > li:hover .nav_right {
            transform: rotate(90deg);
        }

        .sub-menu {
            background: rgba(0, 0, 0, 0.2);
            display: none;
            border-radius: 0 0 10px 10px;
            margin: 0 10px;
            overflow: hidden;
        }

        .sub-menu li a {
            color: rgba(255, 255, 255, 0.8);
            padding: 12px 20px 12px 50px;
            display: block;
            text-decoration: none;
            font-size: 13px;
            transition: all 0.3s ease;
            border-left: 4px solid transparent;
            position: relative;
        }

        .sub-menu li a::before {
            content: '';
            position: absolute;
            left: 42px;
            top: 50%;
            transform: translateY(-50%);
            width: 3px;
            height: 3px;
            background: rgba(255, 255, 255, 0.5);
            border-radius: 50%;
            transition: all 0.3s ease;
        }

        .sub-menu li a:hover {
            background: rgba(255, 255, 255, 0.1);
            color: white;
            border-left-color: white;
            transform: translateX(6px);
        }

        .sub-menu li a:hover::before {
            background: white;
            transform: translateY(-50%) scale(1.5);
        }

        .sub-menu li a i {
            margin-right: 6px;
            font-size: 12px;
        }

        /* ========== 主内容区域 ========== */
        .page-content {
            padding: 15px;
            min-height: calc(100vh - 60px);
            background: transparent;
            transition: margin-left 0.3s ease;
        }

        .layui-tab {
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(0, 0, 0, 0.05);
            overflow: hidden;
            backdrop-filter: blur(10px);
        }

        .layui-tab-title {
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
            border-bottom: 2px solid #e2e8f0;
            padding: 0 20px;
            overflow-x: auto;
            overflow-y: hidden;
            white-space: nowrap;
            display: flex;
            align-items: center;
        }

        .layui-tab-title::-webkit-scrollbar {
            height: 4px;
        }

        .layui-tab-title::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        .layui-tab-title::-webkit-scrollbar-thumb {
            background: #c1c1c1;
            border-radius: 2px;
        }

        .layui-tab-title li {
            color: #4a5568;
            font-weight: 600;
            padding: 14px 20px;
            transition: all 0.3s ease;
            border-radius: 10px 10px 0 0;
            margin-right: 6px;
            font-size: 14px;
            position: relative;
            display: inline-block;
            white-space: nowrap;
            cursor: pointer;
            flex-shrink: 0;
        }

        .layui-tab-title li.layui-this {
            background: #fff url(#) 0 0 no-repeat;
            color: #2d3748;
            box-shadow: 0 -6px 20px rgba(0, 0, 0, 0.1);
            transform: translateY(-2px);
        }

        .layui-tab-title li:hover:not(.layui-this) {
            background: rgba(126, 121, 121, 0.8);
            color: #2d3748;
        }

        /* 标签页关闭按钮 */
        .layui-tab-close {
            margin-left: 8px;
            color: #999 !important;
            transition: all 0.3s ease;
            display: inline-block;
            width: 16px;
            height: 16px;
            line-height: 14px;
            text-align: center;
            border-radius: 50%;
            font-size: 12px;
            cursor: pointer;
        }

        .layui-tab-close:hover {
            background: rgba(229, 62, 62, 0.1) !important;
            color: #e53e3e !important;
        }

        /* 主页标签特殊样式 - 不能关闭 */

        .layui-tab-title li.home .layui-tab-close {
            display: none;
        }

        /* iframe样式 */
        .layui-tab-content iframe {
            width: 100%;
            height: 100%;
            border: none;
            background: white;
        }

        .layui-tab-item {
            padding: 0;
            height: calc(100vh - 150px);
        }

        /* ========== 欢迎区域样式 ========== */
        .welcome-section {
            text-align: center;
            padding: 50px 30px;
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.9) 0%, rgba(248, 250, 252, 0.9) 100%);
            border-radius: 15px;
            margin: 30px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
        }

        .welcome-title {
            font-size: 28px;
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 12px;
            letter-spacing: 1px;
        }

        .welcome-subtitle {
            font-size: 16px;
            color: #4a5568;
            margin-bottom: 30px;
            font-weight: 500;
        }

        /* ========== 个人信息卡片 ========== */
        .info-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
            padding: 25px;
            margin: 15px 30px;
            border: 1px solid rgba(0, 0, 0, 0.05);
            backdrop-filter: blur(10px);
        }

        .card-header {
            color: #2d3748;
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 20px;
            padding-bottom: 12px;
            border-bottom: 2px solid #e2e8f0;
            text-align: center;
        }

        .card-body {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
        }

        .info-item {
            padding: 12px 16px;
            background: linear-gradient(135deg, #f8fafc 0%, #edf2f7 100%);
            border-radius: 10px;
            border-left: 3px solid #2d3748;
            transition: all 0.3s ease;
            border: 1px solid #e2e8f0;
        }

        .info-item:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            border-left-color: #4a5568;
        }

        .info-label {
            font-size: 12px;
            color: #4a5568;
            font-weight: 600;
            margin-bottom: 3px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .info-value {
            font-size: 14px;
            color: #2d3748;
            font-weight: 600;
        }

        /* ========== 底部样式 ========== */
        .footer {
            background: linear-gradient(135deg, #2d3748 0%, #4a5568 100%);
            color: rgba(255, 255, 255, 0.9);
            text-align: center;
            padding: 15px;
            border-radius: 15px 15px 0 0;
        }

        .copyright {
            font-size: 13px;
            font-weight: 500;
        }

        /* ========== 响应式设计 ========== */
        @media (max-width: 1200px) {
            .left-nav {
                width: 200px;
            }
            
            .page-content,
            .footer {
                margin-left: 200px;
            }
        }

        @media (max-width: 768px) {
            .left-nav {
                transform: translateX(-100%);
                transition: transform 0.3s ease;
            }
            
            .page-content,
            .footer {
                margin-left: 0;
            }
            
            .welcome-section,
            .info-card {
                margin: 15px;
                padding: 20px;
            }
            
            .welcome-title {
                font-size: 22px;
            }
            
            .card-body {
                grid-template-columns: 1fr;
            }
        }

        /* ========== 动画效果 ========== */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .welcome-section {
            animation: fadeInUp 0.6s ease-out;
        }

        .info-card {
            animation: fadeInUp 0.6s ease-out;
            animation-delay: 0.2s;
            animation-fill-mode: both;
        }

        .info-item {
            animation: fadeInUp 0.5s ease-out;
            animation-fill-mode: both;
        }

        .info-item:nth-child(1) { animation-delay: 0.3s; }
        .info-item:nth-child(2) { animation-delay: 0.4s; }
        .info-item:nth-child(3) { animation-delay: 0.5s; }
        .info-item:nth-child(4) { animation-delay: 0.6s; }

        /* 隐藏原有样式 */
        .o_div {
            background: none !important;
        }

        .o_span {
            display: none;
        }

        .layui-col-md6 {
            display: none;
        }
    </style>
</head>
<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="left-section">
        <div class="logo"><a href="">综合服务学工平台</a></div>
        <div class="left_open">
            <i title="展开左侧栏" class="iconfont">&#xe699;</i>
        </div>
    </div>
    
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;"><img src="http://m.zhengjinfan.cn/images/0.jpg" class="layui-nav-img">${sessionScope.ad.a_username}</a>
            <dl class="layui-nav-child">
                <dd><a onclick="x_admin_show('切换帐号','loginOut')">切换帐号</a></dd>
                <dd><a href="/loginOut">退出</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index"><a href="/loginOut">前台首页</a></li>
    </ul>
</div>
<!-- 顶部结束 -->

<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>学生管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="/findStudent">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>学生信息</cite>
                        </a>
                    </li >
                </ul>
            </li>

            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>班级管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="/findClass">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>班级列表</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="/findClassStudent">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>班级学生</cite>
                        </a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#59095;</i>
                    <cite>宿舍管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="/findDormitory">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>宿舍列表</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="/findDormitoryStudent">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>人员信息</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="/findDormRepair">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>维修登记</cite>
                        </a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#59042;</i>
                    <cite>卫生管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="/findDormClean">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>宿舍卫生</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="/findStudentClean">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>学生卫生</cite>
                        </a>
                    </li>
                </ul>
            </li>
            
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe726;</i>
                    <cite>管理员管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="/findAdmin">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>管理员列表</cite>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<!-- 左侧菜单结束 -->

<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="true">
        <ul class="layui-tab-title">
            <li class="home layui-this" lay-id="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <!-- 欢迎区域 -->
                <div class="welcome-section">
                    <div class="welcome-title">${sessionScope.ad.a_username} 管理员</div>
                    <div class="welcome-subtitle">欢迎来到综合服务学工平台</div>
                </div>

                <!-- 个人信息卡片 -->
                <div class="info-card">
                    <div class="card-header">个人信息</div>
                    <div class="card-body">
                        <div class="info-item">
                            <div class="info-label">用户名</div>
                            <div class="info-value">${sessionScope.ad.a_username}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">姓名</div>
                            <div class="info-value">${sessionScope.ad.a_name}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">联系电话</div>
                            <div class="info-value">${sessionScope.ad.a_phone}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">级别描述</div>
                            <div class="info-value">${sessionScope.ad.a_describe}</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="page-content-bg"></div>
<!-- 右侧主体结束 -->

<!-- 底部开始 -->
<div class="footer">
    <div class="copyright">Copyright ©2019-2020 版权所有</div>
</div>
<!-- 底部结束 -->

<script>
    layui.config({
        base: 'layui_exts/',
    }).extend({
        excel: 'excel',
    });

    layui.use(['element'], function(){
        var element = layui.element;
        
        // 监听标签页切换
        element.on('tab(xbs_tab)', function(data){
            console.log('切换了：', this, data.elem, data.index);
        });
        
        // 监听标签页删除
        element.on('tabDelete(xbs_tab)', function(data){
            console.log('删除了：', this, data.elem, data.index);
            var tabId = $(this).attr('lay-id');
            if (tabId && openTabs[tabId]) {
                delete openTabs[tabId];
            }
        });
    });

    // 全局变量存储已打开的标签页
    var openTabs = {};
    var tabIndex = 0;
    var menuEventBound = false; // 添加标志防止重复绑定

    // 添加标签页函数
    function x_admin_add_tab(title, url, id) {
        // 检查是否已经存在该URL的标签页
        for (var existingId in openTabs) {
            if (openTabs[existingId].url === url) {
                // 如果已存在，直接切换到该标签页
                layui.use(['element'], function(){
                    var element = layui.element;
                    element.tabChange('xbs_tab', existingId);
                });
                return;
            }
        }
        
        // 生成新的唯一ID
        if (!id) {
            id = 'tab_' + (++tabIndex);
        }
        
        // 添加新标签页
        layui.use(['element'], function(){
            var element = layui.element;
            
            // 添加标签页
            element.tabAdd('xbs_tab', {
                title: title + '<span class="layui-tab-close">×</span>',
                content: '<iframe src="' + url + '" frameborder="0" style="width:100%;height:100%;"></iframe>',
                id: id
            });
            
            // 切换到新标签页
            element.tabChange('xbs_tab', id);
            
            // 记录已打开的标签页
            openTabs[id] = {
                title: title,
                url: url
            };
        });
    }

    // 菜单交互效果和跳转功能
    document.addEventListener('DOMContentLoaded', function() {
        // 防止重复绑定事件
        if (menuEventBound) return;
        menuEventBound = true;

        const menuItems = document.querySelectorAll('#nav > li > a');
        const subMenus = document.querySelectorAll('.sub-menu');
        
        menuItems.forEach((item, index) => {
            item.addEventListener('click', function(e) {
                e.preventDefault();
                
                // 关闭其他子菜单
                subMenus.forEach((menu, menuIndex) => {
                    if (menuIndex !== index) {
                        menu.style.display = 'none';
                    }
                });
                
                // 切换当前子菜单
                const currentSubMenu = subMenus[index];
                if (currentSubMenu) {
                    currentSubMenu.style.display = 
                        currentSubMenu.style.display === 'block' ? 'none' : 'block';
                }
            });
        });

        // 子菜单点击跳转功能 - 使用事件委托避免重复绑定
        document.addEventListener('click', function(e) {
            const target = e.target.closest('.sub-menu a[_href]');
            if (target) {
                e.preventDefault();
                const href = target.getAttribute('_href');
                const title = target.querySelector('cite').textContent;
                
                // 使用标签页跳转
                x_admin_add_tab(title, href);
            }
        });

        // 左侧菜单收缩功能
        const leftOpen = document.querySelector('.left_open');
        const leftNav = document.querySelector('.left-nav');
        const pageContent = document.querySelector('.page-content');
        const footer = document.querySelector('.footer');
        
        if (leftOpen) {
            leftOpen.addEventListener('click', function() {
                if (leftNav.style.transform === 'translateX(-100%)') {
                    leftNav.style.transform = 'translateX(0)';
                    pageContent.style.marginLeft = '240px';
                    footer.style.marginLeft = '240px';
                } else {
                    leftNav.style.transform = 'translateX(-100%)';
                    pageContent.style.marginLeft = '0';
                    footer.style.marginLeft = '0';
                }
            });
        }
    });

    // 标签页关闭按钮事件 - 使用事件委托
    document.addEventListener('click', function(e) {
        if (e.target.classList.contains('layui-tab-close')) {
            e.preventDefault();
            e.stopPropagation();
            
            const tabItem = e.target.closest('li');
            const tabId = tabItem.getAttribute('lay-id');
            
            // 不允许关闭主页标签
            if (tabId === 'home' || tabItem.classList.contains('home')) {
                return false;
            }
            
            // 删除标签页
            if (tabId) {
                layui.use(['element'], function(){
                    var element = layui.element;
                    element.tabDelete('xbs_tab', tabId);
                });
                
                // 从记录中删除
                if (openTabs[tabId]) {
                    delete openTabs[tabId];
                }
            }
            
            return false;
        }
        
        // 处理标签页标题点击
        if (e.target.closest('.layui-tab-title li') && !e.target.classList.contains('layui-tab-close')) {
            const tabItem = e.target.closest('li');
            const tabId = tabItem.getAttribute('lay-id');
            if (tabId) {
                layui.use(['element'], function(){
                    var element = layui.element;
                    element.tabChange('xbs_tab', tabId);
                });
            }
        }
    });
</script>
</body>
</html>
