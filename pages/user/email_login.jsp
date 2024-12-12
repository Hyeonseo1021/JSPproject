<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.mindrot.jbcrypt.BCrypt" %>
<%@ page import="utils.DBConnection" %>
<%
    String errorMessage = null;

    // POST 요청일 경우에만 로그인 처리
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email != null && password != null) {
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            
            try {
                // DB 연결
                conn = DBConnection.getConnection();
                
                // 이메일에 해당하는 사용자 검색 쿼리
                String sql = "SELECT * FROM users WHERE email = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, email);
                rs = stmt.executeQuery();
                
                if (rs.next()) {
                    // DB에서 가져온 비밀번호 (hashed 비밀번호)
                    String hashedPassword = rs.getString("password");
                    
                    // BCrypt로 비밀번호 비교
                    if (BCrypt.checkpw(password, hashedPassword)) {
                        // 로그인 성공 - 세션에 사용자 정보 저장 후 홈 페이지로 리디렉션
                        session.setAttribute("user", email);  // 세션에 이메일을 저장 (사용자 로그인 상태 관리)
                        response.sendRedirect("../travel/home.jsp");  // 홈 페이지로 리디렉션
                    } else {
                        // 비밀번호 틀림
                        errorMessage = "비밀번호가 틀렸습니다.";
                    }
                } else {
                    // 이메일 없음
                    errorMessage = "등록되지 않은 이메일입니다.";
                }
            } catch (SQLException e) {
                e.printStackTrace();
                errorMessage = "로그인 처리 중 오류가 발생했습니다.";
            } finally {
                // 자원 해제
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } else {
            errorMessage = "이메일 또는 비밀번호를 입력해주세요.";
        }
    }

    // 오류 메시지가 있으면 request에 전달
    if (errorMessage != null && !errorMessage.isEmpty()) {
        request.setAttribute("errorMessage", errorMessage);
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup - Travelo</title>
    <link rel="stylesheet" href="../../static/css/email_login.css">
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

            <!-- 이메일 로그인 폼 -->
            <form action="email_login.jsp" method="post">
                <div class="form-group">
                    <input type="email" name="email" placeholder="이메일" required>
                </div>
                <div class="form-group">
                    <input type="password" name="password" placeholder="비밀번호" required>
                </div>
                <button type="submit" class="email-btn" >로그인</button>
            </form>
			
			<div class="signup-link">
    			<p>아직 회원이 아니신가요? <a href="email_signup.jsp">이메일로 회원가입</a></p>
			</div>
			
			

        </div>
    </div>

</body>
</html>
