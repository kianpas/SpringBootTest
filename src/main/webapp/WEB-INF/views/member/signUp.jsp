<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div class="container rounded bg-white mt-3 mb-5">
	<div class="row">
		<div class="col-md-3 border-right">
			<div
				class="d-flex flex-column align-items-center text-center p-3 py-5">
				<img class="rounded-circle mt-5" width="150px"
					src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
			</div>
		</div>
		<div class="col-md-5 border-right">
			<div class="p-3 py-5">
				<div class="d-flex justify-content-between align-items-center mb-3">
					<h4 class="text-right">Sign Up</h4>
				</div>
				<form id="signUpForm">
					<div class="row mt-3">
						<div class="row mt-3">
							<div class="col-md-12">
								<label class="labels">아이디</label><input type="text"
									class="form-control" placeholder="아이디" value="" name="id">
								<button class="btn btn-primary profile-button btn-sm"
									type="button" id="checkBtn" disabled>중복 체크</button>
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-md-12">
								<label class="labels">비밀번호</label><input type="password"
									class="form-control" placeholder="비밀번호" value=""
									name="password">
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-md-12">
								<label class="labels">이름</label><input type="text"
									class="form-control" placeholder="이름" value="" name="name">
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-md-12">
								<label class="labels">성별</label>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="gender"
										id="flexRadioDefault1" value="M"> <label
										class="form-check-label" for="flexRadioDefault1">남</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="gender"
										id="flexRadioDefault2" value="F"> <label
										class="form-check-label" for="flexRadioDefault2">여</label>
								</div>
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-md-12">
								<label class="labels">전화번호</label><input type="text"
									class="form-control" placeholder="전화번호" value="" name="phone">
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-md-12">
								<label class="labels">E-Mail</label><input type="email"
									class="form-control" placeholder="E-Mail" name="email" value="">
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-md-12">
								<label class="labels">생년월일</label><input type="date"
									class="form-control" placeholder="생년월일" name="birthday">
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-md-12">
								<label class="labels">주소</label><input type="text"
									class="form-control" placeholder="주소" name="address">
							<!-- 	<div class="emp_addr">
									<label for="emp-addr" class="emp_addr_">주소</label> <img
										src="https://pics.gmkt.kr/pc/ko/myg/find_address.png"
										alt="주소찾기" class="addr-search" class="addr-search"
										onclick="jusoPop();"> <input id="zipNo" name="zipNo"
										type="text" class="emp_addr_input" readonly> <input
										id="roadAddrPart1" name="roadAddrPart1" type="text"
										class="emp_addr_input2" readonly> <input
										id="addrDetail" name="addrDetail" type="text"
										class="emp_addr_input2" placeholder="상세주소"> <input
										id="roadFullAddr" type="hidden" name="empAddr" value="테스트용">
								</div> -->
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-md-12">
								<label class="labels">취미</label>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" value="운동"
										id="flexCheckDefault" name="hobby"> <label
										class="form-check-label" for="flexCheckDefault">운동</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" value="음악"
										id="flexCheckChecked" name="hobby"> <label
										class="form-check-label" for="flexCheckChecked">음악</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" value="음악"
										id="flexCheckChecked" name="hobby"> <label
										class="form-check-label" for="flexCheckChecked">여행</label>
								</div>
							</div>
						</div>
					</div>
					<div class="mt-5 text-center">
						<button class="btn btn-primary profile-button" type="submit">Sign
							Up</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
$("#signUpForm").submit(event => {
	//event.preventDefault();
	const $signUpForm = $(event.target);
	const id = $signUpForm.find("[name=id]").val();
	const password = $signUpForm.find("[name=password]").val();
	const name = $signUpForm.find("[name=name]").val();
	const gender = $signUpForm.find("[name=gender]:checked").val();
	const birthday = $signUpForm.find("[name=birthday]").val();
	const email = $signUpForm.find("[name=email]").val();
	const phone = $signUpForm.find("[name=phone]").val();
	const address = $signUpForm.find("[name=address]").val();
	let hobby=[];
	const hobbyFn = $signUpForm.find("[name=hobby]:checked");
	
	hobbyFn.map((index, item)=>{
		hobby.push($(item).val())
	});

	const member = {id, password, name, gender, birthday, email, phone, address, hobby};

	 $.ajax({
		url:"${pageContext.request.contextPath}/member/insertMember",
		method:"POST",
		data:JSON.stringify(member),
		contentType:"application/json; charset=utf-8"
	}).done(data=>{
		console.log(data)
		if(data > 0){
			location.href="${pageContext.request.contextPath}";
		}
	}).fail(console.log);
	
})


//체크 버튼 활성화
$("[name=id]").change((event)=>{
	const id = $(event.target).val();

	if(id.length == 0){
		$("#checkBtn").attr("disabled", true);
	} else {
		$("#checkBtn").attr("disabled", false);
	}
	
})


$("#checkBtn").click(() => {
	const id = $("[name=id]").val();
	console.log(id)
	 $.ajax({
		url:"${pageContext.request.contextPath}/member/idCheckDuplicate",
		method:"GET",
		data:{id},
		contentType:"application/json; charset=utf-8"
	}).done(data => {
		console.log(data);
		data.available ? alert(`\${data.id}는 사용가능한 아이디입니다.`) 
					   : alert(`\${data.id}는 사용불가능한 아이디입니다.`)
	}).fail(console.log);
})


function jusoPop(){
	var pop = window.open("${pageContext.request.contextPath}/member/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, 
		rnMgtSn, bdMgtSn , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, 
		buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
		 document.form.roadFullAddr.value = roadFullAddr;
		 document.form.roadAddrPart1.value = roadAddrPart1;
		 document.form.addrDetail.value = addrDetail;
		 document.form.zipNo.value = zipNo;
}
</script>
</body>