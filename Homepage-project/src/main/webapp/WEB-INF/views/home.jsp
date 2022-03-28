<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>

<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>홈</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".login_btn").on("click", function() {
			if (fn_valiChk()) {
				return false;
			}
		})
		$("#logout_btn").on("click", function() {
			location.href = "member/logout";
		})
		$(".regist_btn").on("click", function() {
			location.href = "member/register";
		})

	})
	function fn_valiChk() {
		var regForm = $("form[name='homeForm'] .chk").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
</script>
</head>
<style type="text/css">
li a {
	color: black;
}

hr {
	width: 768px;
	border: 0;
	height: 3px;
	background: #ccc;
}
</style>
<body>
	<div>
		<%@include file="/WEB-INF/views/board/nav.jsp"%>
	</div>
	<form name='homeForm' method="post" action="/member/login">
		<div style="width: 1000px; margin: 0 auto; padding: 20px;">
			<c:if test="${member == null}">
				<div style="width: 315px; height: 150px; padding: 20px; float: right;">
					<div style="width: 184px; margin: 5px auto;">
						<label for="userId"></label>
						<input type="text" id="userId" name="userId" class="chk" title="아이디를 입력하세요." placeholder= "아이디">
					</div>
					<div style="width: 184px; margin: 5px auto;">
						<label for="userPass"></label>
						<input type="password" id="userPass" name="userPass" class="chk" title="비밀번호를 입력하세요." placeholder= "비밀번호">
					</div>
					<div style="  width: 136px; padding: 10px 0px; margin: 0 auto;">
						<button type="submit" class="login_btn">로그인</button>
						<button type="button" class="regist_btn">회원가입</button>
					</div>
					<c:if test="${msg == false}">
						<p style="color: red; clear: both;">아이디 또는 비밀번호를 잘못 입력했습니다.<br>다시 확인해주세요.</p>
					</c:if>
				</div>
			</c:if>
			<c:if test="${member != null }">
				<div style="width: 320px; height: 150px; float: right; padding: 20px; text-align: center;">
					<p style="width: 250px; margin: 20px auto 40px auto">${member.userName} 님환영합니다!</p>
					<button style="width: 75px;" id="logout_btn" type="button" style="margin-right: 30px">로그아웃</button>
				</div>
			</c:if>
			<div style="margin: 0 auto; clear: both; width: 80%; height:200px; padding: 10px 0px;">
				<hr />
				<span style="font-size: 1.5em; font-weight: bold;"><a href="/board/list_notice">공지사항</a></span>
				<ul>
					<c:forEach items="${list_notice}" var="list_notice">
						<li style="padding-left: 10px;">
							<a href="/board/readView_notice?bno=${list_notice.bno}&page=${scri_notice.page}&
																perPageNum=${scri_notice.perPageNum}&
																searchType=${scri_notice.searchType}&
																keyword=${scri_notice.keyword}">
									<c:out value="${list_notice.title}" />
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<hr />
			<div style="margin: 0 auto; clear: both; width: 80%; height:200px; padding: 10px 0px;">
				
				<span style="font-size: 1.5em; font-weight: bold;"><a
					href="/board/list">최근 글</a></span>
				<ul>
					<li>
						<ul>
							<c:forEach items="${list}" var="list">
								<li style="padding-left: 10px;"><a
									href="/board/readView?bno=${list.bno}&page=${scri.page}&
															perPageNum=${scri.perPageNum}&
															searchType=${scri.searchType}&
															keyword=${scri.keyword}">
										<c:out value="${list.title}" />
								</a></li>
							</c:forEach>
						</ul>
					</li>
				</ul>
				<hr />
			</div>
		</div>
	</form>
</body>
</html>
