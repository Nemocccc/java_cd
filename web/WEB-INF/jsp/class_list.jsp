<%--
  Created by IntelliJ IDEA.
  User: 邓成杰
  Date: 2025/6/2
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  import="com.itheima.po.Class" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>班级管理</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />

    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script src="/layui_exts/excel.js"></script>

    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif;
            background: #f8f9fa;
            color: #212529;
            line-height: 1.6;
        }

        /* 顶部导航 */
        .top-nav {
            background: #ffffff;
            padding: 16px 24px;
            border-bottom: 1px solid #e9ecef;
            margin-bottom: 24px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .breadcrumb {
            display: flex;
            align-items: center;
            gap: 8px;
            color: #6c757d;
            font-size: 14px;
        }

        .breadcrumb a {
            color: #212529;
            text-decoration: none;
            font-weight: 500;
        }

        .breadcrumb a:hover {
            color: #495057;
        }

        .refresh-btn {
            padding: 8px 16px;
            background: #212529;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            transition: background 0.3s ease;
        }

        .refresh-btn:hover {
            background: #495057;
        }

        /* 主体容器 */
        .main-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 24px;
        }

        /* 搜索区域 */
        .search-section {
            background: #ffffff;
            padding: 24px;
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
            margin-bottom: 24px;
        }

        .search-form {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 16px;
            align-items: end;
        }

        .form-input {
            padding: 12px 16px;
            border: 2px solid #e9ecef;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.3s ease;
            outline: none;
        }

        .form-input:focus {
            border-color: #212529;
        }

        .search-btn {
            padding: 12px 20px;
            background: #212529;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            transition: background 0.3s ease;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .search-btn:hover {
            background: #495057;
        }

        /* 操作按钮区域 */
        .action-section {
            background: #ffffff;
            padding: 20px 24px;
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
            margin-bottom: 24px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .action-buttons {
            display: flex;
            gap: 12px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .btn-primary {
            background: #212529;
            color: white;
        }

        .btn-primary:hover {
            background: #495057;
            transform: translateY(-1px);
        }

        .btn-secondary {
            background: #6c757d;
            color: white;
        }

        .btn-secondary:hover {
            background: #5a6268;
            transform: translateY(-1px);
        }

        .data-count {
            color: #6c757d;
            font-size: 14px;
        }

        /* 表格样式 */
        .table-section {
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
            overflow: hidden;
            margin-bottom: 24px;
        }

        .modern-table {
            width: 100%;
            border-collapse: collapse;
        }

        .modern-table th {
            background: #f8f9fa;
            padding: 16px 20px;
            text-align: left;
            font-weight: 600;
            color: #495057;
            border-bottom: 2px solid #e9ecef;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .modern-table td {
            padding: 16px 20px;
            border-bottom: 1px solid #f1f3f4;
            color: #212529;
            vertical-align: middle;
        }

        .modern-table tr:hover {
            background: #f8f9fa;
        }

        /* 操作按钮 */
        .action-icons {
            display: flex;
            gap: 8px;
        }

        .icon-btn {
            width: 32px;
            height: 32px;
            border-radius: 6px;
            border: none;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
            text-decoration: none;
        }

        .edit-btn {
            background: #e9ecef;
            color: #495057;
        }

        .edit-btn:hover {
            background: #212529;
            color: white;
        }

        .delete-btn {
            background: #e9ecef;
            color: #495057;
        }

        .delete-btn:hover {
            background: #dc3545;
            color: white;
        }

        /* 模态框样式 */
        .modal-form {
            padding: 24px;
        }

        .modal-form .form-group {
            margin-bottom: 20px;
        }

        .modal-form .form-label {
            display: block;
            margin-bottom: 6px;
            font-weight: 500;
            color: #495057;
            font-size: 14px;
        }

        .modal-form .form-input {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid #e9ecef;
            border-radius: 8px;
            font-size: 14px;
        }

        .modal-form .form-actions {
            display: flex;
            gap: 12px;
            justify-content: flex-end;
            margin-top: 24px;
        }

        /* 分页区域 */
        .pagination-section {
            background: #ffffff;
            padding: 20px 24px;
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
        }

        /* 分页内容样式 */
        .pagination-wrapper {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 16px;
        }

        .pagination-info {
            color: #6c757d;
            font-size: 14px;
        }

        .pagination-controls {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .pagination-controls a,
        .pagination-controls span {
            padding: 8px 12px;
            border-radius: 6px;
            text-decoration: none;
            color: #495057;
            font-size: 14px;
            transition: all 0.3s ease;
            border: 1px solid #e9ecef;
            background: #ffffff;
        }

        .pagination-controls a:hover {
            background: #f8f9fa;
            border-color: #dee2e6;
        }

        .pagination-controls .current {
            background: #212529;
            color: white;
            border-color: #212529;
        }

        .pagination-jump {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .pagination-jump input {
            width: 60px;
            padding: 6px 8px;
            border: 1px solid #e9ecef;
            border-radius: 4px;
            text-align: center;
            font-size: 14px;
        }

        .pagination-jump button {
            padding: 6px 12px;
            background: #212529;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 12px;
        }

        .pagination-jump button:hover {
            background: #495057;
        }

        /* 每页显示数量选择器 */
        .page-size-selector {
            display: flex;
            align-items: center;
            gap: 8px;
            color: #6c757d;
            font-size: 14px;
        }

        .page-size-selector select {
            padding: 6px 8px;
            border: 1px solid #e9ecef;
            border-radius: 4px;
            font-size: 14px;
            background: white;
        }

        @media (max-width: 768px) {
            .pagination-wrapper {
                flex-direction: column;
                text-align: center;
            }

            .pagination-controls {
                justify-content: center;
                flex-wrap: wrap;
            }
        }

        /* 响应式设计 */
        @media (max-width: 768px) {
            .main-container {
                padding: 0 16px;
            }

            .search-form {
                grid-template-columns: 1fr;
            }

            .action-section {
                flex-direction: column;
                gap: 16px;
                align-items: stretch;
            }

            .action-buttons {
                justify-content: center;
            }

            .modern-table {
                font-size: 12px;
            }

            .modern-table th,
            .modern-table td {
                padding: 12px 8px;
            }
        }

        /* 隐藏元素 */
        .hidden {
            display: none;
        }
    </style>
</head>

<body>
<!-- 顶部导航 -->
<div class="top-nav">
    <div class="breadcrumb">
        <a href="">首页</a>
        <span>/</span>
        <a href="/findClass?pageSize=15&pageIndex=1">班级信息</a>
    </div>
    <button class="refresh-btn" onclick="window.location.href='/findClass?pageSize=15&pageIndex=1'" title="刷新">
        刷新
    </button>
</div>

<div class="main-container">
    <!-- 搜索区域 -->
    <div class="search-section">
        <form class="search-form layui-form" action="/findClass">
            <input class="form-input" placeholder="请输入班级编号" name="c_classid" id="c_classid">
            <input class="form-input" placeholder="请输入班级名称" name="c_classname" id="c_classname">
            <input class="form-input" placeholder="请输入辅导员姓名" name="c_counsellor" id="c_counsellor">
            <input type="hidden" name="pageIndex" value="1">
            <input type="hidden" name="pageSize" value="15" id="searchPageSize">
            <button class="search-btn" lay-submit="" lay-filter="search">
                <span>🔍</span>
                搜索
            </button>
        </form>
    </div>

    <!-- 操作按钮区域 -->
    <div class="action-section">
        <div class="action-buttons">
            <button id="addStudnetBtn" class="btn btn-primary">
                <span>+</span>
                添加班级
            </button>
            <button class="btn btn-secondary" lay-filter="toolbarDemo" lay-submit="">
                <span>📊</span>
                导出数据
            </button>
        </div>
        <div class="data-count">
            共有数据：${ci.totalCount} 条
        </div>
    </div>

    <!-- 表格区域 -->
    <div class="table-section">
        <table class="modern-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>班级编号</th>
                <th>班级名称</th>
                <th>辅导员</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${ci.list}" var="ci">
                <tr>
                    <td>${ci.c_id}</td>
                    <td>${ci.c_classid}</td>
                    <td>${ci.c_classname}</td>
                    <td>${ci.c_counsellor}</td>
                    <td>
                        <div class="action-icons">
                            <a class="icon-btn edit-btn" title="编辑" href="/findClassById?c_id=${ci.c_id}">
                                ✏️
                            </a>
                            <button class="icon-btn delete-btn" title="删除" onclick="member_del(this,'${ci.c_id}')">
                                🗑️
                            </button>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- 分页区域 -->
    <div class="pagination-section">
        <div class="pagination-wrapper">
            <div class="pagination-info">
                共 ${ci.totalCount} 条记录 ${ci.pageIndex}/${ci.pageTotalCount} 页
            </div>
            <div class="pagination-controls">
                <c:if test="${ci.pageIndex > 1}">
                    <a href="/findClass?pageIndex=1&pageSize=15">首页</a>
                    <a href="/findClass?pageIndex=${ci.pageIndex-1}&pageSize=15">上一页</a>
                </c:if>

                <c:forEach begin="1" end="${ci.pageTotalCount}" var="i">
                    <c:choose>
                        <c:when test="${i == ci.pageIndex}">
                            <span class="current">${i}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="/findClass?pageIndex=${i}&pageSize=15">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:if test="${ci.pageIndex < ci.pageTotalCount}">
                    <a href="/findClass?pageIndex=${ci.pageIndex+1}&pageSize=15">下一页</a>
                    <a href="/findClass?pageIndex=${ci.pageTotalCount}&pageSize=15">末页</a>
                </c:if>
            </div>
            <div class="pagination-jump">
                <span>跳转至</span>
                <input type="number" min="1" max="${ci.pageTotalCount}" placeholder="页" id="jumpPageInput">
                <button onclick="jumpToPage()">GO</button>
            </div>
            <div class="page-size-selector">
                <span>每页显示</span>
                <select id="pageSizeSelector" onchange="changePageSize()">
                    <option value="10">10条</option>
                    <option value="15" selected>15条</option>
                    <option value="20">20条</option>
                    <option value="30">30条</option>
                    <option value="50">50条</option>
                </select>
            </div>
        </div>
        <input type="hidden" id="totalPageCount" value="${ci.pageTotalCount}"/>
    </div>
</div>

<!-- 添加模态框内容 -->
<div id="test" class="hidden">
    <div class="modal-form">
        <form class="layui-form" id="addEmployeeForm">
            <div class="form-group">
                <label class="form-label">班级编号：</label>
                <input type="text" name="c_classid" class="form-input" placeholder="请输入班级编号">
            </div>

            <div class="form-group">
                <label class="form-label">班级名称：</label>
                <input type="text" lay-verify="required" name="c_classname" class="form-input" placeholder="请输入班级名称">
            </div>

            <div class="form-group">
                <label class="form-label">辅导员：</label>
                <input type="text" name="c_counsellor" class="form-input" placeholder="请输入辅导员姓名">
            </div>

            <div class="form-actions">
                <button type="button" class="btn btn-primary" lay-submit lay-filter="formDemo">提交</button>
                <button type="reset" class="btn btn-secondary">重置</button>
            </div>
        </form>
    </div>
</div>

<script>
    layui.config({
        base: 'layui_exts/',
    }).extend({
        excel: 'excel',
    });

    layui.use(['jquery', 'excel','form','layer','laydate'], function(){
        var form = layui.form,
            $ = layui.jquery,
            laydate = layui.laydate;
        var excel = parent.layui.excel;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        // 添加搜索事件处理器 - 这是关键修复
        form.on('submit(search)', function(data){
            // 直接允许表单默认提交行为，类似第二个文件的工作方式
            return true;
        });

        form.on('submit(toolbarDemo)', function(){
            $.ajax({
                url: '/exportclasslist',
                type: 'post',
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    console.log(data);

                    // 1. 如果需要调整顺序，请执行梳理函数
                    var dt = excel.filterExportData(data, [
                        'c_id'
                        ,'c_classid'
                        ,'c_classname'
                        ,'c_counsellor'
                    ]);

                    // 2. 数组头部新增表头
                    dt.unshift({c_id: 'ID', c_classid: '班级编号', c_classname: '班级名', c_counsellor: '辅导员'});

                    // 意思是：A列40px，B列60px(默认)，C列120px，D、E、F等均未定义
                    var colConf = excel.makeColConfig({
                        'C': 90,
                        'D': 80
                    }, 60);

                    var timestart = Date.now();
                    // 3. 执行导出函数，系统会弹出弹框
                    excel.exportExcel({
                        sheet1: dt
                    }, '班级数据.xlsx', 'xlsx', {
                        extend: {
                            '!cols': colConf
                        }
                    });
                    var timeend = Date.now();

                    var spent = (timeend - timestart) / 1000;
                    layer.alert('导出耗时 '+spent+' s');
                },

                error: function () {
                    setTimeout(function () {window.location.href='/findClass?pageSize=15&pageIndex=1';},2000);
                }
            });
        });

        /*添加弹出框*/
        $("#addStudnetBtn").click(function () {
            layer.open({
                type:1,
                title:"添加班级",
                skin:"myclass",
                area:["50%"],
                anim:2,
                content:$("#test").html()
            });
            $("#addEmployeeForm")[0].reset();
            form.on('submit(formDemo)', function(data) {
                var param=data.field;
                $.ajax({
                    url: '/addClass',
                    type: "post",
                    data:JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success:function(){
                        layer.msg('添加成功', {icon: 1, time: 3000});
                        setTimeout(function () {window.location.href='/findClass?pageSize=15&pageIndex=1';},2000);
                    },
                    error:function(){
                        layer.msg('添加失败',{icon:0,time:3000});
                        setTimeout(function () {window.location.href='/findClass?pageSize=15&pageIndex=1';},2000);
                    }
                });
            });
        });
    });

    /*删除*/
    function member_del(obj,c_id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $.get("/deleteClass",{"c_id":c_id},function (data) {
                if(data =true){
                    layer.msg('删除成功!',{icon:1,time:2000});
                    setTimeout(function () {window.location.href='/findClass?pageSize=15&pageIndex=1';},2000);
                }else {
                    layer.msg('删除失败!',{icon:1,time:2000});
                    setTimeout(function () {window.location.href='/findClass?pageSize=15&pageIndex=1';},2000);
                }
            });
        });
    }

    /*跳转页面*/
    function jumpToPage() {
        var pageInput = document.getElementById('jumpPageInput');
        var pageNum = parseInt(pageInput.value);
        var totalPages = parseInt(document.getElementById('totalPageCount').value);
        var currentPageSize = getCurrentPageSize();

        if (pageNum && pageNum >= 1 && pageNum <= totalPages) {
            // 获取当前搜索参数
            var urlParams = new URLSearchParams(window.location.search);
            var searchParams = '';

            // 保持搜索条件
            if(urlParams.get('c_classid')) {
                searchParams += '&c_classid=' + urlParams.get('c_classid');
            }
            if(urlParams.get('c_classname')) {
                searchParams += '&c_classname=' + urlParams.get('c_classname');
            }
            if(urlParams.get('c_counsellor')) {
                searchParams += '&c_counsellor=' + urlParams.get('c_counsellor');
            }

            window.location.href = '/findClass?pageIndex=' + pageNum + '&pageSize=' + currentPageSize + searchParams;
        } else {
            layer.msg('请输入有效的页码 (1-' + totalPages + ')!', {icon: 0, time: 2000});
        }
    }

    /*改变每页显示数量*/
    function changePageSize() {
        var pageSize = document.getElementById('pageSizeSelector').value;

        // 获取当前搜索参数
        var urlParams = new URLSearchParams(window.location.search);
        var searchParams = '';

        // 保持搜索条件
        if(urlParams.get('c_classid')) {
            searchParams += '&c_classid=' + urlParams.get('c_classid');
        }
        if(urlParams.get('c_classname')) {
            searchParams += '&c_classname=' + urlParams.get('c_classname');
        }
        if(urlParams.get('c_counsellor')) {
            searchParams += '&c_counsellor=' + urlParams.get('c_counsellor');
        }

        window.location.href = '/findClass?pageIndex=1&pageSize=' + pageSize + searchParams;
    }

    /*获取当前页面大小*/
    function getCurrentPageSize() {
        var selector = document.getElementById('pageSizeSelector');
        return selector ? selector.value : 15;
    }

    // 回车键跳转和页面初始化
    document.addEventListener('DOMContentLoaded', function() {
        var jumpInput = document.getElementById('jumpPageInput');
        if (jumpInput) {
            jumpInput.addEventListener('keypress', function(e) {
                if (e.key === 'Enter') {
                    jumpToPage();
                }
            });
        }

        // 获取URL参数并填充搜索表单（保持搜索条件显示）
        var urlParams = new URLSearchParams(window.location.search);
        var pageSize = urlParams.get('pageSize');
        var pageIndex = urlParams.get('pageIndex');
        var classId = urlParams.get('c_classid');
        var className = urlParams.get('c_classname');
        var counsellor = urlParams.get('c_counsellor');

        // 填充搜索表单，保持搜索条件
        if(classId) {
            document.getElementById('c_classid').value = decodeURIComponent(classId);
        }
        if(className) {
            document.getElementById('c_classname').value = decodeURIComponent(className);
        }
        if(counsellor) {
            document.getElementById('c_counsellor').value = decodeURIComponent(counsellor);
        }

        // 只有在完全没有参数的情况下才重定向到默认页面
        var hasAnyParams = pageSize || pageIndex || classId || className || counsellor;
        if (!hasAnyParams) {
            window.location.href = '/findClass?pageSize=15&pageIndex=1';
            return;
        }

        // 设置页面大小选择器
        var selector = document.getElementById('pageSizeSelector');
        if (selector && pageSize) {
            selector.value = pageSize;
        }

        // 同步搜索表单中的pageSize
        var searchPageSize = document.getElementById('searchPageSize');
        if (searchPageSize && pageSize) {
            searchPageSize.value = pageSize;
        }
    });
</script>

</body>
</html>
