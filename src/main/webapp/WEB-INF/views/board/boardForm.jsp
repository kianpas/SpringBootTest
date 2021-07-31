<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/index.jsp" />
<div>
	<form id="boardEnrollFrm">
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
	</form>
</div>
<script>
$("#boardEnrollFrm").submit(e => {
	e.preventDefault();
	//jquery객체로 바꿈
	const $frm = $(e.target);
	
	const title = $frm.find("[name=title]").val();
	const memberId = $frm.find("[name=memberId]").val();
	const content = $frm.find("[name=content]").val();
	const board = {title, content, memberId};
	console.log(board)

	$.ajax({
		url:"${pageContext.request.contextPath}/board/boardEnroll",
		data:board,
		dataType:"json",
	})
	.done(data=>{
	})
	.fail(console.log)
})

</script>