<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="utils.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profile</title>
    <link rel="stylesheet" href="../../static/profile.css">
</head>
<body>
    <header class="navbar">
        <div class="logo">Travelo</div>
        <div class="search-bar">
            <input type="text" placeholder="검색">
        </div>
        <nav>
            <ul>
                <li><a href="../travel/home.jsp">홈</a></li>
                <li><a href="../travel/theme.jsp">여행사</a></li>
                <li><a href="#">여행지 추천</a></li>
                <li><a href="../community/community.jsp">커뮤니티</a></li>
            </ul>
        </nav>
        <div class="profile-container">
            <img src="../../static/images/profile.svg" alt="Profile" class="profile-icon" onclick="location.href='../user/profile.jsp'">
        </div>
    </header>

    <main class="profile-main">
        <% // 수정해야 함
            // 사용자 정보를 가져오기 위한 데이터베이스 연결 및 쿼리 실행
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            String userName = "알 수 없음"; // 기본 값
            String userEmail = "알 수 없음"; // 기본 값
            int userId = 1; // 예시: 사용자 ID를 세션에서 가져와야 함

            try {
                conn = DBConnection.getConnection();
                String query = "SELECT name, email FROM users WHERE id = ?";
                ps = conn.prepareStatement(query);
                ps.setInt(1, userId);
                rs = ps.executeQuery();
                if (rs.next()) {
                    userName = rs.getString("name");
                    userEmail = rs.getString("email");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (Exception e) {}
                if (ps != null) try { ps.close(); } catch (Exception e) {}
                if (conn != null) try { conn.close(); } catch (Exception e) {}
            }
        %>

        <!-- 사용자 정보 섹션 -->
        <section class="profile-header">
            <img src="../../static/images/profile.svg" alt="Profile Picture" class="profile-picture">
            <h1><%= userName %></h1>
            <p>이메일: <%= userEmail %></p>
        </section>

        <!-- 여행 선호도 및 관심 지역 설정 -->
        <section class="preferences">
            <h2>여행 선호도 및 관심 지역</h2>
            <form action="updatePreferences.jsp" method="post">
                <div class="form-group">
                    <label for="travel-style">여행 스타일:</label>
                    <select id="travel-style" name="travelStyle">
                        <option value="adventure">모험</option>
                        <option value="relax">휴식</option>
                        <option value="cultural">문화 체험</option>
                        <option value="nature">자연 탐방</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="regions">관심 지역:</label>
                    <input type="text" id="regions" name="regions" placeholder="예: 제주도, 강원도">
                </div>
                <button type="submit">저장</button>
            </form>
        </section>

        <!-- 북마크한 여행지 -->
        <section class="bookmarked-places">
            <h2>북마크한 여행지</h2>
            <ul>
                <%
                    // 데이터베이스에서 북마크한 여행지 가져오기
                    try {
                        conn = DBConnection.getConnection();
                        String query = "SELECT place_name, location FROM bookmarks WHERE user_id = ?";
                        ps = conn.prepareStatement(query);
                        ps.setInt(1, userId);
                        rs = ps.executeQuery();
                        while (rs.next()) {
                %>
                <li>
                    <strong><%= rs.getString("place_name") %></strong> - <%= rs.getString("location") %>
                </li>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) try { rs.close(); } catch (Exception e) {}
                        if (ps != null) try { ps.close(); } catch (Exception e) {}
                        if (conn != null) try { conn.close(); } catch (Exception e) {}
                    }
                %>
            </ul>
        </section>

        <!-- 내 정보 관리 -->
        <section class="profile-management">
            <h2>내 정보 관리</h2>
            <form action="updateProfile.jsp" method="post">
                <div class="form-group">
                    <label for="name">이름:</label>
                    <input type="text" id="name" name="name" value="<%= userName %>">
                </div>
                
                <div class="form-group">
                    <label for="password">비밀번호 변경:</label>
                    <input type="password" id="password" name="password" placeholder="새 비밀번호">
                </div>
                <button type="submit">정보 수정</button>
            </form>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 국내 여행 추천 어플 | 문의: contact@korea-travel.com</p>
    </footer>
</body>
</html>
