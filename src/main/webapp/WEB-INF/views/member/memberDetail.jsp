<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<h1>memberDetail</h1>
<sec:authentication property="principal" var="principal"/>
<h3>${principal.id}</h3>
<h3>${principal.name}</h3>
<h3>${principal.birthday}</h3>
<h3>${principal.email}</h3>
<h3>${principal.gender}</h3>
<h3>${principal.address}</h3>
<h3>${principal.hobby}</h3>
<h3>${principal.enrollDate}</h3>









