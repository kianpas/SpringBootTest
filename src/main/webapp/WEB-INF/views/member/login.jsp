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
				<%-- <span
					class="font-weight-bold">${principal.name}</span><span
					class="text-black-50">${principal.email}</span><span> </span> --%>
			</div>
		</div>
		<div class="col-md-5 border-right">
			<form:form
				action="${pageContext.request.contextPath}/member/loginProcess"
				method="post">
				<div class="p-3 py-5">
					<div class="d-flex justify-content-between align-items-center mb-3">
						<h4 class="text-right">Log In</h4>
					</div>
					<div class="row mt-3">
						<div class="row mt-3">
							<div class="col-md-12">
								<label class="labels">아이디</label><input type="text" id="username" name="username"
									class="form-control" placeholder="아이디">
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-md-12">
								<label class="labels">비밀번호</label><input type="password" id="password"
									name="password" class="form-control" placeholder="비밀번호">
							</div>
						</div>
					</div>
					<div class="mt-5 text-center">
						<button class="btn btn-primary profile-button" type="submit">Login</button>
					</div>
				</div>
			</form:form>
		</div>

	</div>
</div>
</body>