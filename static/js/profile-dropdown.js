function toggleDropdown() {
    var dropdown = document.getElementById("profileDropdown");
    if (dropdown.style.display === "block") {
        dropdown.style.display = "none";
    } else {
        dropdown.style.display = "block";
    }
}

// 메뉴 외부를 클릭하면 닫히도록 설정
document.addEventListener("click", function (event) {
    var dropdown = document.getElementById("profileDropdown");
    var profileIcon = document.querySelector(".profile-icon");
    if (dropdown && profileIcon && !profileIcon.contains(event.target) && !dropdown.contains(event.target)) {
        dropdown.style.display = "none";
    }
});