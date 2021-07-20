<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<body id="body-pd">
	<header class="header" id="header">
		<div class="header_toggle">
			<i class='bx bx-menu' id="header-toggle"></i>
		</div>
		<div class="header_img">
			<img src="https://i.imgur.com/hczKIze.jpg" alt="">
		</div>
	</header>
	<div class="l-navbar" id="nav-bar">
		<nav class="nav">
			<div>
				<a href="#" class="nav_logo"> <i
					class='bx bx-layer nav_logo-icon'></i> <span class="nav_logo-name">BBBootstrap</span>
				</a>
				<div class="nav_list">
					<ul style="padding-left: 0px;">
						<li class="nav_link active" id="index-link"> 
							<i class='bx bx-grid-alt nav_icon'></i> 
							<span class="nav_name">Dashboard</span>
						</li>
						<li class="nav_link"> 
							<i class='bx bx-user nav_icon'></i>
							<span class="nav_name">Users</span>
						</li>
						<li class="nav_link" id="board-link">
							<i class='bx bx-spreadsheet nav_icon'></i> 
							<span class="nav_name">Board</span> 
						</li> 
						<li class="nav_link"> 
							<i class='bx bx-message-square-detail nav_icon'></i> 
							<span class="nav_name">Messages</span>
						</li> 
						<li class="nav_link"> 
							<i class='bx bx-bookmark nav_icon'></i> 
							<span class="nav_name">Bookmark</span>
						</li> 
						<li class="nav_link"> 
							<i class='bx bx-folder nav_icon'></i>
							<span class="nav_name">Files</span>
						</li> 
						<li class="nav_link" id="stat-link"> 
							<i class='bx bx-bar-chart-alt-2 nav_icon'></i> 
							<span class="nav_name">Stats</span>
						</li>
					</ul>
				</div>
			</div>
			<a href="#" class="nav_link"> <i class='bx bx-log-out nav_icon'></i>
				<span class="nav_name">SignOut</span>
			</a>
		</nav>
	</div>
	<div id="body-content">
		<jsp:include page="/WEB-INF/views/common/dashBoard.jsp" />
	</div>
	<script>

	
	$("#index-link").on("click", function(){
		
		window.history.pushState(null, null, "${pageContext.request.contextPath}/");	
		
		const html = `<jsp:include page="/WEB-INF/views/common/dashBoard.jsp" />`;
		$("#body-content").html(html);
		 window.onpopstate = function(event) {  //뒤로가기 이벤트를 캐치합니다.

			  history.back();   // pushState로 인하여 페이지가 하나 더 생성되기 떄문에 한번에 뒤로가기 위해서 뒤로가기를 한번 더 해줍니다.

			  console.log('뒤로가기 체크'); 

			 };


		
	});


	$("#board-link").on("click", function(){
		const html = `<jsp:include page="/WEB-INF/views/board/boardList.jsp" />`;
		$("#body-content").html(html);	

		const selectBoardList = () => {
			
			$.ajax({
				url:"${pageContext.request.contextPath}/board/selectBoardList",
				method:"GET",
				contentType:"application/json; charset=utf-8",
				success:data => {
					console.log(data)
					
					let html = `<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">제목</th>
										<th scope="col">작성자</th>
										<th scope="col">작성일</th>
									</tr>
								</thead>`;
					const $container = $("#boardList");

					$.each(data, (key, value) => {
						
							
						const {no, title, memberId, regDate} = value;
						const reg = moment(regDate).format("YYYY[년] MMMM Do ");
						html += `<tr id="board-detail">
										<td>\${no}</td>
										<td>\${title}</td>
										<td>\${memberId}</td>
										<td>\${reg}</td>
									</tr>`;

					});
					
					$container.html(html);
					history.pushState(null, null, "${pageContext.request.contextPath}/board/boardList");

					 
					
				},
				error:console.log


			});
			
		}
		
		selectBoardList();

		$(document).on("click", "#board-detail", function(e){
			console.log(e)

		})
		

	})
	
document.addEventListener("DOMContentLoaded", function(event) {

		const showNavbar = (toggleId, navId, bodyId, headerId) =>{
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

		showNavbar('header-toggle','nav-bar','body-pd','header')

		/*===== LINK ACTIVE =====*/
		const linkColor = document.querySelectorAll('.nav_link')

		function colorLink(){
			if(linkColor){
				linkColor.forEach(l=> l.classList.remove('active'))
				this.classList.add('active')
			}
		}
		
		linkColor.forEach(l=> l.addEventListener('click', colorLink))

		// Your code to run since DOM is loaded and ready
	
		
		/*
			const html = `<jsp:include page="/WEB-INF/views/common/dashBoard.jsp" />`;
			$("#body-content").html(html);	
			window.history.pushState(null, null, "${pageContext.request.contextPath}/dashBoard");	

			/* $(window).on('popstate', function(event) {
		        window.location = document.location.href;
		    }); 
		}) */
	
	

		$("#stat-link").on("click", function(){
		/* 	$("#body-content").load("stat.jsp"); */

		})
		

				
	
});


</script>
</body>
</html>