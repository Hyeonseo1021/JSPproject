<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="utils.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>home</title>
	<link rel="stylesheet" href="../../static/css/home.css">
	<script src="../../static/js/profile-dropdown.js" defer></script>
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
                <li><a href="../travel/agency.jsp">여행사</a></li>
                <li><a href="../travel/recommend.jsp">여행지 추천</a></li>
                <li><a href='../community/community.jsp'">커뮤니티</a></li>
                
            </ul>
        </nav>
        <div class="profile-container">
            <img src="../../static/images/profile.svg" alt="Profile" class="profile-icon" onclick="toggleDropdown()">
            <div class="dropdown-menu" id="profileDropdown">
            	<a href="../user/profile.jsp">프로필 수정</a>
            	<a href="../user/login.jsp">로그아웃</a>
        	</div>
        </div>
       
    </header>
  
    <!-- Travel Notice Section -->
    </div>

 <section id="notice">
        <h2>TRAVEL INFORMATION</h2>
        <p>대한민국의 다양한 지역 소식을 확인하고, 여행지를 추천받으세요!</p>
        
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
<!-- Dynamic Content Area -->
<div id="region-content">
    <!-- Gyeonggi -->
    <div id="gyeonggi" class="region-content active">
        <div class="notice-list">
            <div class="notice-item">
                <img src="../../static/images/hwaseong.jpg" alt="수원 화성">
                <h3>수원 화성</h3>
                <p>유네스코 세계문화유산으로 지정된 수원 화성을 둘러보세요.</p>
            </div>
            <div class="notice-item">
                <img src="../../static/images/everland.jpg" alt="에버랜드">
                <h3>에버랜드</h3>
                <p>경기도 용인의 대표 테마파크에서 즐거운 하루를!</p>
            </div>
            <div class="notice-item">
                <img src="../../static/images/koreanvillage.jpg" alt="한국 민속촌">
                <h3>한국 민속촌</h3>
                <p>전통 문화를 체험할 수 있는 한국 민속촌을 방문하세요.</p>
            </div>
            <div class="notice-item">
                <img src="../../static/images/DMZ.jpg" alt="DMZ">
                <h3>DMZ</h3>
                <p>분단의 역사를 느낄 수 있는 DMZ 관광지.</p>
            </div>
            <div class="notice-item">
                <img src="../../static/images/outlet.jpg" alt="파주 아울렛">
                <h3>파주 아울렛</h3>
                <p>쇼핑과 여유를 동시에 즐길 수 있는 파주 아울렛.</p>
            </div>
        </div>
        <button class="view-more" onclick="toggleViewMore(this, 'gyeonggi')">View More</button>
    </div>
</div>

            <!-- Gangwon -->
    <div id="gangwon" class="region-content">
        <div class="notice-list">
            <div class="notice-item">
                <img src="../../static/images/seoraksan.jpg" alt="설악산">
                <h3>설악산</h3>
                <p>설악산의 장엄한 풍경을 감상하고 자연과 하나가 되어보세요.</p>
            </div>
            <div class="notice-item">
                <img src="../../static/images/beach.jpg" alt="강릉 해변">
                <h3>강릉 해변</h3>
                <p>푸른 바다와 함께 강릉의 해변에서 힐링하세요.</p>
            </div>
            <div class="notice-item">
                <img src="../../static/images/skywalk.jpg" alt="원주 스카이워크">
                <h3>원주 스카이워크</h3>
                <p>아찔한 높이에서 자연을 감상할 수 있는 특별한 장소.</p>
            </div>
            <div class="notice-item">
                <img src="../../static/images/alpensia.jpg" alt="평창 알펜시아">
                <h3>평창 알펜시아</h3>
                <p>겨울 스포츠와 레저를 즐길 수 있는 평창의 대표 명소.</p>
            </div>
            <div class="notice-item">
                <img src="../../static/images/dakgalbi.jpg" alt="춘천 닭갈비">
                <h3>춘천 닭갈비</h3>
                <p>강원도의 맛을 느낄 수 있는 춘천 닭갈비 거리를 방문하세요.</p>
            </div>
        </div>
        <button class="view-more" onclick="toggleViewMore(this, 'gangwon')">View More</button>
    </div>
    

    
    <!-- Jeju -->
    <div id="jeju" class="region-content">
        <div class="notice-list">
            <div class="notice-item">
                <img src="static/images/jeju-hallasan.jpg" alt="한라산">
                <h3>한라산</h3>
                <p>제주의 상징, 한라산에서 자연의 아름다움을 느껴보세요.</p>
            </div>
            <div class="notice-item">
                <img src="static/images/seongsan-ilchulbong.jpg" alt="성산 일출봉">
                <h3>성산 일출봉</h3>
                <p>제주의 환상적인 일출을 감상할 수 있는 명소.</p>
            </div>
            <div class="notice-item">
                <img src="static/images/jeju-olle.jpg" alt="올레길">
                <h3>올레길</h3>
                <p>자연과 함께 걸을 수 있는 아름다운 제주의 길.</p>
            </div>
            <div class="notice-item">
                <img src="../../static/images/gallery1.jpg" alt="우도">
                <h3>우도</h3>
                <p>제주의 작은 섬, 우도에서 특별한 하루를 보내세요.</p>
            </div>
            <div class="notice-item">
                <img src="static/images/jeju-love.jpg" alt="러브랜드">
                <h3>러브랜드</h3>
                <p>제주에서 독특한 경험을 할 수 있는 테마파크.</p>
            </div>
        </div>
        <button class="view-more" onclick="toggleViewMore(this, 'jeju')">View More</button>
    </div>
</div>


            <!-- Other regions can be added here -->
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
        
    </section>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 국내 여행 추천 어플 | 문의: contact@korea-travel.com</p>
    </footer>
</body>
</html>