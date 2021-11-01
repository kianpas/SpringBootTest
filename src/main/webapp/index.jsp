<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal" var="principal" />
<h1>DashBoard</h1>
<hr/>
<div class="row">
	<div class="col-md-5">
		<span>최근 작성된 글</span>
		<table class="table table-hover" id="indexBoardList"
			style="font-size: 12px">
		</table>
	</div>
</div>
<script>
const indexBoardList = () =>{
	$.ajax({
		url:"${pageContext.request.contextPath}/board/indexBoardList",
		contentType:"application/json; charset=utf-8"
	}).done(data => {
		//console.log(data)
		let html = `<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>`;
		
		const $container = $("#indexBoardList");
	
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

	}).fail(console.log);
};

const boardView = () => {
	event.preventDefault();
	const no = event.path[1].dataset.no;
	location.href="${pageContext.request.contextPath}/board/boardView/"+no;
}


$(function(){
	indexBoardList();
});
</script>
</body>
</html>