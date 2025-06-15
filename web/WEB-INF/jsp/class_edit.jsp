<%--
  Created by IntelliJ IDEA.
  User: 邓成杰
  Date: 2025/6/2
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改信息</title>
    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif;
            background: #f8f9fa;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            color: #212529;
        }

        .container {
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.12);
            padding: 48px 40px;
            width: 100%;
            max-width: 500px;
            border: 1px solid #e9ecef;
        }

        h1 {
            color: #212529;
            font-size: 32px;
            font-weight: 700;
            text-align: center;
            margin-bottom: 40px;
            letter-spacing: -0.5px;
        }

        .form-group {
            margin-bottom: 28px;
        }

        .form-label {
            display: block;
            color: #495057;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 8px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .form-input {
            width: 100%;
            padding: 16px 20px;
            border: 2px solid #dee2e6;
            border-radius: 12px;
            font-size: 16px;
            color: #212529;
            background: #ffffff;
            transition: all 0.3s ease;
            outline: none;
            font-weight: 500;
        }

        .form-input:focus {
            border-color: #212529;
            box-shadow: 0 0 0 3px rgba(33, 37, 41, 0.1);
            transform: translateY(-1px);
        }

        .form-input::placeholder {
            color: #adb5bd;
            font-weight: 400;
        }

        .submit-btn {
            width: 100%;
            padding: 18px 32px;
            background: #212529;
            color: #ffffff;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 20px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .submit-btn:hover {
            background: #495057;
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(33, 37, 41, 0.2);
        }

        .submit-btn:active {
            transform: translateY(0);
            box-shadow: 0 4px 15px rgba(33, 37, 41, 0.15);
        }

        .hidden-input {
            display: none;
        }

        /* 装饰线条 */
        .container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 4px;
            background: #212529;
            margin-top: -2px;
        }

        .container {
            position: relative;
        }

        /* 响应式设计 */
        @media (max-width: 768px) {
            .container {
                padding: 32px 24px;
                margin: 10px;
            }

            h1 {
                font-size: 28px;
                margin-bottom: 32px;
            }

            .form-input {
                padding: 14px 16px;
                font-size: 15px;
            }

            .submit-btn {
                padding: 16px 28px;
                font-size: 15px;
            }
        }

        /* 输入框错误状态 */
        .form-input.error {
            border-color: #dc3545;
            background: #fff5f5;
        }

        .form-input.error:focus {
            border-color: #dc3545;
            box-shadow: 0 0 0 3px rgba(220, 53, 69, 0.1);
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

        .container {
            animation: fadeInUp 0.5s ease-out;
        }

        /* 聚焦状态的标签动画 */
        .form-group.focused .form-label {
            color: #212529;
        }

        /* 分割线 */
        .divider {
            height: 1px;
            background: #e9ecef;
            margin: 32px 0;
        }
    </style>
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
</head>
<body>
<div class="container">
    <h1>修改班级信息</h1>

    <form class="layui-form" id="f_auto" action="/updateClass" method="post">
        <input type="hidden" value="${sessionScope.c.c_id}" name="c_id" id="c_id" class="hidden-input"/>

        <div class="form-group">
            <label for="c_classid" class="form-label">班级编号</label>
            <input type="text"
                   id="c_classid"
                   name="c_classid"
                   class="form-input"
                   autocomplete="off"
                   value="${sessionScope.c.c_classid}"
                   placeholder="请输入班级编号">
        </div>

        <div class="form-group">
            <label for="c_classname" class="form-label">班级名称</label>
            <input type="text"
                   id="c_classname"
                   name="c_classname"
                   class="form-input"
                   autocomplete="off"
                   value="${sessionScope.c.c_classname}"
                   placeholder="请输入班级名称">
        </div>

        <div class="form-group">
            <label for="c_counsellor" class="form-label">辅导员姓名</label>
            <input type="text"
                   id="c_counsellor"
                   name="c_counsellor"
                   class="form-input"
                   autocomplete="off"
                   value="${sessionScope.c.c_counsellor}"
                   placeholder="请输入辅导员姓名">
        </div>

        <div class="divider"></div>

        <div class="form-group">
            <button type="submit"
                    class="submit-btn"
                    id="btn_on"
                    lay-submit=""
                    lay-filter="updateClass">
                修改
            </button>
        </div>
    </form>
</div>

<script>
    // 表单验证和提交处理
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('f_auto');
        const inputs = document.querySelectorAll('.form-input');

        // 添加输入框动态效果
        inputs.forEach(input => {
            input.addEventListener('focus', function() {
                this.parentNode.classList.add('focused');
                this.classList.remove('error');
            });

            input.addEventListener('blur', function() {
                if (!this.value) {
                    this.parentNode.classList.remove('focused');
                }
            });

            // 初始化已有值的输入框
            if (input.value) {
                input.parentNode.classList.add('focused');
            }
        });

        // 表单提交前验证
        form.addEventListener('submit', function(e) {
            let isValid = true;
            const requiredFields = ['c_classid', 'c_classname', 'c_counsellor'];

            requiredFields.forEach(fieldId => {
                const field = document.getElementById(fieldId);
                if (!field.value.trim()) {
                    isValid = false;
                    field.classList.add('error');
                    if (isValid) field.focus(); // 只聚焦第一个错误字段
                } else {
                    field.classList.remove('error');
                }
            });

            if (!isValid) {
                e.preventDefault();
                // 可以添加更优雅的错误提示
                showErrorMessage('请填写所有必填字段！');
            }
        });

        // 简单的错误提示函数
        function showErrorMessage(message) {
            // 创建临时提示元素
            const errorDiv = document.createElement('div');
            errorDiv.style.cssText = `
                    position: fixed;
                    top: 20px;
                    left: 50%;
                    transform: translateX(-50%);
                    background: #212529;
                    color: white;
                    padding: 12px 24px;
                    border-radius: 8px;
                    font-size: 14px;
                    z-index: 1000;
                    animation: fadeInUp 0.3s ease;
                `;
            errorDiv.textContent = message;
            document.body.appendChild(errorDiv);

            // 3秒后移除
            setTimeout(() => {
                errorDiv.style.animation = 'fadeOut 0.3s ease';
                setTimeout(() => {
                    document.body.removeChild(errorDiv);
                }, 300);
            }, 3000);
        }
    });
</script>
</body>
</html>
