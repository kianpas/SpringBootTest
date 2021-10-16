<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<sec:authentication property="principal" var="principal" />
<h1>Board Form</h1>
<div class="container rounded bg-white mt-3 mb-5">
	<div class="row">
		<%-- 	<form id="boardEnrollFrm">
			<div class="input-group mb-3">
				<span class="input-group-text">제목</span> <input type="text"
					class="form-control" name="title" placeholder="제목">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">아이디</span> <input type="text"
					readonly class="form-control" name="memberId" placeholder="내용"
					value="${principal.id}">
			</div>
			<div class="mb-3">
				<label for="exampleFormControlTextarea1" class="form-label">내용</label>
				<textarea class="form-control" id="exampleFormControlTextarea1"
					name="content" rows="3"></textarea>
			</div>
			<button type="submit" class="btn btn-primary">전송</button>
		</form> --%>
		<form id="boardEnrollFrm">
			<div class="col-md-12 border-right">
				<div class="p-3 py-5">
					<div class="d-flex justify-content-between align-items-center mb-3">
						<h4 class="text-right">Board Form</h4>
					</div>
					<div class="row mt-3">
						<div class="col-md-12">
							<label class="labels">제목</label><input type="text"
								class="form-control" placeholder="제목" name="title">
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-md-12">
							<label class="labels">아이디</label><input type="text"
								class="form-control" value="${principal.id}" name="memberId" readonly>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-md-12">
							<label for="exampleFormControlTextarea2" class="labels">내용</label>
							<textarea class="form-control" id="exampleFormControlTextarea2"
								name="content" rows="3"></textarea>
						</div>
					</div>
					<div class="mt-5 text-center">
						<button class="btn btn-primary profile-button" type="submit">
							등록</button>
					</div>
				</div>
			</div>
		</form>
	</div>
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
		method:"post",
		dataType:"json",
	})
	.done(data=>{
		const {result, boardNo} = data;
		 if(result > 0){
			location.href="${pageContext.request.contextPath}/board/boardView/"+boardNo;
		}
	})
	.fail(console.log)
})

</script>