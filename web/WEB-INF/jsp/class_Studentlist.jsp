<%--
  Created by IntelliJ IDEA.
  User: 邓成杰
  Date: 2025/6/2
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  import="com.itheima.po.Dormitory" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>班级学生管理</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />

    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>

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
            max-width: 1400px;
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
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
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
            justify-content: center;
        }

        .search-btn:hover {
            background: #495057;
        }

        /* 表格样式 */
        .table-section {
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
            overflow: hidden;
            margin-bottom: 24px;
        }

        .table-header {
            background: #f8f9fa;
            padding: 20px 24px;
            border-bottom: 1px solid #e9ecef;
        }

        .table-title {
            font-size: 18px;
            font-weight: 600;
            color: #212529;
        }

        .modern-table {
            width: 100%;
            border-collapse: collapse;
        }

        .modern-table th {
            background: #f8f9fa;
            padding: 16px 12px;
            text-align: center;
            font-weight: 600;
            color: #495057;
            border-bottom: 2px solid #e9ecef;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .modern-table td {
            padding: 16px 12px;
            border-bottom: 1px solid #f1f3f4;
            color: #212529;
            text-align: center;
            vertical-align: middle;
            font-size: 14px;
        }

        .modern-table tr:hover {
            background: #f8f9fa;
        }

        /* 班级信息高亮 */
        .class-info {
            background: #f8f9fa;
            font-weight: 500;
        }

        /* 学生信息样式 */
        .student-row {
            transition: background-color 0.3s ease;
        }

        .student-row:nth-child(even) {
            background: #fafbfc;
        }

        /* 表格内容区分 */
        .class-cell {
            background: #e9ecef;
            font-weight: 600;
            color: #495057;
        }

        /* 空状态 */
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #6c757d;
        }

        .empty-icon {
            font-size: 48px;
            margin-bottom: 16px;
            opacity: 0.5;
        }

        .empty-text {
            font-size: 16px;
            margin-bottom: 8px;
        }

        .empty-subtext {
            font-size: 14px;
            opacity: 0.7;
        }

        /* 响应式设计 */
        @media (max-width: 1200px) {
            .modern-table {
                font-size: 12px;
            }

            .modern-table th,
            .modern-table td {
                padding: 12px 8px;
            }
        }

        @media (max-width: 768px) {
            .main-container {
                padding: 0 16px;
            }

            .search-form {
                grid-template-columns: 1fr;
            }

            .modern-table {
                font-size: 11px;
            }

            .modern-table th,
            .modern-table td {
                padding: 10px 6px;
            }

            .page-title {
                font-size: 24px;
            }

            .table-section {
                overflow-x: auto;
            }
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

        .table-section {
            animation-delay: 0.2s;
        }
    </style>
</head>

<body>
<!-- 顶部导航 -->
<div class="top-nav">
    <div class="breadcrumb">
        <a href="">首页</a>
        <span>/</span>
        <a href="/findClassStudent">班级学生</a>
    </div>
    <button class="refresh-btn" onclick="window.location.href='/findClassStudent'" title="刷新">
        刷新
    </button>
</div>

<div class="main-container">
    <!-- 页面标题 -->
    <div class="page-header">
        <div class="page-title">班级学生管理</div>
        <div class="page-subtitle">查看和管理各班级的学生信息</div>
    </div>

    <!-- 搜索区域 -->
    <div class="search-section">
        <form class="search-form layui-form" action="/findClassStudent">
            <input class="form-input" placeholder="请输入班级编号" name="c_classid" id="c_classid">
            <input class="form-input" placeholder="请输入班级名称" name="c_classname" id="c_classname">
            <button class="search-btn" lay-submit lay-filter="search">
                <span>🔍</span>
                搜索
            </button>
        </form>
    </div>

    <!-- 表格区域 -->
    <div class="table-section">
        <div class="table-header">
            <div class="table-title">班级学生详情</div>
        </div>

        <c:choose>
            <c:when test="${not empty cs}">
                <table class="modern-table" id="tb">
                    <thead>
                    <tr>
                        <th>班级编号</th>
                        <th>班级名称</th>
                        <th>辅导员</th>
                        <th>学生学号</th>
                        <th>学生姓名</th>
                        <th>联系电话</th>
                        <th>宿舍编号</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!--将返回的Model数据的students集合分步提取出来，循环遍历-->
                    <!--前一段为Class数据，后面多段为Student数据-->
                    <!--返回数据不受刷新影响，原本就包含在页面中-->
                    <c:forEach items="${cs}" var="c">
                        <c:set value="${c.students}" var="cc" />
                        <c:forEach items="${cc}" var="sc" varStatus="status">
                            <tr class="student-row">
                                <td class="${status.first ? 'class-cell' : ''}">${c.c_classid}</td>
                                <td class="${status.first ? 'class-cell' : ''}">${c.c_classname}</td>
                                <td class="${status.first ? 'class-cell' : ''}">${c.c_counsellor}</td>
                                <td>${sc.s_studentid}</td>
                                <td>${sc.s_name}</td>
                                <td>${sc.s_phone}</td>
                                <td>${sc.s_dormitoryid}</td>
                            </tr>
                        </c:forEach>
                    </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="empty-state">
                    <div class="empty-icon">📚</div>
                    <div class="empty-text">暂无班级学生数据</div>
                    <div class="empty-subtext">请尝试调整搜索条件或联系管理员</div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<script>
    // 页面加载完成后的初始化
    document.addEventListener('DOMContentLoaded', function() {
        // 为表格行添加交互效果
        const tableRows = document.querySelectorAll('.student-row');
        tableRows.forEach(row => {
            row.addEventListener('mouseenter', function() {
                this.style.transform = 'translateX(2px)';
            });

            row.addEventListener('mouseleave', function() {
                this.style.transform = 'translateX(0)';
            });
        });

        // 搜索表单增强
        const searchInputs = document.querySelectorAll('.form-input');
        searchInputs.forEach(input => {
            input.addEventListener('keypress', function(e) {
                if (e.key === 'Enter') {
                    document.querySelector('.search-btn').click();
                }
            });
        });

        // 表格数据统计
        const totalRows = document.querySelectorAll('.student-row').length;
        if (totalRows > 0) {
            console.log(`当前显示 ${totalRows} 条学生记录`);
        }
    });

    <!--本想采用Ajax来提交表单,实现异步刷新,但是layui的iframe每次会自动刷新还原为页面-->
    // layui.use(['jquery','form','layer','laydate'], function(){
    //     var form = layui.form,
    //         $ = layui.jquery,
    //         laydate = layui.laydate;
    //
    //     form.on('submit(search)', function(data){
    //
    //         var param = data.field;
    //         console.log(JSON.stringify(param));
    //
    //         $.ajax({
    //             url: '/findClassStudentlist',
    //             type: 'post',
    //             data:JSON.stringify(param),
    //             dataType: 'json',
    //             async: false,
    //             contentType: "application/json; charset=utf-8",
    //             success: function (dd) {
    //
    //将获取的JSON数据分步提取出来，前一段为Class数据，后面多段为Student数据
    //                 var s= '';
    //                 for(var i in dd){
    //                    var c_classid = dd[i].c_classid;
    //                    var c_classname = dd[i].c_classname;
    //                    var c_counsellor = dd[i].c_counsellor;
    //                    var students = dd[i].students;
    //                 }
    //
    //拼接异步刷新的表格部分，将数据一起拼接成HTML
    //                 for(var j in students){
    //                     var s_studentid = students[j].s_studentid;
    //                     var s_name = students[j].s_name;
    //                     var s_phone = students[j].s_phone;
    //                     var s_dormitoryid = students[j].s_dormitoryid;
    //                     s += '<tr><td>'+c_classid+'</td><td>'+c_classname+'</td><td>'+c_counsellor+'</td><td>'+
    //                         s_studentid+'</td><td>'+s_name+'</td><td>'+s_phone+'</td><td>'+s_dormitoryid+'</td></tr>';
    //                     //console.log(s_studentid);
    //                 }
    //
    //                 setTimeout(function () {window.location.href='/findClassStudent';},2000);
    //                 console.log(s);

    //将刷新部分拼接到表格需要刷新的地方
    //                 $('#tbb').append(s);
    //
    //             },
    //             error: function () {
    //                 setTimeout(function () {window.location.href='/findClassStudent';},2000);
    //             }
    //         });
    //     });
    //
    // });
</script>

</body>
</html>
