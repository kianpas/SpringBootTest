<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<sec:authentication property="principal" var="principal" />
<div id="board-datail"></div>

<script>
const boardList = () =>{
	location.href=`${pageContext.request.contextPath}/board/boardList`;
};


const boardUpdate = (no) =>{
	location.href=`${pageContext.request.contextPath}/board/boardUpdate/\${no}`;
};

const boardDelete = (no) =>{
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
		const {no, title, memberId, content, regDate, readCount, name} = board;
		let html = `<div class="col-md-12 border-right">
						<div class="p-3 py-5">
							<div class="d-flex justify-content-between align-items-center mb-3">
								<h4 class="text-right">게시글</h4>
							</div>
							<div class="row mt-3">
							<div class="col-md-12">
								<label class="labels">글번호</label>
								<h2>\${no}</h2>
							</div>
						</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label class="labels">제목</label>
									<h2>\${title}</h2>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label class="labels">작성자</label>
									<p>\${name}</p>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-md-12">
									<label class="labels">아이디</label>
									<p>\${memberId}</p>
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
									onclick="boardList();">목록</button>
							</div>
						</div>
					</div>`;
		
		if(memberId == "${principal.id}") {
			html +=	`<button type="button" class="btn btn-primary" onClick="boardUpdate(\${no});">수정</button>
				<button type="button" class="btn btn-danger" onClick="boardDelete(\${no});">삭제</button>`;
		};
				
		$("#board-datail").html(html);
	})
	.fail(console.log)
}


$(function() {
	boardDetail();
	
})
</script>