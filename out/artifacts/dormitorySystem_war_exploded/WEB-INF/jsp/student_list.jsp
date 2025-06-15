<%--
  Created by IntelliJ IDEA.
  User: nemo
  Date: 2025/6/14
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  import="com.itheima.po.Student" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>学生信息管理</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />

    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <!-- ...existing scripts and stylesheets... -->
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script src="/layui_exts/excel.js"></script>

    <style type="text/css">
        /* ========== 全局样式重置 ========== */
        * {
            box-sizing: border-box;
        }
        
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            color: #2d3748;
            line-height: 1.6;
            margin: 0;
            padding: 0;
        }

        /* ========== 导航栏样式 ========== */
        .x-nav {
            background: linear-gradient(135deg, #2d3748 0%, #4a5568 100%);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            color: white;
            margin-bottom: 24px;
            align-items: center;
            height: auto;
        }

        .layui-breadcrumb a {
            color: rgba(255, 255, 255, 0.9) !important;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .layui-breadcrumb a:hover {
            color: white !important;
            text-shadow: 0 0 8px rgba(255, 255, 255, 0.5);
        }

        .x-nav .layui-btn {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 12px;
            backdrop-filter: blur(10px);
            transition: all 0.3s ease;
        }

        .x-nav .layui-btn:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }

        /* ========== 主容器样式 ========== */
        .x-body {
            padding: 0 24px 24px;
            max-width: 1600px;
            margin: 0 auto;
        }

        /* ========== 搜索区域样式 ========== */
        .search-container {
            background: white;
            border-radius: 20px;
            padding: 24px;
            margin-bottom: 24px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.08);
            border: 1px solid rgba(0, 0, 0, 0.05);
        }

        .x-so {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 16px;
            align-items: end;
        }

        .x-so .layui-input {
            height: 44px;
            border-radius: 12px;
            border: 2px solid #e2e8f0;
            padding: 0 20px;
            font-size: 14px;
            background: #f8fafc;
            color: #2d3748;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .x-so .layui-input:focus {
            border-color: #2d3748;
            background: white;
            box-shadow: 0 0 0 3px rgba(45, 55, 72, 0.1);
            outline: none;
        }

        .x-so .layui-btn {
            height: 44px;
            border-radius: 12px;
            background: linear-gradient(135deg, #2d3748 0%, #4a5568 100%);
            border: none;
            color: white;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(45, 55, 72, 0.3);
        }

        .x-so .layui-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(45, 55, 72, 0.4);
        }

        /* ========== 工具栏样式 ========== */
        xblock {
            background: white;
            border-radius: 20px;
            padding: 20px 24px;
            margin-bottom: 24px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.08);
            border: 1px solid rgba(0, 0, 0, 0.05);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 16px;
        }

        .x-right {
            background: linear-gradient(135deg, #f7fafc 0%, #edf2f7 100%);
            color: #2d3748;
            padding: 12px 20px;
            border-radius: 12px;
            font-weight: 600;
            border: 1px solid #e2e8f0;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        #addStudnetBtn {
            background: linear-gradient(135deg, #2d3748 0%, #4a5568 100%);
            color: white;
            border: none;
            border-radius: 12px;
            padding: 0 24px;
            height: 44px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(45, 55, 72, 0.3);
            margin-right: 12px;
        }

        #addStudnetBtn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(45, 55, 72, 0.4);
            background: linear-gradient(135deg, #1a202c 0%, #2d3748 100%);
        }

        .layui-btn-warm {
            background: linear-gradient(135deg, #718096 0%, #4a5568 100%);
            color: white;
            border: none;
            border-radius: 12px;
            padding: 0 24px;
            height: 44px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(113, 128, 150, 0.3);
        }

        .layui-btn-warm:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(113, 128, 150, 0.4);
            background: linear-gradient(135deg, #4a5568 0%, #2d3748 100%);
        }

        /* ========== 表格样式 ========== */
        .layui-table {
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.08);
            border: 1px solid rgba(0, 0, 0, 0.05);
            text-align: center;
        }

        .layui-table th {
            background: linear-gradient(135deg, #2d3748 0%, #4a5568 100%);
            color: white;
            font-weight: 600;
            font-size: 14px;
            text-align: center;
            padding: 16px 12px;
            border: none;
        }

        .layui-table td {
            color: #2d3748;
            font-size: 14px;
            padding: 16px 12px;
            border-bottom: 1px solid #f7fafc;
            font-weight: 500;
        }

        .layui-table tbody tr {
            transition: all 0.3s ease;
        }

        .layui-table tbody tr:hover {
            background: #f8fafc;
            transform: scale(1.01);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        }

        /* ========== 操作按钮样式 ========== */
        .layui-table a {
            display: inline-flex;
            justify-content: center;
            align-items: center;
            width: 36px;
            height: 36px;
            border-radius: 12px;
            margin: 0 4px;
            transition: all 0.3s ease;
            text-decoration: none;
            border: 2px solid transparent;
        }

        .layui-table a[title="编辑"] {
            background: linear-gradient(135deg, #2d3748 0%, #4a5568 100%);
            color: white;
            box-shadow: 0 4px 15px rgba(45, 55, 72, 0.3);
        }

        .layui-table a[title="编辑"]:hover {
            transform: translateY(-3px) scale(1.1);
            box-shadow: 0 8px 25px rgba(45, 55, 72, 0.4);
        }

        .layui-table a[title="删除"] {
            background: linear-gradient(135deg, #e53e3e 0%, #c53030 100%);
            color: white;
            box-shadow: 0 4px 15px rgba(229, 62, 62, 0.3);
        }

        .layui-table a[title="删除"]:hover {
            transform: translateY(-3px) scale(1.1);
            box-shadow: 0 8px 25px rgba(229, 62, 62, 0.4);
        }

        /* ========== 模态框样式 ========== */
        .layui-form {
            background: white;
            border-radius: 20px;
            padding: 24px;
        }

        .layui-form-item {
            margin-bottom: 20px;
        }

        .layui-form-label {
            color: #2d3748;
            font-weight: 600;
            border-radius: 8px 0 0 8px;
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-right: none;
        }

        .layui-input-block .layui-input {
            border-radius: 0 8px 8px 0;
            border: 1px solid #e2e8f0;
            border-left: none;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .layui-input-block .layui-input:focus {
            border-color: #2d3748;
            box-shadow: 0 0 0 3px rgba(45, 55, 72, 0.1);
        }

        .layui-btn-normal {
            background: linear-gradient(135deg, #2d3748 0%, #4a5568 100%);
            border: none;
            border-radius: 12px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(45, 55, 72, 0.3);
        }

        .layui-btn-normal:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(45, 55, 72, 0.4);
        }

        .layui-btn-primary {
            background: white;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            color: #2d3748;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .layui-btn-primary:hover {
            background: #f8fafc;
            border-color: #2d3748;
            color: #2d3748;
            transform: translateY(-2px);
        }

        /* ========== 响应式设计 ========== */
        @media (max-width: 768px) {
            .x-body {
                padding: 0 16px 16px;
            }
            
            .x-so {
                grid-template-columns: 1fr;
            }
            
            xblock {
                flex-direction: column;
                text-align: center;
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

        .search-container,
        xblock,
        .layui-table {
            animation: fadeInUp 0.6s ease-out;
        }

        xblock {
            animation-delay: 0.1s;
        }

        .layui-table {
            animation-delay: 0.2s;
        }
    </style>
</head>

<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="/findStudent">学生信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="/findStudent" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="search-container">
        <form class="layui-form layui-col-md12 x-so" action="/findStudent" >
            <input class="layui-input" placeholder="请输入姓名" name="s_name" id="s_name">
            <input class="layui-input" placeholder="请输入学号" name="s_studentid" id="s_studentid">
            <input class="layui-input" placeholder="请输入班级编号" name="s_classid" id="s_classid">
            <input class="layui-input" placeholder="请输入班级名" name="s_classname" id="s_classname">

            <input class="layui-input" type="hidden" name="pageIndex" value="1">
            <input class="layui-input" type="hidden" name="pageSize" value="3">
            <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i>搜索</button>
        </form>
    </div>
    <xblock>
        <div>
            <button id="addStudnetBtn" class="layui-btn layui-btn-normal"> <i class="layui-icon">&#xe654;</i>添加 </button>
            <button class="layui-btn layui-btn-warm" lay-filter="toolbarDemo" lay-submit=""><i class="layui-icon">&#xe67c;</i>导出</button>
        </div>
        <span class="x-right" style="line-height:40px">共有数据：${pi.totalCount} 条</span>
    </xblock>

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
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="s_sex" value="男" title="男" checked="">
                        <input type="radio" name="s_sex" value="女" title="女">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">年龄：</label>
                    <div class="layui-input-block">
                        <input type="text" name="s_age" class="layui-input" i placeholder="请输入年龄">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">电话：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="s_phone"  class="layui-input" placeholder="请输入电话">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">班级编号：</label>
                    <div class="layui-input-block">
                        <input type="text" name="s_classid" class="layui-input" placeholder="请输入班级编号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">班级名：</label>
                    <div class="layui-input-block">
                        <input type="text" name="s_classname" class="layui-input" placeholder="请输入班级名">
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



    <%--编辑模态框--%>

    <div class="layui-row" id="updteDiv" style="display: none;">
        <div class="layui-col-md10">
            <form class="layui-form" id="addUpdatForm" >
                <input value="${sessionScope.sid}" type="text"  name="s_id" id="edit_id"/>
                <div class="layui-form-item">
                    <label class="layui-form-label">学号：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="s_studentid" id="edit_studentid"  value=""  class="layui-input" placeholder="请输入学号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="s_name" id="edit_names"  value="" class="layui-input" placeholder="请输入姓名">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="s_sex" id="edit_sex" value="男" title="男" checked="">
                        <input type="radio" name="s_sex" id="edit_sex" value="女" title="女">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">年龄：</label>
                    <div class="layui-input-block">
                        <input type="text" name="s_age" class="layui-input" id="edit_age" value="" placeholder="请输入年龄">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">电话：</label>
                    <div class="layui-input-block">
                        <input type="text"  name="s_phone" id="edit_phone" value="" class="layui-input" placeholder="请输入电话">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">班级编号：</label>
                    <div class="layui-input-block">
                        <input type="text" name="s_classid" id="edit_classids" value="" class="layui-input" placeholder="请输入班级编号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">班级名：</label>
                    <div class="layui-input-block">
                        <input type="text" name="s_classname" id="edit_classname" value="" class="layui-input" placeholder="请输入班级名">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">宿舍编号：</label>
                    <div class="layui-input-block">
                        <input type="text" name="s_dormitoryid"  id="edit_dormitoryids" value="" class="layui-input" placeholder="请输入宿舍编号">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="updateForm">更新</button>
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
            <th>性别</th>
            <th>年龄</th>
            <th>电话</th>
            <th>班级编号</th>
            <th>班级名</th>
            <th>寝室编号</th>
            <th>操作</th>
        </thead>
        <tbody>
<c:forEach items="${pi.list}" var="student">
        <tr>
            <td>${student.s_id}</td>
            <td>${student.s_studentid}</td>
            <td>${student.s_name}</td>
            <td>${student.s_sex}</td>
            <td>${student.s_age}</td>
            <td>${student.s_phone}</td>
            <td>${student.s_classid}</td>
            <td>${student.s_classname}</td>
            <td>${student.s_dormitoryid}</td>
            <td>
                <a title="编辑" id="updateEdit" href="/findStudentById?s_id=${student.s_id}">
                    <i class="layui-icon">&#xe642;</i>
                </a>
                <a title="删除" onclick="member_del(this,'${student.s_id}')" href="javascript:;">
                    <i class="layui-icon">&#xe640;</i>
                </a>
            </td>
        </tr>
</c:forEach>
        </tbody>
    </table>

<div class="" >
    <input type="hidden" id="totalPageCount" value="${pi.pageTotalCount}"/>
    <c:import url="pageBtn.jsp">
        <c:param name="totalCount" value="${pi.totalCount}"/>
        <c:param name="currentPageNo" value="${pi.pageIndex}"/>
        <c:param name="totalPageCount" value="${pi.pageTotalCount}"/>
    </c:import>
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
                url: '/exportstudentlist',
                type: 'post',
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    console.log(data);

                    // 1. 如果需要调整顺序，请执行梳理函数
                    var dt = excel.filterExportData(data, [
                        's_id'
                        ,'s_studentid'
                        ,'s_name'
                        ,'s_sex'
                        ,'s_age'
                        ,'s_phone'
                        ,'s_classid'
                        ,'s_classname'
                        ,'s_dormitoryid'
                    ]);

                    // 2. 数组头部新增表头
                    dt.unshift({s_id: 'ID', s_studentid: '学号', s_name: '姓名', s_sex: '性别', s_age: '年龄', s_phone: '电话', s_classid: '班级编号', s_classname: '班级名', s_dormitoryid: '寝室编号'});

                    // 意思是：A列40px，B列60px(默认)，C列120px，D、E、F等均未定义
                    var colConf = excel.makeColConfig({
                        'B': 90,
                        'C': 80,
                        'F': 90
                    }, 60);

                    var timestart = Date.now();
                    // 3. 执行导出函数，系统会弹出弹框
                    excel.exportExcel({
                        sheet1: dt
                    }, '学生数据.xlsx', 'xlsx', {
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
                    setTimeout(function () {window.location.href='/findStudent';},2000);
                }
            });
        });

        /*添加弹出框*/
        $("#addStudnetBtn").click(function () {
            layer.open({
                type:1,
                title:"添加学生",
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
                    url: '/addStudent',
                    type: "post",
                    data:JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success:function(){
                            layer.msg('添加成功', {icon: 1, time: 3000});
                            setTimeout(function () {window.location.href='/findStudent';},2000);

                    },
                    error:function(){
                        layer.msg('添加失败',{icon:0,time:3000});
                        setTimeout(function () {window.location.href='/findStudent';},2000);
                    }
                });
                // return false;
            });
        });


    });



    /*删除*/
    function member_del(obj,s_id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
           $.get("/deleteStudent",{"s_id":s_id},function (data) {
                if(data =true){
                    layer.msg('删除成功!',{icon:1,time:2000});
                  setTimeout(function () {window.location.href='/findStudent';},2000);

                }else {
                    layer.msg('删除失败!',{icon:0,time:3000});
                    setTimeout(function () {window.location.href='/findStudent';},2000);
                }
            });
        });
    }

</script>


</body>


</html>
