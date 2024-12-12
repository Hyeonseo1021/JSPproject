<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="utils.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>테마</title>
    <link rel="stylesheet" href="../../static/css/agency.css">
    <script src="../../static/js/profile-dropdown.js" defer></script>
</head>
<body>
	<%@ include file="../../static/commons/header.jsp" %>

    <main>
        <section class="agency-intro">
            <h1>여행사</h1>
        </section>

        <section class="agency-list">
            <h2>목록</h2>
            <div class="agencies">
                <%
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        // 데이터베이스 연결
                        conn = DBConnection.getConnection();
                        
                        // 여행사 정보 조회 쿼리
                        String sql = "SELECT name, description, location, contact, logo_url FROM agency";
                        pstmt = conn.prepareStatement(sql);
                        rs = pstmt.executeQuery();

                        // 데이터 출력
                        while (rs.next()) {
                            String name = rs.getString("name");
                            String description = rs.getString("description");
                            String location = rs.getString("location");
                            String contact = rs.getString("contact");
                            String logoUrl = rs.getString("logo_url");
                %>
                            <div class="agency-item">
                               	<img class="agency-logo" src="<%= request.getContextPath() %>/<%= logoUrl != null && !logoUrl.isEmpty() ? logoUrl : "static/images/default.jpg" %>" alt="<%= rs.getString("name") %>">
                                <h3><%= name %></h3>
                                <p><%= description %></p>
                                <p>위치: <%= location %></p>
                                <p>연락처: <%= contact %></p>
                            </div>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                %>
                        <p>여행사 정보를 가져오는 중 오류가 발생했습니다.</p>
                <%
                    } finally {
                        if (rs != null) try { rs.close(); } catch (Exception e) {}
                        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
                        if (conn != null) try { conn.close(); } catch (Exception e) {}
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
