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
<title>게시판</title>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			const formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				location.href = "/board/readView?userId=${scri.userId}"
					   + "&bno=${replyUpdate.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
		})
		
	</script>
<body>
	<div id="root">
		<div>
			<%@include file="nav.jsp"%>
		</div>
		<header style="margin-left: 20px">
			<h3>댓글수정</h3>
		</header>
		<hr />

		<section id="container">
			<form name="updateForm" role="form" method="post"
				action="/board/replyUpdate">
				<input type="hidden" id="userId" name="userId" value="${scri.userId}" />
				<input type="hidden" name="bno" value="${replyUpdate.bno}" readonly="readonly" />
				<input type="hidden" id="rno" name="rno" value="${replyUpdate.rno}" />
				<input type="hidden" id="page" name="page" value="${scri.page}">
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
				<table style="margin:0 auto; width: 800px; border: 1px solid #ccc;">
					<tbody>
						<tr>
							<td style="padding:20px;">
								<label for="content">댓글 내용</label>
								<br>
								<textarea id="content" name="content" rows="5" cols="92" maxlength='190' style="resize: none; vertical-align: middle; margin: 10px auto 0px auto;">${replyUpdate.content}</textarea>
								</td>
						</tr>
					</tbody>
				</table>
				<div style="margin: 0 auto; width: 120px; padding:10px" >
					<button type="submit" class="update_btn">저장</button>
					<button type="button" class="cancel_btn">취소</button>
				</div>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>