<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SpringBoot Test</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css'
	rel='stylesheet'>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"
	integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"
	integrity="sha512-3kMAxw/DoCOkS6yQGfQsRY1FWknTEzdiz8DOwWoqf+eGRN45AmjS2Lggql50nCe9Q6m5su5dDZylflBY2YjABQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body id="body-pd" class="body-pd">
	<header class="header body-pd" id="header">
		<!-- <div class="header_toggle">
			<i class='bx bx-menu' id="header-toggle"></i>
		</div> -->
		
		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal" var="principal" />
			<p>${principal.name} 님</p>
			<div class="header_img">
				<img src="https://i.imgur.com/hczKIze.jpg" alt="">
			</div>
			<%-- <form:form action="${pageContext.request.contextPath}/logout"
				method="post">
				<button>로그아웃</button>
			</form:form> --%>
		</sec:authorize>
	</header>
	<div class="l-navbar show" id="nav-bar">
		<nav class="nav">
			<div>
				<a href="#" class="nav_logo"> <i
					class='bx bx-layer nav_logo-icon'></i> <span class="nav_logo-name">BBBootstrap</span>
				</a>
				<div class="nav_list">
					<ul style="padding-left: 0px;">
						<li class="nav_link" id="index-link"><i
							class='bx bx-grid-alt nav_icon'></i> <span class="nav_name">Dashboard</span>
						</li>
						<li class="nav_link" id="user-link"><i
							class='bx bx-user nav_icon'></i> <span class="nav_name">Profile</span></li>
						<li class="nav_link" id="board-link"><i
							class='bx bx-spreadsheet nav_icon'></i> <span class="nav_name">Board</span>
						</li>
						<li class="nav_link"><i
							class='bx bx-message-square-detail nav_icon'></i> <span
							class="nav_name">Messages</span></li>
						<li class="nav_link" id="bookmark"><i
							class='bx bx-bookmark nav_icon'></i> <span class="nav_name">Bookmark</span></li>
						<li class="nav_link"><i class='bx bx-folder nav_icon'></i> <span
							class="nav_name">Files</span></li>
						<li class="nav_link" id="stat-link"><i
							class='bx bx-bar-chart-alt-2 nav_icon'></i> <span
							class="nav_name">Stats</span></li>
					</ul>
				</div>
			</div>
			<sec:authorize access="isAnonymous()">
			<form:form action="${pageContext.request.contextPath}/login"
				method="post" id="login">
				<ul style="padding-left: 0px;">
						<li class="nav_link" id="login-link"> <i class='bx bx-log-in nav_icon' ></i>
							<span class="nav_name">Sign In</span>
						</li>
					</ul>
			</form:form>
		</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal" var="principal" />
				<form:form action="${pageContext.request.contextPath}/logout"
					method="post" id="logout">
					<ul style="padding-left: 0px;">
						<li class="nav_link" id="logout-link"> <i class='bx bx-log-out nav_icon'></i>
							<span class="nav_name">Sign Out</span>
						</li>
					</ul>
				</form:form>
			</sec:authorize>
		</nav>
	</div>
	<script>
	//대시보드, 인덱스
	$("#index-link").on("click", (event)=>{
		//event.preventDefault();
		location.href="${pageContext.request.contextPath}";
	})
	
	//게시판
	$("#board-link").on("click", ()=>{
		location.href="${pageContext.request.contextPath}/board/boardList";
	})
	
	//프로필
	$("#user-link").on("click", ()=>{
		location.href="${pageContext.request.contextPath}/member/profile";
	})
	
	//로그인
	$("#login-link").on("click", ()=>{
		$("#login").submit();
	})	
	
	//로그아웃
	$("#logout-link").on("click", ()=>{
		$("#logout").submit();
	})	

document.addEventListener("DOMContentLoaded", function(event) {

		/* const showNavbar = (toggleId, navId, bodyId, headerId) =>{
			const toggle = document.getElementById(toggleId),
				nav = document.getElementById(navId),
				bodypd = document.getElementById(bodyId),
				headerpd = document.getElementById(headerId)
	
			// Validate that all variables exist
			if(toggle && nav && bodypd && headerpd){
				toggle.addEventListener('click', ()=>{
					// show navbar
					nav.classList.toggle('show')
					// change icon
					toggle.classList.toggle('bx-x')
					// add padding to body
					bodypd.classList.toggle('body-pd')
					// add padding to header
					headerpd.classList.toggle('body-pd')
				})
			}
		}

		showNavbar('header-toggle','nav-bar','body-pd','header') */

		/*===== LINK ACTIVE =====*/
		const linkColor = document.querySelectorAll('.nav_link')

		function colorLink(){
			if(linkColor){
				linkColor.forEach(l=> l.classList.remove('active'))
				this.classList.add('active')
			}
		}
		
		linkColor.forEach(l=> l.addEventListener('click', colorLink))

	
});

</script>