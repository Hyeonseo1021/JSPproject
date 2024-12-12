<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="utils.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>커뮤니티</title>
	<link rel="stylesheet" href="../../static/community.css">
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
        <section class="community-intro">
            <h1>커뮤니티</h1>
            
        </section>

        <section class="post-board">
            <h2>게시판</h2>
            <table class="post-table">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>날짜</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        try {
                            Connection conn = DBConnection.getConnection();
                            Statement stmt = conn.createStatement();
                            String sql = "SELECT id, title, author, created_at FROM posts ORDER BY created_at DESC";
                            ResultSet rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><a href="postDetail.jsp?id=<%= rs.getInt("id") %>"><%= rs.getString("title") %></a></td>
                        <td><%= rs.getString("author") %></td>
                        <td><%= rs.getDate("created_at") %></td>
                    </tr>
                    <% 
                            }
                            conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>
            <div class="post-actions">
                <button onclick="location.href='newPost.jsp'">새 글 작성</button>
            </div>
        </section>

        <section class="popular-posts">
            <h2>인기 게시물</h2>
            <ul>
                <% 
                    try {
                        Connection conn = DBConnection.getConnection();
                        Statement stmt = conn.createStatement();
                        String sql = "SELECT title, id FROM posts ORDER BY views DESC LIMIT 5";
                        ResultSet rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                %>
                <li><a href="postDetail.jsp?id=<%= rs.getInt("id") %>"><%= rs.getString("title") %></a></li>
                <% 
                        }
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </ul>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 국내 여행 추천 어플 | 문의: contact@korea-travel.com</p>
    </footer>
</body>
</html>
