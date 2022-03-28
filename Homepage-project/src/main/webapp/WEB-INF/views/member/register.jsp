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
			// 취소
			$(".cancle").on("click", function(){
				location.href = "/login";
			})
		
			$("#submit").on("click", function(){
				
				if($("#userId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}
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
				var idChkVal = $("#idChk").val();
				if(idChkVal == "N"){
					alert("중복확인 버튼을 눌러주세요.");
					return false;
				}else if(idChkVal == "Y"){
					$("#regForm").submit();
				}
			});
		})
	function fn_idChk() {
		$.ajax({
			url : "/member/idChk",
			type : "post",
			dataType : "json",
			data : {
				"userId" : $("#userId").val()
			},
			success : function(data) {
				if (data == 1) {
					alert("중복된 아이디입니다.");
				} else if (data == 0) {
					$("#idChk").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
				}
			}
		})
	}
</script>
<body>
	<div>
		<%@include file="/WEB-INF/views/board/nav.jsp"%>
	</div>
	<header style="margin-left: 20px">
		<h3>회원가입</h3>
	</header>
	<hr />
		<section id="container">
			<form name="registerForm" action="/member/register" method="post">
				<div class="fo">
					<label class="control-label" for="userId">아이디</label>
					<input class="form-control" type="text" id="userId" name="userId" maxlength='10'/>
					<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N" style="margin-top: 5px">중복확인</button>
				</div>
				<div class="fo">
					<label class="control-label" for="userPass">비밀번호</label>
					<input class="form-control" type="password" id="userPass" name="userPass" maxlength='50'/>
				</div>
				<div class="fo">
					<label class="control-label" for="userName">성명</label>
					<input class="form-control" type="text" id="userName" name="userName" maxlength='10' />
				</div>
				<div style="margin: 0 auto; width: 150px">
					<button type="submit" id="submit" style="width: 80px; padding: 8px 5px; border: 0px solid #999; border-radius: 0px; background: #4CAF50; color: white;">회원가입</button>
					<button class="cancle" type="button" style="width: 60px; padding: 8px 5px; border: 0px solid #999; border-radius: 0px; background: #D45353; color: white;">취소</button>
				</div>
			</form>
		</section>
</body>

</html>