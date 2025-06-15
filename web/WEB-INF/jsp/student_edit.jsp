<%--
  Created by IntelliJ IDEA.
  User: nemo
  Date: 2025/6/14
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
    <title>学生信息修改</title>
    <link rel="icon" href="/images/favicon.ico" sizes="32x32" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <link rel="stylesheet" href="/css/pg_btn.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            color: #2d3748;
        }

        .form-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            padding: 48px;
            border: 1px solid rgba(0, 0, 0, 0.05);
            backdrop-filter: blur(10px);
            position: relative;
            overflow: hidden;
        }

        .form-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(135deg, #2d3748 0%, #4a5568 100%);
        }

        .form-title {
            text-align: center;
            color: #2d3748;
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 40px;
            position: relative;
            letter-spacing: -0.5px;
        }

        .form-title::after {
            content: "";
            position: absolute;
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: linear-gradient(135deg, #2d3748 0%, #4a5568 100%);
            border-radius: 2px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 24px;
            margin-bottom: 32px;
        }

        .form-group {
            position: relative;
        }

        .form-label {
            color: #4a5568;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 8px;
            display: block;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .form-input {
            width: 100%;
            padding: 16px 20px;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            font-size: 16px;
            color: #2d3748;
            background: #f8fafc;
            transition: all 0.3s ease;
            font-weight: 500;
            outline: none;
        }

        .form-input:focus {
            border-color: #2d3748;
            background: white;
            box-shadow: 0 0 0 3px rgba(45, 55, 72, 0.1);
            transform: translateY(-2px);
        }

        .radio-group {
            display: flex;
            gap: 20px;
            margin-top: 8px;
        }

        .radio-item {
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
            padding: 8px 16px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .radio-item:hover {
            background: #f8fafc;
        }

        .radio-item input[type="radio"] {
            width: 18px;
            height: 18px;
            accent-color: #2d3748;
            cursor: pointer;
        }

        .radio-item label {
            color: #4a5568;
            font-weight: 500;
            cursor: pointer;
        }

        .submit-container {
            display: flex;
            justify-content: center;
            margin-top: 40px;
        }

        .submit-btn {
            background: linear-gradient(135deg, #2d3748 0%, #4a5568 100%);
            color: white;
            border: none;
            border-radius: 12px;
            padding: 16px 40px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            min-width: 200px;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 8px;
            box-shadow: 0 8px 25px rgba(45, 55, 72, 0.3);
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .submit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 35px rgba(45, 55, 72, 0.4);
            background: linear-gradient(135deg, #1a202c 0%, #2d3748 100%);
        }

        .submit-btn:active {
            transform: translateY(-1px);
            box-shadow: 0 8px 20px rgba(45, 55, 72, 0.3);
        }

        /* 隐藏默认layui样式 */
        .layui-input-inline {
            display: block;
        }

        .layui-form-label {
            display: none;
        }

        .layui-form-item {
            margin: 0;
        }

        /* 响应式设计 */
        @media (max-width: 768px) {
            .form-container {
                padding: 32px 24px;
                margin: 10px;
            }

            .form-title {
                font-size: 24px;
                margin-bottom: 32px;
            }

            .form-grid {
                grid-template-columns: 1fr;
                gap: 20px;
            }

            .form-input {
                padding: 14px 16px;
                font-size: 15px;
            }

            .submit-btn {
                padding: 14px 32px;
                font-size: 15px;
                min-width: 180px;
            }
        }

        /* 加载动画 */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .form-container {
            animation: fadeInUp 0.6s ease-out;
        }

        .form-group {
            animation: fadeInUp 0.6s ease-out;
            animation-fill-mode: both;
        }

        .form-group:nth-child(1) { animation-delay: 0.1s; }
        .form-group:nth-child(2) { animation-delay: 0.2s; }
        .form-group:nth-child(3) { animation-delay: 0.3s; }
        .form-group:nth-child(4) { animation-delay: 0.4s; }
        .form-group:nth-child(5) { animation-delay: 0.5s; }
        .form-group:nth-child(6) { animation-delay: 0.6s; }
        .form-group:nth-child(7) { animation-delay: 0.7s; }
        .form-group:nth-child(8) { animation-delay: 0.8s; }

        /* 性别选择特殊样式 */
        .gender-group {
            grid-column: 1 / -1;
        }
    </style>
</head>

<body>
<div class="form-container">
    <h2 class="form-title">学生信息修改</h2>

    <form class="layui-form" action="/updateStudent" method="post" id="f_auto" accept-charset="UTF-8">
        <input type="hidden" value="${sessionScope.s.s_id}" name="s_id" id="s_id"/>
        
        <div class="form-grid">
            <div class="form-group">
                <label class="form-label" for="s_studentid">学号</label>
                <input type="text" id="s_studentid" name="s_studentid"
                       autocomplete="off" value="${sessionScope.s.s_studentid}" 
                       class="form-input" placeholder="请输入学号">
            </div>

            <div class="form-group">
                <label class="form-label" for="s_name">姓名</label>
                <input type="text" id="s_name" name="s_name"
                       autocomplete="off" value="${sessionScope.s.s_name}" 
                       class="form-input" placeholder="请输入姓名">
            </div>

            <div class="form-group gender-group">
                <label class="form-label">性别</label>
                <div class="radio-group">
                    <div class="radio-item">
                        <input type="radio" name="s_sex" id="s_male" value="男" title="男" checked="">
                        <label for="s_male">男</label>
                    </div>
                    <div class="radio-item">
                        <input type="radio" name="s_sex" id="s_female" value="女" title="女">
                        <label for="s_female">女</label>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label" for="s_age">年龄</label>
                <input type="text" id="s_age" name="s_age"
                       autocomplete="off" value="${sessionScope.s.s_age}" 
                       class="form-input" placeholder="请输入年龄">
            </div>

            <div class="form-group">
                <label class="form-label" for="s_phone">电话</label>
                <input type="text" id="s_phone" name="s_phone"
                       autocomplete="off" value="${sessionScope.s.s_phone}" 
                       class="form-input" placeholder="请输入电话">
            </div>

            <div class="form-group">
                <label class="form-label" for="s_classid">班级编号</label>
                <input type="text" id="s_classid" name="s_classid"
                       autocomplete="off" value="${sessionScope.s.s_classid}" 
                       class="form-input" placeholder="请输入班级编号">
            </div>

            <div class="form-group">
                <label class="form-label" for="s_classname">班级名</label>
                <input type="text" id="s_classname" name="s_classname"
                       autocomplete="off" value="${sessionScope.s.s_classname}" 
                       class="form-input" placeholder="请输入班级名">
            </div>

            <div class="form-group">
                <label class="form-label" for="s_dormitoryid">寝室编号</label>
                <input type="text" id="s_dormitoryid" name="s_dormitoryid"
                       autocomplete="off" value="${sessionScope.s.s_dormitoryid}" 
                       class="form-input" placeholder="请输入寝室编号">
            </div>
        </div>

        <div class="submit-container">
            <button class="submit-btn" id="btn_on" lay-filter="updateForm" lay-submit="">
                <i class="layui-icon">&#xe605;</i>修改信息
            </button>
        </div>
    </form>
</div>

<script>
    // 增强交互效果
    document.addEventListener('DOMContentLoaded', function() {
        const inputs = document.querySelectorAll('.form-input');
        
        inputs.forEach(input => {
            input.addEventListener('focus', function() {
                this.parentNode.classList.add('focused');
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

        // 性别选择初始化
        const sexValue = '${sessionScope.s.s_sex}';
        if (sexValue === '女') {
            document.getElementById('s_female').checked = true;
        }

        // 按钮点击效果
        const submitBtn = document.getElementById('btn_on');
        if (submitBtn) {
            submitBtn.addEventListener('mousedown', function() {
                this.style.transform = 'translateY(-1px)';
            });

            submitBtn.addEventListener('mouseup', function() {
                this.style.transform = 'translateY(-3px)';
            });
        }
    });
</script>
</body>
</html>
