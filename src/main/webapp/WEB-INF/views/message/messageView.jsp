<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<sec:authentication property="principal" var="principal" />
<div id="board-datail"></div>
<div id="commentList"></div>
<script>
const messageList = () =>{
	location.href=`${pageContext.request.contextPath}/message/messagePage`;
};


const messageUpdate = (no) =>{
	location.href=`${pageContext.request.contextPath}/board/boardUpdate/\${no}`;
};

const messageDelete = (no) =>{
	console.log(no, event)
	 $.ajax({
		url:`${pageContext.request.contextPath}/board/boardDelete/\${no}`,
		method:"delete",
	})
	.done(data => {
		console.log(data)
		if(data > 0){
			location.href=`${pageContext.request.contextPath}/board/boardList`;
		}
	})
	.fail(console.log);
}

const messageDetail = () => {
	const url = window.location.href;
	const no = url.split("/")[6]
	console.log(no)
	
	 $.ajax({
		url:"${pageContext.request.contextPath}/message/messageDetail/"+no,
		dataType:"json",
	})
	.done(message => {
		console.log(message);
		const {no, content, senderId, senderName, regDate} = message;
		let html = `<div class="col-md-12 border-right">
						<div class="p-3 py-5">
							<div class="d-flex justify-content-between align-items-center mb-3">
								<h4 class="text-right">메세지</h4>
							</div>
							<div class="row mt-3">
							<div class="col-md-12">
								<label class="labels">글번호</label>
								<h2>\${no}</h2>
							</div>
						</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label class="labels">작성자</label>
									<p>\${senderName}</p>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label class="labels">아이디</label>
									<p>\${senderId}</p>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label class="labels">작성일</label>
									<p>\${regDate}</p>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label for="exampleFormControlTextarea2" class="labels">내용</label>
									<textarea class="form-control" id="exampleFormControlTextarea2"
										name="content" rows="3">\${content}</textarea>
								</div>
							</div>
							<div class="mt-5 text-center">
								<button class="btn btn-primary profile-button" type="button"
									onclick="messageList();">목록</button>
							</div>
						</div>
					</div>`;
		
		/* if(memberId == "${principal.id}") {
			html +=	`<button type="button" class="btn btn-primary" onClick="boardUpdate(\${no});">수정</button>
				<button type="button" class="btn btn-danger" onClick="boardDelete(\${no});">삭제</button>`;
		}; */
				
		$("#board-datail").html(html);
	})
	.fail(console.log)
}


$(function() {
	messageDetail();
	
})
</script>