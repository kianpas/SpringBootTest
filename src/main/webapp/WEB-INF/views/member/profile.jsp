<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<h1>개인 정보</h1>
<sec:authentication property="principal" var="principal" />
<div class="container rounded bg-white mt-3 mb-5">
	<div class="row">
		<div class="col-md-3 border-right">
			<div
				class="d-flex flex-column align-items-center text-center p-3 py-5">
				<img class="rounded-circle mt-5" width="150px"
					src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span
					class="font-weight-bold">${principal.name}</span><span>${principal.id}</span><span
					class="text-black-50">${principal.email}</span><span> </span>
			</div>
		</div>
		<div class="col-md-5 border-right">
			<div class="p-3 py-5">
				<div class="d-flex justify-content-between align-items-center mb-3">
					<h4 class="text-right">Profile</h4>
				</div>
				<!-- <form id="editForm"> -->
				<div class="row mt-3">
					<div class="row mt-3">
						<div class="col-md-12">
							<label class="labels">아이디</label><input type="text"
								class="form-control" placeholder="이름" value="${principal.id}">
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-md-12">
							<label class="labels">이름</label><input type="text"
								class="form-control" placeholder="이름" value="${principal.name}"
								id="name">
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-md-12">
							<label class="labels">전화번호</label><input type="text"
								class="form-control" placeholder="전화번호"
								value="${principal.phone}" id="phone">
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-md-12">
							<label class="labels">E-Mail</label><input type="text"
								class="form-control" placeholder="E-Mail"
								value="${principal.email}" id="email">
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-md-12">
							<label class="labels">생년월일</label><input type="text"
								class="form-control" placeholder="생년월일"
								value="${principal.birthday}" id="birthday">
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-md-12">
							<label class="labels">주소</label><input type="text"
								class="form-control" placeholder="주소"
								value="${principal.address}" id="address">
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-md-12" id="hobbyBtn">
							<label class="labels">취미</label>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="운동"
									id="exercise" name="hobby"> <label
									class="form-check-label" for="flexCheckDefault">운동</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="음악"
									id="music" name="hobby"> <label
									class="form-check-label" for="flexCheckChecked">음악</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="여행"
									id="tour" name="hobby"> <label class="form-check-label"
									for="flexCheckChecked">여행</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="등산"
									id="hike" name="hobby"> <label class="form-check-label"
									for="flexCheckChecked">등산</label>
							</div>
						</div>
					</div>
					<div class="mt-5 text-center">
						<button class="btn btn-primary profile-button" type="button"
							id="editBtn">Edit Profile</button>
					</div>
				</div>
				<!-- </form> -->
			</div>
		</div>
	</div>
</div>
<script>
$("#editBtn").click((event) => {
	//const $editForm = $(event.target);
	const id = '${principal.id}';
	const password = null;
	const name = $("#name").val();
	const gender = $("#gender").val();
	const birthday = $("#birthday").val();
	const email = $("#email").val();
	const phone = $("#phone").val();
	const address = $("#address").val();
	let hobby=[];
	const hobbyFn = $("[name=hobby]:checked");
	
	
	hobbyFn.map((index, item)=>{
		console.log($(item).val())
		hobby.push($(item).val())
	});
	
	console.log(gender);
	console.log(hobby);

	const member = {id, password, name, gender, birthday, email, phone, address, hobby};
	
	 $.ajax({
			url:"${pageContext.request.contextPath}/member/updateMember",
			method:"PUT",
			data:JSON.stringify(member),
			contentType:"application/json; charset=utf-8"
		}).done(data=>{
			console.log(data)
			if(data > 0){
				location.href="${pageContext.request.contextPath}";
			}
		}).fail(console.log);
});

//취미 체크
let hobbyArr = [];
<c:forEach var="hobby" items="${principal.hobby}">
	hobbyArr.push("${hobby}")
</c:forEach>
const $chkBox = $("[name=hobby]");

$chkBox.map((index, item) => {
	console.log(item.value)
 	const id = $(item).attr("id");
 	if(hobbyArr.includes(`\${item.value}`)){
		$(`#\${id}`).attr("checked", true)
 	 }

})

</script>











