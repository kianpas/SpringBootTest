<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<sec:authentication property="principal" var="principal" />
<h1>Board Form</h1>
<div class="container rounded bg-white mt-3 mb-5">
	<div class="row">
		<form id="messageEnrollFrm">
			<div class="col-md-12 border-right">
				<div class="p-3 py-5">
					<div class="d-flex justify-content-between align-items-center mb-3">
						<h4 class="text-right">메세지 작성</h4>
					</div>
					<!-- <div class="row mt-3">
						<div class="col-md-12">
							<label class="labels">제목</label><input type="text"
								class="form-control" placeholder="제목" name="title">
						</div>
					</div> -->
					<div class="row mt-3">
						<div class="col-md-12">
							<label class="labels">보내는 대상</label><input type="text"
								class="form-control" value="" name="receiverId">
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
$("#messageEnrollFrm").submit(e => {
	e.preventDefault();
	//jquery객체로 바꿈
	const $frm = $(e.target);

	const senderId = "${principal.id}";
	const receiverId = $frm.find("[name=receiverId]").val();
	const content = $frm.find("[name=content]").val();
	const message = {senderId, content, receiverId};
	console.log(message)

	$.ajax({
		url:"${pageContext.request.contextPath}/message/messageEnroll",
		data:JSON.stringify(message),
		method:"post",
		contentType:"application/json; charset=utf-8",
	})
	.done(data=>{
		/* const {result, boardNo} = data;
		 if(result > 0){
			location.href="${pageContext.request.contextPath}/message/messageView/"+boardNo;
		} */
	})
	.fail(console.log)
})

</script>