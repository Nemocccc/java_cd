<%--
  Created by IntelliJ IDEA.
  User: 邓成杰
  Date: 2025/6/2
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.itheima.po.Visitor" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
    <title>访客信息管理</title>
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

        /* 页面标题 */
        .page-header {
            background: #ffffff;
            padding: 24px;
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
            margin-bottom: 24px;
            text-align: center;
        }

        .page-title {
            font-size: 28px;
            font-weight: 700;
            color: #212529;
            margin-bottom: 8px;
        }

        .page-subtitle {
            color: #6c757d;
            font-size: 16px;
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
            text-align: center;
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
            text-align: center;
            vertical-align: middle;
        }

        .modern-table tr:hover {
            background: #f8f9fa;
        }

        /* 时间列样式 */
        .time-cell {
            font-family: 'Courier New', monospace;
            font-size: 13px;
            color: #6c757d;
        }

        /* 分页区域 */
        .pagination-section {
            background: #ffffff;
            padding: 20px 24px;
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
        }

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

            .pagination-wrapper {
                flex-direction: column;
                text-align: center;
            }

            .pagination-controls {
                justify-content: center;
                flex-wrap: wrap;
            }
        }

        /* 隐藏元素 */
        .hidden {
            display: none;
        }

        /* 加载动画 */
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

        .main-container > * {
            animation: fadeInUp 0.5s ease-out;
            animation-fill-mode: both;
        }

        .search-section {
            animation-delay: 0.1s;
        }

        .action-section {
            animation-delay: 0.2s;
        }

        .table-section {
            animation-delay: 0.3s;
        }

        .pagination-section {
            animation-delay: 0.4s;
        }
    </style>
</head>

<body>
    <!-- 顶部导航 -->
    <div class="top-nav">
        <div class="breadcrumb">
            <a href="">首页</a>
            <span>/</span>
            <a href="/findVisitor">访客信息</a>
        </div>
        <button class="refresh-btn" onclick="window.location.href='/findVisitor'" title="刷新">
            刷新
        </button>
    </div>

    <div class="main-container">
        <!-- 页面标题 -->
        <div class="page-header">
            <div class="page-title">访客信息管理</div>
            <div class="page-subtitle">管理宿舍访客登记和查询</div>
        </div>

        <!-- 搜索区域 -->
        <div class="search-section">
            <form class="search-form layui-form" action="/findVisitor">
                <input class="form-input" placeholder="请输入访客姓名" name="v_name" id="v_name">
                <input class="form-input" placeholder="请输入访客电话" name="v_phone" id="v_phone">
                <input type="hidden" name="pageIndex" value="1">
                <input type="hidden" name="pageSize" value="3">
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
                    添加访客
                </button>
                <button class="btn btn-secondary" lay-filter="toolbarDemo" lay-submit="">
                    <span>📊</span>
                    导出数据
                </button>
            </div>
            <div class="data-count">
                共有数据：${pi.totalCount} 条
            </div>
        </div>

        <!-- 表格区域 -->
        <div class="table-section">
            <table class="modern-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>访客姓名</th>
                        <th>访客电话</th>
                        <th>访问宿舍编号</th>
                        <th>访问宿舍楼</th>
                        <th>访问时间</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${pi.list}" var="visitor">
                        <tr>
                            <td>${visitor.v_id}</td>
                            <td>${visitor.v_name}</td>
                            <td>${visitor.v_phone}</td>
                            <td>${visitor.v_dormitoryid}</td>
                            <td>${visitor.v_dormbuilding}</td>
                            <td class="time-cell">
                                <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${visitor.create_time}"/>
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
                    共 ${pi.totalCount} 条记录 ${pi.pageIndex}/${pi.pageTotalCount} 页
                </div>
                <div class="pagination-controls">
                    <c:if test="${pi.pageIndex > 1}">
                        <a href="/findVisitor?pageIndex=1&pageSize=3">首页</a>
                        <a href="/findVisitor?pageIndex=${pi.pageIndex-1}&pageSize=3">上一页</a>
                    </c:if>
                    
                    <c:forEach begin="1" end="${pi.pageTotalCount}" var="i">
                        <c:choose>
                            <c:when test="${i == pi.pageIndex}">
                                <span class="current">${i}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="/findVisitor?pageIndex=${i}&pageSize=3">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    
                    <c:if test="${pi.pageIndex < pi.pageTotalCount}">
                        <a href="/findVisitor?pageIndex=${pi.pageIndex+1}&pageSize=3">下一页</a>
                        <a href="/findVisitor?pageIndex=${pi.pageTotalCount}&pageSize=3">末页</a>
                    </c:if>
                </div>
                <div class="pagination-jump">
                    <span>跳转至</span>
                    <input type="number" min="1" max="${pi.pageTotalCount}" placeholder="页" id="jumpPageInput">
                    <button onclick="jumpToPage()">GO</button>
                </div>
            </div>
            <input type="hidden" id="totalPageCount" value="${pi.pageTotalCount}"/>
        </div>
    </div>

    <!-- 添加模态框内容 -->
    <div id="test" class="hidden">
        <div class="modal-form">
            <form class="layui-form" id="addEmployeeForm">
                <div class="form-group">
                    <label class="form-label">访客姓名：</label>
                    <input type="text" lay-verify="required" name="v_name" class="form-input" placeholder="请输入访客姓名">
                </div>

                <div class="form-group">
                    <label class="form-label">访客电话：</label>
                    <input type="text" name="v_phone" class="form-input" placeholder="请输入访客电话">
                </div>

                <div class="form-group">
                    <label class="form-label">访问宿舍编号：</label>
                    <input type="text" name="v_dormitoryid" class="form-input" placeholder="请输入宿舍编号">
                </div>

                <div class="form-group">
                    <label class="form-label">访问宿舍楼：</label>
                    <input type="text" name="v_dormbuilding" class="form-input" placeholder="请输入宿舍楼">
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

        form.on('submit(toolbarDemo)', function(){
            $.ajax({
                url: '/exportvisitorlist',
                type: 'post',
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    console.log(data);

                    // 1. 如果需要调整顺序，请执行梳理函数
                    var dt = excel.filterExportData(data, [
                        'v_id'
                        ,'v_name'
                        ,'v_phone'
                        ,'v_dormitoryid'
                        ,'v_dormbuilding'
                        ,'create_time'
                    ]);

                    // 2. 数组头部新增表头
                    dt.unshift({v_id: 'ID', v_name: '访客姓名', v_phone: '访客电话', v_dormitoryid: '访问宿舍编号', v_dormbuilding: '访问宿舍楼', create_time: '访问时间'});

                    // 意思是：A列40px，B列60px(默认)，C列120px，D、E、F等均未定义
                    var colConf = excel.makeColConfig({
                        'B': 80,
                        'C': 90,
                        'D': 100,
                        'E': 100,
                        'F': 160
                    }, 60);

                    var timestart = Date.now();
                    // 3. 执行导出函数，系统会弹出弹框
                    excel.exportExcel({
                        sheet1: dt
                    }, '访客数据.xlsx', 'xlsx', {
                        extend: {
                            '!cols': colConf
                        }
                    });
                    var timeend = Date.now();

                    var spent = (timeend - timestart) / 1000;
                    layer.alert('导出耗时 '+spent+' s');
                },

                error: function () {
                    setTimeout(function () {window.location.href='/findVisitor';},2000);
                }
            });
        });

        /*添加弹出框*/
        $("#addStudnetBtn").click(function () {
            layer.open({
                type:1,
                title:"添加访客",
                skin:"myclass",
                area:["50%"],
                anim:2,
                content:$("#test").html()
            });
            $("#addEmployeeForm")[0].reset();
            form.on('submit(formDemo)', function(data) {
                var param=data.field;
                $.ajax({
                    url: '/addVisitor',
                    type: "post",
                    data:JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success:function(){
                        layer.msg('添加成功', {icon: 1, time: 3000});
                        setTimeout(function () {window.location.href='/findVisitor';},2000);
                    },
                    error:function(){
                        layer.msg('添加失败',{icon:0,time:3000});
                        setTimeout(function () {window.location.href='/findVisitor';},2000);
                    }
                });
            });
        });
    });

    /*跳转页面*/
    function jumpToPage() {
        var pageInput = document.getElementById('jumpPageInput');
        var pageNum = parseInt(pageInput.value);
        var totalPages = parseInt(document.getElementById('totalPageCount').value);
        
        if (pageNum && pageNum >= 1 && pageNum <= totalPages) {
            window.location.href = '/findVisitor?pageIndex=' + pageNum + '&pageSize=3';
        } else {
            layer.msg('请输入有效的页码 (1-' + totalPages + ')!', {icon: 0, time: 2000});
        }
    }

    // 回车键跳转和搜索
    document.addEventListener('DOMContentLoaded', function() {
        var jumpInput = document.getElementById('jumpPageInput');
        if (jumpInput) {
            jumpInput.addEventListener('keypress', function(e) {
                if (e.key === 'Enter') {
                    jumpToPage();
                }
            });
        }

        // 搜索框回车键支持
        var searchInputs = document.querySelectorAll('.search-form .form-input');
        searchInputs.forEach(function(input) {
            input.addEventListener('keypress', function(e) {
                if (e.key === 'Enter') {
                    document.querySelector('.search-btn').click();
                }
            });
        });
    });
</script>

</body>
</html>
