<%@ page contentType="text/html;charset=UTF-8" language="java"  import="com.itheima.po.Dormitory" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>宿舍学生信息</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />

    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <link rel="stylesheet" href="./css/pg_btn.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>

    <style type="text/css">
        * {
            font-family: "SimSun", serif !important;
            text-align: center;
        }

        .layui-table {
            width: 100%;
            border-collapse: collapse;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        .layui-table th, .layui-table td {
            padding: 12px;
            font-size: 14px;
            border: 1px solid #eee;
        }

        .layui-table th {
            background-color: #2b2b2b;
            color: white;
        }

        .layui-table td {
            background-color: white;
            color: black;
        }
        .layui-table th, .layui-table td {
            padding: 12px;
            font-size: 14px;
            border: 1px solid #eee;
            text-align: center; /* ➕ 添加这一行，确保所有单元格居中 */
        }
        /* 搜索输入框 */
        .layui-input {
            border-radius: 12px;
            padding: 10px;
            border: 1px solid #ccc;
            background: #f9f9f9;
            margin-right: 8px;
        }

        /* 通用按钮样式（黑白） */
        .layui-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background-color: #000 !important;
            color: #fff !important;
            border-radius: 12px;
            padding: 10px 20px;
            font-size: 14px;
            border: none;
            font-weight: bold;
        }

        .layui-btn:hover {
            background-color: #333 !important;
        }

        .layui-btn i {
            font-size: 16px;
            margin-right: 6px;
        }

        /* 替换彩色按钮背景 */
        .layui-btn-warm,
        .layui-btn-normal {
            background-color: #000 !important;
            color: #fff !important;
        }

        /* 面包屑导航 */
        .x-nav {
            font-size: 16px;
            font-weight: 600;
            color: #2D3748;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 15px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            margin-bottom: 20px;
        }

        .x-body {
            padding: 20px;
            background-color: #f5f7fa;
            border-radius: 12px;
        }

        /* 泡泡背景样式 */
        #bubble-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            pointer-events: none;
            z-index: -1;
        }

        .bubble {
            position: absolute;
            bottom: -40px;
            background-color: rgba(0,0,0,0.3);
            border-radius: 50%;
            opacity: 0.6;
            animation-name: floatUp;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
        }

        @keyframes floatUp {
            0% {
                transform: translateY(0) scale(1);
                opacity: 0.6;
            }
            50% {
                opacity: 0.4;
            }
            100% {
                transform: translateY(-110vh) scale(1.2);
                opacity: 0;
            }
        }
    </style>

</head>

<body>
<div class="x-nav">
    <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="/findDormitoryStudent">人员信息</a>
    </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="/findDormitoryStudent" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i>
    </a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="/findDormitoryStudent">
            <input class="layui-input" placeholder="请输入宿舍编号" name="s_dormitoryid" id="s_dormitoryid">
            <button class="layui-btn" lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>

    <%-- 表格数据 --%>
    <table class="layui-table">
        <thead>
        <tr>
            <th>宿舍编号</th>
            <th>宿舍楼</th>
            <th>已用床位</th>
            <th>学生姓名</th>
            <th>电话</th>
            <th>班级编号</th>
            <th>班级名</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${ds}" var="d">
            <c:set value="${d.students}" var="dd"/>
            <c:forEach items="${dd}" var="sd">
                <tr>
                    <td>${d.s_dormitoryid}</td>
                    <td>${d.d_dormbuilding}</td>
                    <td>${d.d_bed}</td>
                    <td>${sd.s_name}</td>
                    <td>${sd.s_phone}</td>
                    <td>${sd.s_classid}</td>
                    <td>${sd.s_classname}</td>
                </tr>
            </c:forEach>
        </c:forEach>
        </tbody>
    </table>
</div>

<script>
    layui.use(['jquery', 'form', 'layer'], function() {
        var form = layui.form,
            $ = layui.jquery;

        // Form submit action
        form.on('submit(sreach)', function(data) {
            // Custom logic here for search functionality
        });
    });
</script>

</body>
</html>
