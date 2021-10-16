<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<h1>Profile</h1>
<sec:authentication property="principal" var="principal" />
<div class="container rounded bg-white mt-3 mb-5">
	<div class="row">
		<div class="col-md-3 border-right">
			<div
				class="d-flex flex-column align-items-center text-center p-3 py-5">
				<img class="rounded-circle mt-5" width="150px"
					src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span
					class="font-weight-bold">${principal.name}</span><span
					class="text-black-50">${principal.email}</span><span> </span>
			</div>
		</div>
		<div class="col-md-5 border-right">
			<div class="p-3 py-5">
				<div class="d-flex justify-content-between align-items-center mb-3">
					<h4 class="text-right">Profile Settings</h4>
				</div>
				<div class="row mt-3">
					<div class="col-md-12">
						<label class="labels">이름</label><input type="text"
							class="form-control" placeholder="이름"
							value="${principal.name}">
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-md-12">
						<label class="labels">전화번호</label><input type="text"
							class="form-control" placeholder="전화번호" value="">
					</div>
					<div class="col-md-12">
						<label class="labels">E-Mail</label><input type="text"
							class="form-control" placeholder="E-Mail"
							value="${principal.email}">
					</div>
					<div class="col-md-12">
						<label class="labels">생년월일</label><input type="text"
							class="form-control" placeholder="생년월일" value="${principal.birthday}">
					</div>
					<div class="col-md-12">
						<label class="labels">주소</label><input type="text"
							class="form-control" placeholder="주소"
							value="${principal.address}">
					</div>
					<div class="col-md-12">
						<label class="labels">취미</label>
						<c:forEach var="hobby" items="${principal.hobby}">
							<span>${hobby}</span>
						</c:forEach>
						<input type="text" class="form-control"
							placeholder="enter address line 2" value="">
					</div>
					<div class="col-md-12">
						<label class="labels">State</label><input type="text"
							class="form-control" placeholder="enter address line 2" value="">
					</div>
					<div class="col-md-12">
						<label class="labels">Area</label><input type="text"
							class="form-control" placeholder="enter address line 2" value="">
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-md-6">
						<label class="labels">Country</label><input type="text"
							class="form-control" placeholder="country" value="">
					</div>
					<div class="col-md-6">
						<label class="labels">State/Region</label><input type="text"
							class="form-control" value="" placeholder="state">
					</div>
				</div>
				<div class="mt-5 text-center">
					<button class="btn btn-primary profile-button" type="button">Edit
						Profile</button>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="p-3 py-5">
				<div
					class="d-flex justify-content-between align-items-center experience">
					<span>Edit Experience</span><span
						class="border px-3 p-1 add-experience"><i
						class="fa fa-plus"></i>&nbsp;Experience</span>
				</div>
				<br>
				<div class="col-md-12">
					<label class="labels">Experience in Designing</label><input
						type="text" class="form-control" placeholder="experience" value="">
				</div>
				<br>
				<div class="col-md-12">
					<label class="labels">Additional Details</label><input type="text"
						class="form-control" placeholder="additional details" value="">
				</div>
			</div>
		</div>
	</div>
</div>
<h3>${principal.id}</h3>
<h3>${principal.gender}</h3>
<h3>${principal.enrollDate}</h3>










