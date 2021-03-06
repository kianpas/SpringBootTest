<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.5/pagination.min.js"
	integrity="sha512-1zzZ0ynR2KXnFskJ1C2s+7TIEewmkB2y+5o/+ahF7mwNj9n3PnzARpqalvtjSbUETwx6yuxP5AJXZCpnjEJkQw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.5/pagination.css"
	integrity="sha512-QmxybGIvkSI8+CGxkt5JAcGOKIzHDqBMs/hdemwisj4EeGLMXxCm9h8YgoCwIvndnuN1NdZxT4pdsesLXSaKaA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
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
	<div class="d-flex justify-content-center ">
		<div id="pagination-container"></div>
	</div>
</div>

<script>
const boardView = () => {
	event.preventDefault();
	const no = event.path[1].dataset.no;
	location.href="${pageContext.request.contextPath}/board/boardView/"+no;
}

const boardForm = () =>{
	location.href="${pageContext.request.contextPath}/board/boardForm";
}

const selectBoardList = () => {

	$.ajax({
		url:"${pageContext.request.contextPath}/board/selectBoardList",
		method:"GET",
		contentType:"application/json; charset=utf-8"
	}).done(data => {
		console.log(data)
		$('#pagination-container').pagination({
			dataSource: data,
			callback: function(data, pagination) {
			  const html = simpleTemplating(data);
			     $('#boardList').html(html);
			  }
		})	
	}).fail(console.log)	
}



const simpleTemplating = (data)=> {
	let html = `<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">제목</th>
			<th scope="col">작성자</th>
			<th scope="col">작성일</th>
		</tr>
	</thead>`;
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
    return html;
}



$(function(){
	selectBoardList();
})


</script>