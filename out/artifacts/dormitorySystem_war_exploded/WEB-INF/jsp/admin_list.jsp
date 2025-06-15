<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.itheima.po.Admin" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>后台登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <link rel="icon" href="/images/favicon.ico" sizes="32x32"/>
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script src="/lib/layui/layui.js"></script>
    <script src="/layui_exts/excel.js"></script>

    <style>
        body {
            background: #fff;
            font-family: 'Segoe UI', 'Helvetica Neue', Arial, sans-serif;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .layui-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .layui-table th,
        .layui-table td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
            background-color: #f9f9f9;
        }

        .layui-table th {
            background: #efefef;
            font-weight: bold;
        }

        .layui-form input.layui-input {
            background: #fff;
            border: 1px solid #ccc;
            padding: 8px;
            color: #333;
        }

        .layui-btn {
            background: #000;
            color: #fff;
            border: none;
            padding: 8px 16px;
            font-size: 14px;
            transition: background 0.3s;
        }

        .layui-btn:hover {
            background: #333;
        }

        .x-nav {
            background: #f0f0f0;
            padding: 10px 15px;
            border-bottom: 1px solid #ccc;
            margin-bottom: 10px;
        }

        .layui-breadcrumb a {
            color: #555 !important;
            text-decoration: none;
        }

        .layui-breadcrumb a:hover {
            text-decoration: underline;
        }

        .layui-form-label {
            color: #444;
        }

        .layui-input-block input {
            border-radius: 0;
        }

        .td-manage a {
            color: #000;
            margin: 0 5px;
        }

        .td-manage a:hover {
            color: #555;
        }

        .xblock {
            margin: 15px 0;
        }

        .layui-form-item {
            margin-bottom: 15px;
        }

        .x-body {
            padding: 20px;
        }

        .layui-form .layui-btn-primary {
            background: #fff;
            color: #000;
            border: 1px solid #ccc;
        }

        .layui-form .layui-btn-primary:hover {
            background: #eee;
        }
    </style>
</head>

<body>
<div class="x-nav">
    <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="/findAdmin">管理员信息</a>
    </span>
</div>

<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="/findAdmin">
            <input type="hidden" class="layui-input" name="a_id" id="a_id">
            <input class="layui-input" placeholder="请输入用户名" name="a_username" id="a_username">
            <input class="layui-input" placeholder="请输入级别描述" name="a_describe" id="a_describe">
            <input class="layui-input" type="hidden" name="pageIndex" value="1">
            <input class="layui-input" type="hidden" name="pageSize" value="3">
            <button class="layui-btn" lay-submit="" lay-filter="search">搜索</button>
        </form>
    </div>

    <div class="xblock">
        <button id="addStudnetBtn" class="layui-btn">添加</button>
        <button class="layui-btn" lay-filter="toolbarDemo" lay-submit="">导出</button>
        <span class="x-right" style="line-height:40px">共有数据：${ai.totalCount} 条</span>
    </div>

    <table class="layui-table">
        <thead>
        <tr>
            <th>ID</th>
            <th>用户名</th>
            <th>姓名</th>
            <th>电话</th>
            <th>级别描述</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${ai.list}" var="ai">
            <tr>
                <td class="myid">${ai.a_id}</td>
                <td>${ai.a_username}</td>
                <td>${ai.a_name}</td>
                <td>${ai.a_phone}</td>
                <td>${ai.a_describe}</td>
                <td class="td-manage">
                    <a title="编辑" class="updateEdit" href="#">编辑</a>
                    <a title="删除" onclick="member_del(this,'${ai.a_id}','${ai.a_power}')" href="javascript:;">删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="layui-row" id="test" style="display: none;">
        <div class="layui-col-md10">
            <form class="layui-form" id="addEmployeeForm">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名：</label>
                    <div class="layui-input-block">
                        <input type="text" name="a_username" class="layui-input" placeholder="请输入用户名">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码：</label>
                    <div class="layui-input-block">
                        <input type="password" name="a_password" class="layui-input" placeholder="请输入密码">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-block">
                        <input type="text" name="a_name" class="layui-input" placeholder="请输入姓名">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">电话：</label>
                    <div class="layui-input-block">
                        <input type="text" name="a_phone" class="layui-input" placeholder="请输入电话">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">级别：</label>
                    <div class="layui-input-block">
                        <input type="text" name="a_power" class="layui-input" placeholder="请输入级别 1-2">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">级别描述：</label>
                    <div class="layui-input-block">
                        <input type="text" name="a_describe" class="layui-input" placeholder="请输入描述">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <input type="hidden" id="totalPageCount" value="${ai.pageTotalCount}"/>
    <c:import url="pageBtn.jsp">
        <c:param name="totalCount" value="${ai.totalCount}"/>
        <c:param name="currentPageNo" value="${ai.pageIndex}"/>
        <c:param name="totalPageCount" value="${ai.pageTotalCount}"/>
    </c:import>
</div>

<script>
    layui.config({ base: 'layui_exts/' }).extend({ excel: 'excel' });

    layui.use(['jquery', 'excel', 'form', 'layer'], function(){
        var form = layui.form,
            $ = layui.jquery,
            excel = parent.layui.excel;

        form.on('submit(toolbarDemo)', function(){
            $.ajax({
                url: '/exportadminlist',
                type: 'post',
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var dt = excel.filterExportData(data, ['a_id','a_username','a_name','a_phone','a_describe']);
                    dt.unshift({a_id: 'ID', a_username: '用户名', a_name: '姓名', a_phone: '电话', a_describe: '描述'});
                    var colConf = excel.makeColConfig({ 'A': 40, 'D': 90 }, 60);
                    excel.exportExcel({sheet1: dt}, '管理员数据.xlsx', 'xlsx', { extend: { '!cols': colConf } });
                }
            });
        });

        $("#addStudnetBtn").click(function () {
            layer.open({
                type: 1,
                title: "添加管理员",
                area: ["50%"],
                anim: 2,
                content: $("#test").html()
            });
            form.on('submit(formDemo)', function(data) {
                $.ajax({
                    url: '/addAdmin',
                    type: "post",
                    data: JSON.stringify(data.field),
                    contentType: "application/json; charset=utf-8",
                    success:function(){
                        layer.msg('添加成功', {icon: 1, time: 2000});
                        setTimeout(() => window.location.href='/findAdmin', 2000);
                    },
                    error:function(){
                        layer.msg('添加失败',{icon:0,time:2000});
                        setTimeout(() => window.location.href='/findAdmin', 2000);
                    }
                });
            });
        });

        $(".updateEdit").click(function () {
            var myid = $(this).closest("tr").find(".myid").text();
            var admin_id = ${sessionScope.ad.a_id};
            if(admin_id != myid){
                layer.alert("对不起，您没有权限:(");
            } else {
                window.location.href = "/findAdminById?a_id=" + myid;
            }
        });
    });

    function member_del(obj,a_id,a_power){
        var power = ${sessionScope.ad.a_power};
        var id = ${sessionScope.ad.a_id};
        if(power != 1 && id != a_id){
            layer.alert("对不起，您没有权限:(");
        } else {
            layer.confirm('确认要删除吗？',function(){
                $.get("/deleteAdmin",{"a_id":a_id},function (data) {
                    if(data === true){
                        layer.msg('删除成功!',{icon:1,time:2000});
                        setTimeout(() => window.location.href='/findAdmin', 2000);
                    } else {
                        layer.msg('删除失败!',{icon:1,time:2000});
                    }
                });
            });
        }
    }
</script>
</body>
</html>
