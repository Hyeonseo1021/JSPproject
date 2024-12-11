<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="utils.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>dashboard</title>
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
                <li><a href="#">여행</a></li>
                <li><a href='../community/community.jsp'">커뮤니티</a></li>
                
            </ul>
        </nav>
        <div class="profile-container">
            <img src="../../static/images/profile.svg" alt="Profile" class="profile-icon">
        </div>
        <!-- 프로필 아이콘 넣기 -->
       
    </header>
</body>
</html>