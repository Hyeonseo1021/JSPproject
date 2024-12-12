<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="utils.DBConnection" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recommend</title>
    <link rel="stylesheet" href="../../static/css/recommend.css">
    <script src="../../static/js/profile-dropdown.js" defer></script>
        
</head>
<body>
	<%@ include file="../../static/commons/header.jsp" %>

    <div class="header">
        <button class="recommend-button" id="openModalBtn">맞는 제품 추천받기</button>
    </div>

    <!-- 팝업창 HTML -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" id="closeModalBtn">&times;</span>
            <h2>나에게 맞는 제품을 추천 받아보세요.</h2>
            <p>고민을 작성해주시면 맞는 제품이나 추천 조합을 고려하여 최대한 빠르게 답변 드리겠습니다.</p>
            
            <form>
                <div class="form-group">
                    <label for="name">성함</label>
                    <input type="text" id="name" placeholder="성함을 입력하세요">
                </div>
                <div class="form-group">
                    <label for="contact">답변 받으실 연락처</label>
                    <input type="text" id="contact" placeholder="예: 010-1234-5678">
                </div>
                <div class="form-group">
                    <label for="message">고민 내용</label>
                    <textarea id="message" rows="4" placeholder="고민 내용을 입력하세요"></textarea>
                </div>
                <button type="submit" class="submit-button">작성 완료</button>
            </form>
        </div>
    </div>
	 <footer>
        <p>&copy; 2024 국내 여행 추천 어플 | 문의: contact@korea-travel.com</p>
    </footer>
    <script>
        // 모달 열기 버튼과 닫기 버튼 선택
        const openModalBtn = document.getElementById("openModalBtn");
        const closeModalBtn = document.getElementById("closeModalBtn");
        const modal = document.getElementById("myModal");

        // 모달 열기 이벤트
        openModalBtn.addEventListener("click", () => {
            modal.style.display = "block";
        });

        // 모달 닫기 이벤트
        closeModalBtn.addEventListener("click", () => {
            modal.style.display = "none";
        });

        // 모달 외부 클릭 시 닫기
        window.addEventListener("click", (e) => {
            if (e.target === modal) {
                modal.style.display = "none";
            }
        });
    </script>
</body>
</html>
