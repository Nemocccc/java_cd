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
    <title>宿舍卫生信息修改</title>
    <link rel="icon" href="/images/favicon.ico" sizes="32x32">
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <style>
        body {
            background-color: #f0f2f5;
            font-family: "Microsoft YaHei", sans-serif;
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
    </style>
</head>
<body>
<div class="form-container">
    <h2 class="form-title">宿舍卫生信息修改</h2>

    <form class="layui-form" id="f_auto" action="/updateDormClean" method="post">
        <input type="hidden" value="${sessionScope.d.g_id}" name="g_id" id="g_id"/>

        <div class="form-group">
            <label class="form-label" for="d_id">
                <span>宿舍编号</span>
            </label>
            <input type="text" id="d_id" name="d_id"
                   autocomplete="off" value="${sessionScope.d.d_id}" class="form-input">
            <div class="input-hint">请输入宿舍编号（如：301）</div>
        </div>

        <div class="form-group">
            <label class="form-label" for="d_dormbuilding">
                <span>宿舍楼</span>
            </label>
            <input type="text" id="d_dormbuilding" name="d_dormbuilding"
                   autocomplete="off" value="${sessionScope.d.d_dormbuilding}" class="form-input">
            <div class="input-hint">请输入宿舍楼名称（如：24号楼）</div>
        </div>

        <div class="form-group">
            <label class="form-label" for="d_grade">
                <span>卫生打分</span>
            </label>
            <input type="text" id="d_grade" name="d_grade"
                   autocomplete="off" value="${sessionScope.d.d_grade}" class="form-input">
            <div class="input-hint">请输入0-10分的卫生评分</div>
        </div>

        <input type="hidden" value="${sessionScope.d.update_time}" name="update_time" id="update_time"/>

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