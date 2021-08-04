<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/index.jsp" />
<div>
	<%-- <h2>${board.no}  ${board.title}</h2>
	<p>작성자 ${board.memberId}</p>
	<p>작성일 ${board.regDate}</p>
	<h3>내용</h3>
	<p>${board.content}</p> --%>
	<div id="board-datail">
	</div>

</div>
<script>
const boardUpdate = (no) =>{
	location.href=`${pageContext.request.contextPath}/board/boardUpdate/\${no}`;
};

const boardDelete = (no) =>{
	console.log(no, event)
	 $.ajax({
		url:`${pageContext.request.contextPath}/board/boardDelete/\${no}`,
		method:"delete",
	})
	.done(data=>{
		console.log(data)
		if(data>0){
			location.href=`${pageContext.request.contextPath}/board/boardList`;
		}
	})
	.fail(console.log);
}

const boardDetail = () => {
	const url = window.location.href;
	const no = url.split("/")[6]
	console.log(no)
	
	 $.ajax({
		url:"${pageContext.request.contextPath}/board/boardDetail/"+no,
		dataType:"json",
	})
	.done(board => {
		console.log(board);
		const {no, title, memberId, content, regDate, readCount} = board;
		let html = `<h2>\${no}  \${title}</h2>
						<p>작성자 \${memberId}</p>
						<p>작성일 \${regDate}</p>
						<h3>내용</h3>
						<p>\${content}</p>
						<button type="button" class="btn btn-primary" onClick="boardUpdate(\${no});">수정</button>
						<button type="button" class="btn btn-danger" onClick="boardDelete(\${no});">삭제</button>
						`;
		$("#board-datail").html(html);
	})
	.fail(console.log)
}


$(function() {
	boardDetail();
	
})
</script>