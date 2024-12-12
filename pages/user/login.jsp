<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 로그아웃 처리: 쿼리 파라미터로 로그아웃 요청인지 확인
    String action = request.getParameter("action");
    if ("logout".equalsIgnoreCase(action)) {
        // 세션 무효화
        session.invalidate();
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="../../static/css/login.css">
</head>
<body>
    <header class="navbar">
        <div class="logo">Travelo</div>
        <div class="search-bar">
            <input type="text" placeholder="검색">
        </div>
        <nav>
            <ul>
                <li><a href="#">홈</a></li>
                <li><a href="#">여행사</a></li>
                <li><a href="#">여행지 추천</a></li>
                <li><a href="#">커뮤니티</a></li>
            </ul>
        </nav>
        <div class="auth-buttons">
            <button class="signup">로그인</button>
        </div>
    </header>

    <div class="login-container">
        <div class="login-box">
            <h1>Travelo</h1>
            <p>여행 준비, 이제 더 쉬워집니다!</p>
            
            <button class="email-btn" onclick="location.href='email_login.jsp'">이메일로 시작하기</button>
            <button class="kakao-btn">카카오로 시작하기</button>
            <button class="naver-btn">네이버로 시작하기</button>
        </div>
    </div>

</body>
</html>
