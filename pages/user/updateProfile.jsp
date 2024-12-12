<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="utils.DBConnection" %>
<%@ page import="org.mindrot.jbcrypt.BCrypt" %>
<%
    // 세션에서 사용자 ID 가져오기
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("../user/login.jsp");
        return;
    }

    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirmPassword");

    String errorMessage = null;

    if (name != null) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();

            // 비밀번호 처리 로직
            String hashedPassword = null;
            if (password != null && !password.trim().isEmpty()) {
                if (!password.equals(confirmPassword)) {
                    errorMessage = "비밀번호가 일치하지 않습니다.";
                } else {
                    // 새로운 비밀번호 암호화
                    hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
                }
            } else {
                // 비밀번호가 입력되지 않은 경우 기존 비밀번호 유지
                String query = "SELECT password FROM users WHERE id = ?";
                pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, userId);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    hashedPassword = rs.getString("password");
                }
                rs.close();
                pstmt.close();
            }

            if (errorMessage == null) {
                // 사용자 정보 업데이트
                String updateQuery = "UPDATE users SET name = ?, password = ? WHERE id = ?";
                pstmt = conn.prepareStatement(updateQuery);
                pstmt.setString(1, name);
                pstmt.setString(2, hashedPassword);
                pstmt.setInt(3, userId);

                int rows = pstmt.executeUpdate();
                if (rows > 0) {
                    response.sendRedirect("profile.jsp"); // 성공 시 리디렉트
                } else {
                    errorMessage = "정보 수정에 실패했습니다.";
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            errorMessage = "서버 오류로 인해 정보를 수정할 수 없습니다.";
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    } else {
        errorMessage = "이름은 필수 입력 사항입니다.";
    }

    // 오류 메시지가 있으면 출력
    if (errorMessage != null) {
        out.println("<p style='color: red;'>" + errorMessage + "</p>");
        out.println("<a href='profile.jsp'>뒤로 가기</a>");
    }
%>
