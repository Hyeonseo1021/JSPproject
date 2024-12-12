<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="utils.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="../../static/css/home.css">
    <script src="../../static/js/profile-dropdown.js" defer></script>
</head>
<body>
	<%@ include file="../../static/commons/header.jsp" %>

    <section id="notice">
        <h2>TRAVEL INFORMATION</h2>
        <p>조회할 지역을 선택하세요.</p>

        <!-- Navigation Bar for Provinces -->
        <div class="region-nav">
            <button onclick="showContent('gyeonggi')">경기도</button>
            <button onclick="showContent('gangwon')">강원도</button>
            <button onclick="showContent('chungbuk')">충청북도</button>
            <button onclick="showContent('chungnam')">충청남도</button>
            <button onclick="showContent('jeonbuk')">전라북도</button>
            <button onclick="showContent('jeonnam')">전라남도</button>
            <button onclick="showContent('gyeongbuk')">경상북도</button>
            <button onclick="showContent('gyeongnam')">경상남도</button>
            <button onclick="showContent('jeju')">제주도</button>
        </div>

        <!-- Dynamic Content Area -->
        <div id="region-content">
            <% 
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                String[] regions = {"gyeonggi", "gangwon","chungbuk","chungnam","jeonbuk","jeonnam","gyeongbuk","gyeongnam", "jeju"};
                try {
                    conn = DBConnection.getConnection();
                    for (String region : regions) {
                        String sql = "SELECT name, description, image_url FROM spots WHERE region_code = ? LIMIT 6";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, region);
                        rs = pstmt.executeQuery();
            %>
            <div id="<%= region %>" class="region-content <% if (!region.equals(regions[0])) out.print(""); else out.print("active"); %>">
                <div class="notice-list">
                    <% 
                        while (rs.next()) { 
                            String imageUrl = rs.getString("image_url");
                    %>
                    <div class="notice-item">
                        <img src="<%= request.getContextPath() %>/<%= imageUrl != null && !imageUrl.isEmpty() ? imageUrl : "static/images/default.jpg" %>" alt="<%= rs.getString("name") %>">
                        <h3><%= rs.getString("name") %></h3>
                        <p><%= rs.getString("description") %></p>
                    </div>
                    <% 
                        } // end while 
                    %>
                </div>
                <button class="view-more" onclick="toggleViewMore(this, '<%= region %>')">View More</button>
            </div>
            <% 
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException ignored) {}
                    if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
                }
            %>
        </div>
    </section>

    <script>
        function showContent(region) {
            // 모든 콘텐츠 숨기기
            const contents = document.querySelectorAll('.region-content');
            contents.forEach(content => content.classList.remove('active'));

            // 선택된 콘텐츠 보이기
            const selectedContent = document.getElementById(region);
            if (selectedContent) {
                selectedContent.classList.add('active');
            }
        }

        function toggleViewMore(button, regionId) {
            const region = document.getElementById(regionId);
            const noticeList = region.querySelector('.notice-list');
            const isExpanded = noticeList.classList.toggle('expanded');

            button.textContent = isExpanded ? 'View Less' : 'View More';
            noticeList.style.maxHeight = isExpanded ? 'none' : '300px'; // Adjust '300px' as needed
        }
    </script>

    <footer>
        <p>&copy; 2024 국내 여행 추천 어플 | 문의: contact@korea-travel.com</p>
    </footer>
</body>
</html>
