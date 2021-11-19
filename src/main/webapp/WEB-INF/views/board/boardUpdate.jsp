<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div>
	<form id="boardUpdateFrm">
	<input type="hidden" name="no">
		<div class="input-group mb-3">
			<span class="input-group-text">제목</span> <input type="text"
				class="form-control" name="title" placeholder="제목">
		</div>
		<div class="input-group mb-3">
			<span class="input-group-text">아이디</span> <input type="text" readonly
				class="form-control" name="memberId" placeholder="내용" value="qwerty">
		</div>
		<div class="mb-3">
			<label for="exampleFormControlTextarea1" class="form-label">내용</label>
			<textarea class="form-control" id="exampleFormControlTextarea1"
				name="content" rows="3"></textarea>
		</div>
		<button type="submit" class="btn btn-primary">전송</button>
		<button class="btn btn-danger" id="back-btn">취소</button>
	</form>
	<div id="board-datail"></div>
</div>

<script>
$("#back-btn").on("click", ()=>{
	location.href=`${pageContext.request.contextPath}/board/boardView`;
})


$("#boardUpdateFrm").submit(event=>{
	event.preventDefault();
	console.log(event.target)
	const frmData = new FormData(event.target);
	const board = {};
	
	frmData.forEach((value, key)=>{
		board[key] = value;
	})
	
	console.log(board);
	 $.ajax({
			url:`${pageContext.request.contextPath}/board/boardUpdate/\${board.no}`,
			method:"put",
			dataType:"json",
			contentType:"application/json; charset=utf-8",
			data:JSON.stringify(board)
		})
		.done(data => {
			location.href=`${pageContext.request.contextPath}/board/boardView/\${board.no}`;
		})
		.fail(console.log)
})



//인라인처리
const boardUpdate = (no) =>{
	console.log(no);
	  $.ajax({
			url:`${pageContext.request.contextPath}/board/boardUpdate/\${board}`,
			method:"put"
	})
	.done(data => {
		console.log(data)
	})
	.fail(console.log);
};


const boardDetail = () => {
	const url = window.location.href;
	const no = url.split("/")[6]
	console.log(no)
	
	 $.ajax({
		url:"${pageContext.request.contextPath}/board/boardDetail/"+no,
		dataType:"json",
	})
	.done(data => {
		const {no, title, memberId, content, regDate, readCount} = data;
		const $upFrm = $("#boardUpdateFrm");
		$upFrm.find("[name=no]").val(no)
		$upFrm.find("[name=title]").val(title)
		$upFrm.find("[name=content]").val(content)
	})
	.fail(console.log)
}


$(function(){
	boardDetail();
	
})


	
</script>