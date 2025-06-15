<%--
  Created by IntelliJ IDEA.
  User: 郑瑞璟
  Date: 2025/5/2
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.itheima.po.StudentClean" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
    <title>学生卫生管理</title>
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
        body {
            font-family:"宋体"
        }
        /* ========== 按钮样式优化 ========== */
        /* 新设计原则：低调优雅、简约专业 */

        /* 基础按钮样式重写 */
        .layui-btn {
            border-radius: 6px;
            transition: all 0.3s ease;
            box-shadow: 0 2px 6px rgba(0,0,0,0.08);
            font-weight: 500;
            letter-spacing: 0.5px;
            border: 1px solid #e0e0e0;
        }

        /* 添加按钮 - 低调配色方案 */
        #addStudnetBtn {
            background-color: #f8f9fa;
            color: #4a5568;
            padding: 0 20px;
            height: 36px;
            line-height: 36px;
            border: 1px solid #d0d4de;
            background: linear-gradient(to bottom, #f8f9fa, #eef2f6);
        }

        #addStudnetBtn:hover {
            background: linear-gradient(to bottom, #fff, #eef2f6);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            color: #2c3e50;
        }

        /* 导出按钮 - 低调配色方案 */
        .toolbar-export {
            background: linear-gradient(to bottom, #e3f2fd, #bbdefb);
            color: #1565c0;
            padding: 0 20px;
            height: 36px;
            line-height: 36px;
            border: 1px solid #90caf9;
        }

        .toolbar-export:hover {
            background: linear-gradient(to bottom, #bbdefb, #90caf9);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(33, 150, 243, 0.2);
        }

        /* 搜索按钮 - 低调样式 */
        .x-so .layui-btn {
            background: linear-gradient(to bottom, #f8f9fa, #eef2f6);
            color: #4a5568;
            padding: 0 16px;
            height: 36px;
            border-radius: 6px;
            border: 1px solid #d0d4de;
        }

        .x-so .layui-btn:hover {
            background: linear-gradient(to bottom, #fff, #eef2f6);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            color: #2c3e50;
        }

        /* 表格操作按钮 - 低调设计 */
        .action-btn {
            display: inline-flex;
            justify-content: center;
            align-items: center;
            width: 28px;
            height: 28px;
            border-radius: 4px;
            background-color: #f0f4f8;
            margin: 0 3px;
            transition: all 0.2s;
            border: 1px solid #e0e4e8;
            color: #666;
        }

        .action-btn.edit-btn:hover {
            background: #e3f2fd;
            border-color: #bbdefb;
            color: #0d47a1;
            transform: translateY(-2px);
        }

        .action-btn.delete-btn:hover {
            background: #ffebee;
            border-color: #ffcdd2;
            color: #b71c1c;
            transform: translateY(-2px);
        }

        /* ========== 布局优化 ========== */
        /* 导航栏样式微调 */
        .x-nav {
            background: #f8f9fa;
            padding: 10px 15px;
            border-bottom: 1px solid #e0e0e0;
            color: #4a5568;
        }

        .x-nav a {
            color: #4a5568;
        }

        .x-nav a:hover {
            color: #2c3e50;
        }

        /* 工具栏优化 */
        .toolbar-container {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: white;
            padding: 10px;
            border-radius: 6px;
            margin-bottom: 15px;
        }

        .toolbar-right {
            display: flex;
            gap: 8px;
            justify-content: right;
        }

        .data-stats {
            background: #f0f4f8;
            padding: 6px 12px;
            border-radius: 4px;
            border: 1px solid #e0e4e8;
            font-size: 13px;
            color: #4a5568;
            margin-right: 12px;
        }

        /* 搜索区域优化 */
        .search-container {
            background: #f8f9fa;
            padding: 12px;
            border-radius: 6px;
            border: 1px solid #e0e0e0;
            margin-bottom: 15px;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: center;
        }

        .search-row {
            display: flex;
            gap: 10px;
            width: 100%;
        }

        .search-field {
            flex: 1;
        }

        .search-field .layui-input {
            border-radius: 6px;
            border: 1px solid #d0d4de;
            padding: 0 15px;
            height: 36px;
            background: white;
            font-size: 14px;
            color: #4a5568;
        }

        .search-field .layui-input:focus {
            border-color: #90caf9;
            box-shadow: 0 0 0 2px rgba(144, 202, 249, 0.3);
        }

        .search-button {
            width: 100px;
        }

        /* 表格样式微调 */
        .layui-table {
            border-radius: 6px;
            overflow: hidden;
            border: 1px solid #e0e0e0;
            box-shadow: none;
        }

        .layui-table th {
            background: linear-gradient(to bottom, #f5f7fa, #e4edfb);
            color: #2c3e50;
            font-weight: 600;
            font-size: 14px;
            border-bottom: 1px solid #d0d4de;
        }

        .layui-table td {
            color: #4a5568;
            font-size: 14px;
            border-bottom: 1px solid #f0f2f5;
        }

        /* 原有样式保留 */
        .layui-table{
            text-align: center;
        }
        .layui-table th{
            text-align: center;
        }

        /* ========== 分页样式优化 ========== */
        .pagination-container {
            display: flex;
            justify-content: center; /* 居中显示分页 */
            margin-top: 20px;
            padding: 10px;
        }

        /* 如果pageBtn.jsp中的样式需要调整，可以在这里添加 */
        .pagination-container .layui-laypage {
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .pagination-container .layui-laypage a {
            padding: 5px 12px;
            border-radius: 4px;
            border: 1px solid #d0d4de;
            color: #4a5568;
            background: #f8f9fa;
            transition: all 0.2s;
        }

        .pagination-container .layui-laypage a:hover {
            background: #eef2f6;
            color: #2c3e50;
        }

        .pagination-container .layui-laypage a.layui-laypage-curr {
            background: #e3f2fd;
            border-color: #90caf9;
            color: #0d47a1;
        }

        .pagination-container .layui-laypage a.layui-disabled {
            color: #b0b8c8;
            background: #f8f9fa;
            cursor: not-allowed;
        }
    </style>
</head>

<body>
<div class="x-nav">
    <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="/findDormClean">学生卫生</a>
    </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right;background-color: #393D49" href="/findStudentClean" title="刷新">
        <i class="layui-icon" style="line-height:30px;color: white">ဂ</i></a>
</div>
<div class="x-body">
    <!-- 搜索区域 - 横向排列输入框 -->
    <div class="search-container">
        <form class="layui-form" action="/findStudentClean">
            <div class="search-row">
                <!-- 学号输入框 -->
                <div class="search-field">
                    <input class="layui-input" placeholder="请输入学号" name="s_studentid" id="s_studentid">
                </div>

                <!-- 姓名输入框 -->
                <div class="search-field">
                    <input class="layui-input" placeholder="请输入姓名" name="s_name" id="s_name">
                </div>

                <!-- 寝室编号输入框 -->
                <div class="search-field">
                    <input class="layui-input" placeholder="请输入寝室编号" name="s_dormitoryid" id="s_dormitoryid">
                </div>

                <input type="hidden" name="pageIndex" value="1">
                <input type="hidden" name="pageSize" value="3">

                <div class="search-button">
                    <button class="layui-btn" lay-submit="" lay-filter="sreach" style="background-color: #393D49">
                        <i class="layui-icon">&#xe615;</i>搜索
                    </button>
                </div>
            </div>

        </form>
    </div>

    <!-- 工具栏优化布局 -->
    <div class="toolbar-container">
        <span class="data-stats">
            <i class="layui-icon">&#xe60a;</i> 共有数据：${di.totalCount} 条
        </span>

        <div class="toolbar-right">
            <button id="addStudnetBtn" class="layui-btn">
                <i class="layui-icon">&#xe654;</i>添加记录
            </button>
            <button class="layui-btn toolbar-export" lay-filter="toolbarDemo" lay-submit="">
                <i class="layui-icon">&#xe67c;</i>导出数据
            </button>
        </div>
    </div>

    <%--添加模态框--%>
    <div class="layui-row" id="test" style="display: none;">
        <div class="layui-col-md10">
            <form class="layui-form" id="addEmployeeForm">
                <div class="layui-form-item">
                    <label class="layui-form-label">学号：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="s_studentid"   class="layui-input" placeholder="请输入学号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="s_name"  class="layui-input" placeholder="请输入姓名">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">学生卫生：</label>
                    <div class="layui-input-block">
                        <input type="text" name="s_grade" class="layui-input" placeholder="请输入卫生打分">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">班级编号：</label>
                    <div class="layui-input-block">
                        <input type="text" name="s_classid" class="layui-input" placeholder="请输入班级编号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">寝室编号：</label>
                    <div class="layui-input-block">
                        <input type="text" name="s_dormitoryid"  class="layui-input" placeholder="请输入寝室编号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <%--表格数据--%>
    <table class="layui-table">
        <thead>
        <tr>
            <th>ID</th>
            <th>学号</th>
            <th>姓名</th>
            <th>学生卫生</th>
            <th>班级编号</th>
            <th>宿舍编号</th>
            <th>创建日期</th>
            <th>更新日期</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${di.list}" var="di">
            <tr>
                <td>${di.g_id}</td>
                <td>${di.s_studentid}</td>
                <td>${di.s_name}</td>
                <td>${di.s_grade}</td>
                <td>${di.s_classid}</td>
                <td>${di.s_dormitoryid}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${di.create_time}"/></td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${di.update_time}"/></td>
                <td>
                    <a title="编辑" class="action-btn edit-btn" href="/findStudentCleanById?g_id=${di.g_id}">
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" class="action-btn delete-btn" onclick="member_del(this,'${di.g_id}')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- 分页区域 - 居中显示 -->
    <div class="pagination-container">
        <input type="hidden" id="totalPageCount" value="${di.pageTotalCount}"/>
        <c:import url="pageBtn.jsp">
            <c:param name="totalCount" value="${di.totalCount}"/>
            <c:param name="currentPageNo" value="${di.pageIndex}"/>
            <c:param name="totalPageCount" value="${di.pageTotalCount}"/>
        </c:import>
    </div>

    <!-- JavaScript部分保持不变 -->
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
                    url: '/exportstudentcleanlist',
                    type: 'post',
                    dataType: 'json',
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        console.log(data);

                        // 1. 如果需要调整顺序，请执行梳理函数
                        var dt = excel.filterExportData(data, [
                            'g_id'
                            ,'s_studentid'
                            ,'s_name'
                            ,'s_grade'
                            ,'s_classid'
                            ,'s_dormitoryid'
                            ,'create_time'
                            ,'update_time'
                        ]);

                        // 2. 数组头部新增表头
                        dt.unshift({g_id: 'ID', s_studentid: '学号', s_name: '姓名', s_grade: '学生卫生', s_classid: '班级编号', s_dormitoryid: '宿舍编号', create_time: '创建日期', update_time: '更新日期'});

                        // 意思是：A列40px，B列60px(默认)，C列120px，D、E、F等均未定义
                        var colConf = excel.makeColConfig({
                            'B': 90,
                            'G': 160,
                            'H': 160
                        }, 60);

                        var timestart = Date.now();
                        // 3. 执行导出函数，系统会弹出弹框
                        excel.exportExcel({
                            sheet1: dt
                        }, '学生卫生数据.xlsx', 'xlsx', {
                            extend: {
                                '!cols': colConf
                            }
                        });

                        var timeend = Date.now();
                        var spent = (timeend - timestart) / 1000;
                        layer.alert('导出耗时 '+spent+' s');
                        //setTimeout(function () {window.location.href='/findAdmin';},2000);
                    },

                    error: function () {
                        //console.log(data);
                        setTimeout(function () {window.location.href='/findStudentClean';},2000);
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
                    // layer.msg('aaa',{icon:1,time:3000});
                    var param=data.field;
                    // console.log(JSON.stringify(param));
                    $.ajax({
                        url: '/addStudentClean',
                        type: "post",
                        data:JSON.stringify(param),
                        contentType: "application/json; charset=utf-8",
                        success:function(){
                            layer.msg('添加成功', {icon: 1, time: 3000});
                            setTimeout(function () {window.location.href='/findStudentClean';},2000);

                        },
                        error:function(){
                            layer.msg('添加失败',{icon:0,time:3000});
                            setTimeout(function () {window.location.href='/findStudentClean';},2000);
                        }
                    });
                    // return false;
                });
            });

        });




        /*删除*/
        function member_del(obj,g_id){
            layer.confirm('确认要删除吗？',function(index){
                //发异步删除数据
                $.get("/deleteStudentClean",{"g_id":g_id},function (data) {
                    if(data =true){
                        layer.msg('删除成功!',{icon:1,time:2000});
                        setTimeout(function () {window.location.href='/findStudentClean';},2000);

                    }else {
                        layer.msg('删除失败!',{icon:1,time:2000});
                        setTimeout(function () {window.location.href='/findStudentClean';},2000);
                    }
                });
            });
        }


        /*批量删除*/
        function delAll (obj,s_id) {

            var data = tableCheck.getData();
            layer.confirm('确认要删除吗？'+data,function(s_id){
                //捉到所有被选中的，发异步进行删除
                layer.msg('删除成功', {icon: 1});
                $(".layui-form-checked").not('.header').parents('tr').remove();
            });
        }
    </script>

</body>
</html>