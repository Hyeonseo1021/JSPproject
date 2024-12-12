<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="utils.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>테마</title>
	<link rel="stylesheet" href="../../static/theme.css">
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

    <main>
        <section class="theme-intro">
            <h1>여행사</h1>
           
        </section>

        <section class="theme-list">
            <h2>목록</h2>
            <div class="themes">
                <% 
                    try {
                        Connection conn = DBConnection.getConnection();
                        Statement stmt = conn.createStatement();
                        String sql = "SELECT id, name, description, image_path FROM themes";
                        ResultSet rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                %>
                <div class="theme-card">
                    <img src="<%= rs.getString("image_path") %>" alt="<%= rs.getString("name") %>">
                    <h3><%= rs.getString("name") %></h3>
                    <p><%= rs.getString("description") %></p>
                    <button onclick="location.href='themeDetail.jsp?id=<%= rs.getInt("id") %>'">자세히 보기</button>
                </div>
                <% 
                        }
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 국내 여행 추천 어플 | 문의: contact@korea-travel.com</p>
    </footer>
</body>
</html>
