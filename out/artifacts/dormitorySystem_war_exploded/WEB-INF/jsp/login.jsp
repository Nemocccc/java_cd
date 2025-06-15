<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8" />
    <title>学生管理系统登录</title>
    <link rel="icon" href="/images/dor.png" sizes="32x32" />
    <style>
        * { box-sizing: border-box; }
        body {
            margin: 0;
            padding: 0;
            background-color: #fff;
            font-family: "SimSun", serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            position: relative;
            overflow: hidden;
        }

        /* 黑色泡泡动画背景容器 */
        .bubble-bg {
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            pointer-events: none;
            z-index: 0;
            overflow: hidden;
        }

        .bubble {
            position: absolute;
            bottom: -50px;
            background-color: rgba(0, 0, 0, 0.15);
            border-radius: 50%;
            opacity: 0.7;
            animation: rise 10s linear infinite;
        }

        @keyframes rise {
            0% {
                transform: translateY(0) scale(1);
                opacity: 0.7;
            }
            100% {
                transform: translateY(-110vh) scale(1.5);
                opacity: 0;
            }
        }

        .title {
            font-size: 36px;
            font-weight: bold;
            color: #000;
            margin-bottom: 40px;
            font-family: "SimSun", serif;
            z-index: 1;
            position: relative;
        }

        .panel {
            background-color: #fff;
            padding: 40px;
            border-radius: 12px;
            width: 320px;
            text-align: center;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
            border: 1px solid #ccc;
            color: #000;
            font-family: "SimSun", serif;
            z-index: 1;
            position: relative;
        }

        .top p {
            font-size: 20px;
            margin-bottom: 20px;
            color: #000;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 14px;
        }

        .input {
            padding: 12px;
            border: none;
            border-radius: 6px;
            background-color: rgb(211, 211, 211);
            color: #000;
            font-size: 14px;
            font-family: "SimSun", serif;
        }

        .input::placeholder {
            color: #666;
        }

        .input:focus {
            outline: none;
            background-color: #e0e0e0;
        }

        .submit-btn {
            padding: 12px;
            background-color: #000;
            border: none;
            border-radius: 6px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
            font-family: "SimSun", serif;
        }

        .submit-btn:hover:not(:disabled) {
            background-color: #222;
        }

        .submit-btn:disabled {
            background-color: #555;
            cursor: not-allowed;
        }

        .error {
            color: #ff4d4f;
            font-size: 13px;
            min-height: 18px;
            font-family: "SimSun", serif;
        }

        .footer {
            margin-top: 30px;
            color: #999;
            font-size: 12px;
            font-family: "SimSun", serif;
            z-index: 1;
            position: relative;
        }

        .spinner {
            border: 3px solid #999;
            border-top: 3px solid #000;
            border-radius: 50%;
            width: 16px;
            height: 16px;
            animation: spin 1s linear infinite;
            display: inline-block;
            vertical-align: middle;
            margin-left: 8px;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>

<div class="bubble-bg" id="bubbleBg"></div>

<div class="title">综合服务学工平台</div>

<div class="panel">
    <div class="top">
        <p>账户登录</p>
    </div>
    <form id="loginForm" action="/login" method="post">
        <span class="error">${msg}</span>
        <input type="text" name="a_username" placeholder="请输入用户名" class="input" required />
        <input type="password" name="a_password" placeholder="请输入密码" class="input" required />
        <button id="loginBtn" type="submit" class="submit-btn">登录</button>
    </form>
</div>

<div class="footer">
    课程设计 JavaWeb 综合服务学工平台
</div>

<script>
    document.getElementById("loginForm").addEventListener("submit", function(e) {
        const btn = document.getElementById("loginBtn");
        btn.disabled = true;
        btn.innerHTML = '登录中 <span class="spinner"></span>';
    });

    // 生成泡泡
    const bubbleBg = document.getElementById('bubbleBg');

    function createBubble() {
        const bubble = document.createElement('div');
        bubble.classList.add('bubble');
        const size = Math.random() * 30 + 10; // 10px ~ 40px
        bubble.style.width = size + 'px';
        bubble.style.height = size + 'px';
        bubble.style.left = Math.random() * 100 + 'vw';
        bubble.style.animationDuration = (5 + Math.random() * 5) + 's';
        bubbleBg.appendChild(bubble);

        // 动画结束后移除泡泡
        bubble.addEventListener('animationend', () => {
            bubble.remove();
        });
    }

    // 定时生成泡泡
    setInterval(createBubble, 300);
</script>

</body>
</html>
