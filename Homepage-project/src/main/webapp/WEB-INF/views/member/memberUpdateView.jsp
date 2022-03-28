<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>회원</title>
<style type="text/css">
div.fo{ margin: 0 auto; width: 500px; padding:20px }
</style>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			$(".cancle").on("click", function(){				
				location.href = "/";						    
			})
		
			$("#submit").on("click", function(){
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
			});
			
				
			
		})
	</script>
<body>
	<div>
		<%@include file="/WEB-INF/views/board/nav.jsp"%>
	</div>
	<header style="margin-left: 20px">
		<h3>회원정보변경</h3>
	</header>
	<hr />
	<section id="container">
		<form action="/member/memberUpdate" method="post">
			<div class="fo">
				<label class="control-label" for="userId">아이디</label>
				<input class="form-control" type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly" />
			</div>
			<div class="fo">
				<label class="control-label" for="userPass">비밀번호</label>
				<input class="form-control" type="password" id="userPass" name="userPass" />
			</div>
			<div class="fo">
				<label class="control-label" for="userName">성명</label>
				<input class="form-control" type="text" id="userName" name="userName" value="${member.userName}" />
			</div>
			<div style="margin: 0 auto; width: 150px">
				<button type="submit" id="submit" style="width: 80px; padding: 8px 5px; border: 0px solid #999; border-radius: 0px; background: #4CAF50; color: white;">정보수정</button>
				<button class="cancle" type="button" style="width: 60px; padding: 8px 5px; border: 0px solid #999; border-radius: 0px; background: #D45353; color: white;">취소</button>
			</div>
		</form>
	</section>

</body>

</html>