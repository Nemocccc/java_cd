<%--
  Created by IntelliJ IDEA.
  User: 郑瑞璟
  Date: 2025/5/2
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生卫生信息修改</title>
    <link rel="icon" href="/images/favicon.ico" sizes="32x32">
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Microsoft YaHei", sans-serif;
        }

        body {
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .form-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.08);
            width: 100%;
            max-width: 500px;
            padding: 40px;
        }

        .form-title {
            text-align: center;
            color: #333;
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 35px;
            position: relative;
            padding-bottom: 15px;
        }

        .form-title::after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 3px;
            background: linear-gradient(to right, #4a90e2, #5ca8ff);
            border-radius: 2px;
        }

        .form-group {
            margin-bottom: 25px;
            display: flex;
            flex-direction: column;
        }

        .form-label {
            color: #555;
            font-size: 16px;
            font-weight: 500;
            margin-bottom: 8px;
        }

        .form-input {
            width: 100%;
            padding: 14px 18px;
            border: 1px solid #d9d9d9;
            border-radius: 6px;
            font-size: 16px;
            color: #333;
            background-color: #f9f9f9;
            transition: all 0.3s ease;
            box-sizing: border-box;
        }

        .form-input:focus {
            border-color: #5ba0e6;
            background-color: #fff;
            box-shadow: 0 0 0 3px rgba(88, 157, 245, 0.15);
            outline: none;
        }

        .submit-btn-container {
            margin-top: 30px;
            display: flex;
            justify-content: center;
        }

        .submit-btn {
            background: linear-gradient(to right, #424e68, #393D49);
            color: #fff;
            border: none;
            border-radius: 6px;
            padding: 14px 36px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            min-width: 180px;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0 4px 12px rgba(57, 61, 73, 0.2);
        }

        .submit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 15px rgba(57, 61, 73, 0.3);
        }

        .submit-btn:active {
            transform: translateY(0);
            box-shadow: 0 2px 5px rgba(57, 61, 73, 0.3);
        }

        .input-hint {
            margin-top: 8px;
            font-size: 13px;
            color: #888;
            line-height: 1.5;
        }

        .hidden-fields {
            display: none;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2 class="form-title">学生卫生信息修改</h2>

    <form class="layui-form" id="f_auto" action="/updateStudentClean" method="post">
        <div class="hidden-fields">
            <input type="hidden" value="${sessionScope.d.g_id}" name="g_id" id="g_id"/>
            <input type="hidden" value="${sessionScope.d.update_time}" name="update_time" id="update_time"/>
        </div>

        <div class="form-group">
            <label class="form-label" for="s_studentid">
                <span>学号</span>
            </label>
            <input type="text" id="s_studentid" name="s_studentid"
                   autocomplete="off" value="${sessionScope.d.s_studentid}" class="form-input">
            <div class="input-hint">请输入学生学号（如：20230001）</div>
        </div>

        <div class="form-group">
            <label class="form-label" for="s_name">
                <span>姓名</span>
            </label>
            <input type="text" id="s_name" name="s_name"
                   autocomplete="off" value="${sessionScope.d.s_name}" class="form-input">
            <div class="input-hint">请输入学生姓名</div>
        </div>

        <div class="form-group">
            <label class="form-label" for="s_grade">
                <span>卫生打分</span>
            </label>
            <input type="text" id="s_grade" name="s_grade"
                   autocomplete="off" value="${sessionScope.d.s_grade}" class="form-input">
            <div class="input-hint">请输入0-10分的卫生评分</div>
        </div>

        <div class="form-group">
            <label class="form-label" for="s_classid">
                <span>班级编号</span>
            </label>
            <input type="text" id="s_classid" name="s_classid"
                   autocomplete="off" value="${sessionScope.d.s_classid}" class="form-input">
            <div class="input-hint">请输入班级编号（如：CS2023）</div>
        </div>

        <div class="form-group">
            <label class="form-label" for="s_dormitoryid">
                <span>寝室编号</span>
            </label>
            <input type="text" id="s_dormitoryid" name="s_dormitoryid"
                   autocomplete="off" value="${sessionScope.d.s_dormitoryid}" class="form-input">
            <div class="input-hint">请输入寝室编号（如：24-301）</div>
        </div>

        <div class="submit-btn-container">
            <button class="submit-btn" id="btn_on" lay-submit="" lay-filter="updateClass">
                <i class="layui-icon">&#xe605;</i>&nbsp;&nbsp;确认修改
            </button>
        </div>
    </form>
</div>

<script>
    // 输入框聚焦效果
    const inputs = document.querySelectorAll('.form-input');
    inputs.forEach(input => {
        input.addEventListener('focus', function() {
            this.style.borderColor = '#5b9be6';
            this.style.boxShadow = '0 0 0 3px rgba(91, 155, 230, 0.18)';
        });

        input.addEventListener('blur', function() {
            this.style.borderColor = '#d9d9d9';
            this.style.boxShadow = 'none';
        });
    });

    // 按钮动效
    const submitBtn = document.getElementById('btn_on');
    if (submitBtn) {
        submitBtn.addEventListener('mousedown', function() {
            this.style.transform = 'translateY(0)';
        });

        submitBtn.addEventListener('mouseup', function() {
            this.style.transform = 'translateY(-3px)';
        });
    }
</script>
</body>
</html>