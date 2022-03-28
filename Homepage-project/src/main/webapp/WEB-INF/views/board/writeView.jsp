<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판</title>
<style type="text/css">
textarea{resize: none; vertical-align: middle;}
table.type { margin:0 auto;}
button{ width: 60px; padding: 8px 5px; border: 0px solid #999; border-radius: 0px; background: #4CAF50; color: white;}
</style>
</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
			$(".write_btn_notice").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/write_notice");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
	</script>
<body>
	<div id="root">
		<div>
			<%@include file="/WEB-INF/views/board/nav.jsp"%>
		</div>
		<header style="margin-left: 20px">
			<h3>글쓰기</h3>
		</header>
		<hr />
		<section id="container">
			<form name="writeForm" method="post">
				<table class="type">
					<tbody>
						<c:if test="${member.userId != null}">
							<tr>
								<td>
									<label for="title">제목</label>
									<input type="text" id="title" class="chk" title="제목을 입력하세요." name="title" size="100"  maxlength='50' style="line-height:30px; margin: 10px" placeholder= "제목을 입력해 주세요."/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="content">내용</label>
									<textarea id="content" name="content" class="chk" title="내용을 입력하세요." rows="10" cols="103" maxlength='1000' style="margin: 10px" placeholder= "내용을 입력해 주세요."></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<input type="hidden" id="writer" name="writer" value="${member.userName}" />
									<input type="hidden" id="userId" name="userId" value="${member.userId}" />
								</td>
							</tr>
							<tr>
								<td style="text-align: center">
								<c:if test="${member.userId != 'root'}">
										<button type="submit" class="write_btn">등록</button>
								</c:if>
								<c:if test="${member.userId == 'root'}">
									<button type="submit" class="write_btn_notice">등록</button>
								</c:if>
								</td>
							</tr>
						</c:if>
						<c:if test="${member.userId == null}">
							<p style="padding:20px;">로그인 후에 작성하실 수 있습니다.</p>
						</c:if>
						
					</tbody>
				</table>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>