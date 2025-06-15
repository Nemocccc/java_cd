<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.itheima.po.Dormitory" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>宿舍列表</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <link rel="stylesheet" href="./css/pg_btn.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script src="/layui_exts/excel.js"></script>

    <style type="text/css">

        /* 背景和全局样式 */
        body {
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            background-color: #f5f7fa;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .x-nav {
            display: flex;
            align-items: center;
            justify-content: flex-start;
            padding: 15px;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            border-radius: 12px;
            position: absolute;
            top: 20px; /* 距离顶部20px */
            left: 20px; /* 距离左边20px */
            z-index: 1000;
        }

        /* 搜索框 */
        .layui-input {
            border-radius: 12px;
            padding: 12px;
            background-color: #fafafa;
            border: 1px solid #ddd;
        }

        /* 按钮样式 */
        .layui-btn {
            display: inline-flex;
            justify-content: center;
            align-items: center;
            background-color: #333;
            color: white;
            border-radius: 12px;
            padding: 12px 20px;
            font-weight: bold;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            font-size: 14px;
        }

        .layui-btn i {
            font-size: 18px;
            margin-right: 8px;
        }

        .layui-btn:hover {
            background-color: #444;
        }

        .layui-btn-normal {
            background-color: #222;
            border-radius: 12px;
        }

        .layui-btn-normal:hover {
            background-color: #333;
        }

        /* 按钮文字和图标居中 */
        .layui-btn i,
        .layui-btn span {
            display: inline-block;
            vertical-align: middle;
        }

        /* 表格样式 */
        .layui-table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            font-size: 14px;
        }

        .layui-table th,
        .layui-table td {
            text-align: center;
            padding: 15px;
            font-size: 14px;
            border: 1px solid #ddd;
        }

        .layui-table th {
            background-color: #f7fafc;
        }

        /* 分页样式优化（pageBtn.jsp 的样式） */
        .page-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap; /* 防止挤爆换行 */
            margin-top: 20px;
            font-size: 14px;
        }

        /* 防止分页内容换行 */
        .page-container span,
        .page-container a,
        .page-container input {
            white-space: nowrap;
            margin: 0 5px;
        }

        /* 美化 GO 按钮 */
        .page-container input[type="button"],
        .page-container input[type="submit"] {
            background-color: #000 !important;
            color: #fff !important;
            border: none;
            padding: 6px 12px;
            border-radius: 6px;
            cursor: pointer;
        }

        /* 输入框统一样式 */
        .page-container input[type="text"] {
            width: 50px;
            height: 28px;
            border: 1px solid #ccc;
            border-radius: 4px;
            padding: 0 5px;
            text-align: center;
        }
        /* 固定在页面右上角的刷新按钮样式 */
        .layui-btn.layui-btn-small[title="刷新"] {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 999;
            width: 48px;
            height: 48px;
            background-color: #000 !important;
            color: #fff !important;
            border-radius: 14px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 20px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .layui-btn.layui-btn-small[title="刷新"]:hover {
            background-color: #333 !important;
        }


    </style>
</head>

<body>
<!-- 页面内容 -->
<div class="x-nav">
        <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="/findDormitory">宿舍信息</a>
        </span>

</div>
<a class="layui-btn layui-btn-small" href="/findDormitory" title="刷新">
    <i class="layui-icon" style="line-height:30px">ဂ</i>
</a>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="/findDormitory">
            <input class="layui-input" placeholder="请输入宿舍编号" name="s_dormitoryid" id="s_dormitoryid">
            <input class="layui-input" placeholder="请输入宿舍楼" name="d_dormbuilding" id="d_dormbuilding">
            <input class="layui-input" placeholder="请输入管理员姓名" name="a_name" id="a_name">
            <input class="layui-input" type="hidden" name="pageIndex" value="1">
            <input class="layui-input" type="hidden" name="pageSize" value="3">
            <button class="layui-btn" lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>

    <xblock>
        <button id="addStudnetBtn" class="layui-btn layui-btn-normal"> <i class="layui-icon">&#xe654;</i>添加 </button>
        <button class="layui-btn layui-btn-warm" lay-filter="toolbarDemo" lay-submit=""><i class="layui-icon">&#xe67c;</i>导出</button>
        <span class="x-right" style="line-height:40px">共有数据：${di.totalCount} 条</span>
    </xblock>

    <!-- 表格数据 -->
    <table class="layui-table">
        <thead>
        <tr>
            <th>ID</th>
            <th>宿舍编号</th>
            <th>宿舍楼</th>
            <th>床位总数</th>
            <th>已用床位</th>
            <th>管理员</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${di.list}" var="di">
            <tr>
                <td>${di.d_id}</td>
                <td>${di.s_dormitoryid}</td>
                <td>${di.d_dormbuilding}</td>
                <td>${di.d_bedtotal}</td>
                <td>${di.d_bed}</td>
                <td>${di.a_name}</td>
                <td>
                    <a title="编辑" id="updateEdit" href="/findDormitoryById?d_id=${di.d_id}">
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" onclick="member_del(this, '${di.d_id}')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="">
        <input type="hidden" id="totalPageCount" value="${di.pageTotalCount}"/>
        <c:import url="pageBtn.jsp">
            <c:param name="totalCount" value="${di.totalCount}"/>
            <c:param name="currentPageNo" value="${di.pageIndex}"/>
            <c:param name="totalPageCount" value="${di.pageTotalCount}"/>
        </c:import>
    </div>
</div>
<!-- 添加宿舍表单，必须放在页面内 -->
<div class="layui-row" id="test" style="display: none;">
    <div class="layui-col-md10">
        <form class="layui-form" id="addEmployeeForm">
            <div class="layui-form-item">
                <label class="layui-form-label">宿舍编号：</label>
                <div class="layui-input-block">
                    <input type="text" name="s_dormitoryid" class="layui-input" placeholder="请输入宿舍编号">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">宿舍楼：</label>
                <div class="layui-input-block">
                    <input type="text" name="d_dormbuilding" class="layui-input" placeholder="请输入宿舍楼">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">床位总数：</label>
                <div class="layui-input-block">
                    <input type="number" name="d_bedtotal" class="layui-input" placeholder="请输入床位总数">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">管理员：</label>
                <div class="layui-input-block">
                    <input type="text" name="a_name" class="layui-input" placeholder="请输入管理员姓名">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="submit" class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
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

    layui.use(['jquery', 'excel', 'form', 'layer', 'laydate'], function () {
        var form = layui.form,
            $ = layui.jquery,
            laydate = layui.laydate;
        var excel = parent.layui.excel;

        form.on('submit(toolbarDemo)', function () {
            $.ajax({
                url: '/exportdormitorylist',
                type: 'post',
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var dt = excel.filterExportData(data, [
                        'd_id', 's_dormitoryid', 'd_dormbuilding', 'd_bedtotal', 'd_bed', 'a_name'
                    ]);
                    dt.unshift({d_id: 'ID', s_dormitoryid: '宿舍编号', d_dormbuilding: '宿舍楼', d_bedtotal: '床位总数', d_bed: '已用床位', a_name: '管理员'});
                    var colConf = excel.makeColConfig({
                        'C': 90,
                        'F': 80
                    }, 60);
                    excel.exportExcel({sheet1: dt}, '宿舍数据.xlsx', 'xlsx', {extend: {'!cols': colConf}});
                },
                error: function () {
                    setTimeout(function () {window.location.href = '/findDormitory';}, 2000);
                }
            });
        });

        $("#addStudnetBtn").click(function () {
            layer.open({
                type: 1,
                title: "添加宿舍",
                skin: "myclass",
                area: ["50%"],
                anim: 2,
                content: $("#test").html()
            });
            $("#addEmployeeForm")[0].reset();
            form.on('submit(formDemo)', function (data) {
                var param = data.field;
                $.ajax({
                    url: '/addDormitory',
                    type: "post",
                    data: JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success: function () {
                        layer.msg('添加成功', {icon: 1, time: 3000});
                        setTimeout(function () {window.location.href = '/findDormitory';}, 2000);
                    },
                    error: function () {
                        layer.msg('添加失败', {icon: 0, time: 3000});
                        setTimeout(function () {window.location.href = '/findDormitory';}, 2000);
                    }
                });
            });
        });
    });

    function member_del(obj, d_id) {
        layer.confirm('确认要删除吗？', function (index) {
            $.get("/deleteDormitory", {"d_id": d_id}, function (data) {
                if (data == true) {
                    layer.msg('删除成功!', {icon: 1, time: 2000});
                    setTimeout(function () {window.location.href = '/findDormitory';}, 2000);
                } else {
                    layer.msg('删除成功!', {icon: 1, time: 2000});
                    setTimeout(function () {window.location.href = '/findDormitory';}, 2000);
                }
            });
        });
    }
</script>
</body>
</html>
