<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div>
	<h1>게시판</h1>
	<div class="row">
		<div class="col offset-md-10">
			<sec:authorize access="isAuthenticated()">
				<button type="button" class="btn btn-primary" onClick="boardForm();">작성</button>
			</sec:authorize>
		</div>
	</div>
	<table class="table table-hover" id="boardList">
	</table>
</div>

<script>

const selectBoardList = () => {

	$.ajax({
		url:"${pageContext.request.contextPath}/board/selectBoardList",
		method:"GET",
		contentType:"application/json; charset=utf-8"
	}).done(data => {
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
				html += `<tr data-no="\${no}" onclick="boardView();">
								<td>\${no}</td>
								<td>\${title}</td>
								<td>\${memberId}</td>
								<td>\${reg}</td>
							</tr>`;
			});
			$container.html(html);
			
		}).fail(console.log)

	
}

const boardView = () => {
	event.preventDefault();
	const no = event.path[1].dataset.no;
	location.href="${pageContext.request.contextPath}/board/boardView/"+no;
}

const boardForm = () =>{
	location.href="${pageContext.request.contextPath}/board/boardForm";
}


$(function(){
	selectBoardList();
})
</script>