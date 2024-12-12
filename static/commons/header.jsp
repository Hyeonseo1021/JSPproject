<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header class="navbar">
        <div class="logo">Travelo</div>
        <div class="search-bar">
            <input type="text" placeholder="검색">
        </div>
        <nav>
            <ul>
                <li><a href="../travel/home.jsp">홈</a></li>
                <li><a href="../travel/agency.jsp">여행사</a></li>
                <li><a href="../travel/recommend.jsp">여행지 추천</a></li>
                <li><a href="../community/community.jsp">커뮤니티</a></li>
            </ul>
        </nav>
        <div class="profile-container">
            <img src="../../static/images/profile.svg" alt="Profile" class="profile-icon" onclick="toggleDropdown()">
            <div class="dropdown-menu" id="profileDropdown">
                <a href="../user/profile.jsp">프로필 수정</a>
                <a href="../user/login.jsp?action=logout">로그아웃</a>
            </div>
        </div>
</header>