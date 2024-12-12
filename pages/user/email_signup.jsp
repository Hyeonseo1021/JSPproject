<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.mindrot.jbcrypt.BCrypt" %> 
<%@ page import="utils.DBConnection" %>
<%
    String errorMessage = null;

    if (request.getMethod().equalsIgnoreCase("POST")) {
        // 사용자 입력값 가져오기
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");

        // 이메일 유효성 검사
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        if (email == null || !email.matches(emailRegex)) {
            errorMessage = "올바른 이메일 형식을 입력해주세요.";
        }

        // 비밀번호 유효성 검사
        String passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[!@#$%^&*()_+\\-=]).{8,}$";
        if (password == null || !password.matches(passwordRegex)) {
            errorMessage = "비밀번호는 최소 8자 이상이어야 하며, 숫자와 특수문자를 포함해야 합니다.";
        }

        // 비밀번호 일치 확인
        if (password != null && confirmPassword != null && !password.equals(confirmPassword)) {
            errorMessage = "비밀번호가 일치하지 않습니다.";
        }

        // 에러가 없을 때만 데이터베이스에 저장
        if (errorMessage == null) {
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                conn = DBConnection.getConnection();
                String sql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, name);
                pstmt.setString(2, email);
                pstmt.setString(3, hashedPassword);

                int result = pstmt.executeUpdate();

                if (result > 0) {
                    response.sendRedirect("email_login.jsp");
                    return;
                } else {
                    errorMessage = "회원가입에 실패했습니다. 다시 시도해주세요.";
                }

            } catch (SQLException e) {
                e.printStackTrace();
                errorMessage = "오류가 발생했습니다: " + e.getMessage();
            } finally {
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
    }
%>



 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup - Travelo</title>
    <link rel="stylesheet" href="../../static/email_login.css">
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
            <button class="signup" onclick="location.href='login.jsp'">로그인</button>
        </div>
    </header>

    <div class="login-container">
        <div class="login-box">
            <h1>Travelo</h1>
            <p>여행 준비, 이제 더 쉬워집니다!</p>
			<!-- 에러 메시지 표시 -->
            <% if (errorMessage != null) { %>
                <div class="error-message" style="color: red; margin-bottom: 20px; ">
                    <%= errorMessage %>
                </div>
            <% } %>
            <!-- 회원가입 폼 -->
            <form method="post">
                <div class="form-group">
                    <input type="text" name="name" placeholder="이름" required>
                </div>
                <div class="form-group">
                    <input type="email" name="email" placeholder="이메일" required>
                </div>
                <div class="form-group">
                    <input type="password" name="password" placeholder="비밀번호(8자 이상, 숫자/특수문자 포함)" required>
                </div>
                <div class="form-group">
                    <input type="password" name="confirm_password" placeholder="비밀번호 확인" required>
                </div>
                <button type="submit" class="email-btn">회원가입</button>
            </form>

            <!-- 로그인 페이지로 이동 링크 -->
            <div class="signup-link">
                <p>이미 회원이신가요? <a href="email_login.jsp">이메일로 로그인</a></p>
            </div>
        </div>
    </div>
</body>
</html>
